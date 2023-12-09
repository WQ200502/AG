/*

	Filename:	SunriseClient_carsharing_stop.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

if (isNull life_cs_vehicle) exitWith {
	life_cs_start = 0;
	life_cs_vehicle = objNull;
	life_cs_renting = false;
	["carsharing"] call SunriseClient_gui_DestroyRscLayer;
	deleteMarkerLocal format["%1_cs",getPlayerUID player];
};
life_cs_vehicle setVelocity[0, 0, 0];
if !(alive life_cs_vehicle) exitWith {
	_fine = (LIFE_SETTINGS(getNumber,"life_cs_fine_notRoad") * 10);
	if (_fine > BANK) then {
		life_cs_warn = life_cs_warn + 1;
		hint format["Вы уничтожили автомобиль, так как у вас нет средств на погашение штрафа, вы получили %1-е предупреждение в сервисе", life_cs_warn];
	} else {
		["atm","take",_fine] call SunriseClient_system_myCash;
		hint format["Вы уничтожили автомобиль, с вас будет списано $%1 в качестве штрафа", _fine];
	};
	life_cs_start = 0;
	life_cs_vehicle = objNull;
	life_cs_renting = false;
	["carsharing"] call SunriseClient_gui_DestroyRscLayer;
	deleteMarkerLocal format["%1_cs",getPlayerUID player];
};
private _fine = 0;
private _text = "";
private _warns = 0;

private _nearestLoc = nearestLocations [player, ["NameCity","NameVillage", "NameCityCapital"], 1100] select 0;
if (isNil "_nearestLoc") then {
	_fine = _fine + LIFE_SETTINGS(getNumber,"life_cs_fine_distance");
	_text = _text + "Автомобиль был оставлен вне разрешенной зоны<br/>";
	_warns = _warns + 1;
};

private _parts_damaged = {life_cs_vehicle getHitPointDamage _x > 0.65} count ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitFuel","HitEngine","HitBody"];
if (_parts_damaged > 0) then {
	_fine = _fine + (_parts_damaged * LIFE_SETTINGS(getNumber,"life_cs_fine_damage"));
	_text = _text + "У автомобиля были обнаружены существенные повреждения<br/>";
	_warns = _warns + 1;
};

if !(isOnRoad life_cs_vehicle) then {
	_fine = _fine + LIFE_SETTINGS(getNumber,"life_cs_fine_notRoad");
	_text = _text + "Автомобиль был оставлен не на дороге<br/>";
	_warns = _warns + 1;
};

if (_warns > 0) then {
	if (_fine > BANK) then {
		life_cs_warn = life_cs_warn + _warns;
		hint parseText format["После прекращения аренды были выявлены следующие нарушения:<br/>%1. Так как у вас нет средств на погашение штрафа, вы получили %2-е предупреждение в сервисе", _text, life_cs_warn];
	} else {
		private _action = [
			parseText format["После прекращения аренды были выявлены следующие нарушения:<br/>%1 Вы готовы оплатить штраф в размере $%2? Если вы откажетесь, вы получите %3-е предупреждение в сервисе", _text, _fine, life_cs_warn + _warns],
			"Нарушения при прекращении аренды",
			localize "STR_Global_Yes",
			localize "STR_Global_No"
		] call BIS_fnc_guiMessage;
		if (_action) then {["atm","take",_fine] call SunriseClient_system_myCash} else {life_cs_warn = life_cs_warn + 1};
	};
};

[life_cs_vehicle] remoteExecCall ["SunriseServer_carsharing_stop",2];
["carsharing"] call SunriseClient_gui_DestroyRscLayer;
life_vehicles = life_vehicles - [life_cs_vehicle];
life_cs_start = 0;
life_cs_vehicle = objNull;
life_cs_renting = false;
deleteMarkerLocal format["%1_cs",getPlayerUID player];

["done","",format["Аренда автомобиля завершена"]] call SunriseClient_message;
[["vehicle",format["%1 (%2) ended rent",GVAR_RNAME(player),steamid]],"customLog"] call SunriseClient_system_hcExec;