/*
	
	Filename: 	SunriseClient_system_storeVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params[
	["_vehicle",objNull,[objNull]],
	["_sp","",[""]],
	["_typeV","",[""]],
	["_ishouse",false,[false]]
];

if (_sp isEqualTo "") then {
	_sp = "none"; 
	_typeV = "Car";
};

if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {hint localize "STR_NOTF_VehNotAlive";deleteVehicle _vehicle};
private _donatVehLastFire = _vehicle GVAR "donatVehLastFire";
if (!isNil "_donatVehLastFire" && {typeOf _vehicle in server_donat_vehicles} && {(time - _donatVehLastFire)  < 1200}) exitWith {
	hint format ["Вы стреляли из боевой техники %1 минут(ы) назад. Убрать ее можно будет через %2 минут(ы)", round ((time - _donatVehLastFire) / 60), round ((1200 - (time - _donatVehLastFire))/60)];
};


if (isNull _vehicle) exitWith {};
if !(EQUAL(crew _vehicle,[])) exitWith {hint "В технике кто-то есть."};
if ([_vehicle] call SunriseClient_system_isTrunkInUse) exitWith {hint "Вы не можете поставить машину в гараж, пока багажником кто-то пользуется"};

private _type = switch(true) do {
	case (_vehicle isKindOf "LandVehicle"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};		
	case (_vehicle isKindOf "Ship"): {"Ship"};		
};

if (_typeV != _type) exitWith { hint format ["Вы пытаетесь поставить в гараж технику класса %1, но гараж расчитан на технику класса %2. Найдите гараж соответствующего формата",_type,_typeV]; };

private _trunkData = _vehicle GVAR ["Trunk",[[],0]];
if (_ishouse && count (_trunkData select 0) != 0) exitWith {hint "В ваш частный гараж не поместится груженная техника. Отгоните ее в общественный гараж или освободите багажник."};

/*private _illegal = false;
{
	_index = [_x select 0,life_illegal_items] call SunriseClient_system_index;
	if (_index != -1) exitWith {_illegal = true;};
} foreach (_trunkData select 0);


if (_illegal) then {
	_action = [
	format["У вас в багажнике есть нелегальные ресурсы, которые больше не сохраняются в гараже! Вы уверены, что хотите поставить технику в гараж?"],
	"Внимание!",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	if (_action) then {
		[{[_this,"vehicleStore","SYS",false] call SunriseClient_system_hcExec}, [_vehicle,false,player,_sp], random [2,4,7]] call CBA_fnc_waitAndExecute;
		[localize "STR_Garage_Store_Server","info"] call SunriseClient_gui_bottomNotification;
		life_garage_store = true;
		closeDialog 0;
	};

} else {*/	
	[{[_this,"vehicleStore","SYS",false] call SunriseClient_system_hcExec}, [_vehicle,false,player,_sp], random [2,4,7]] call CBA_fnc_waitAndExecute;
	[localize "STR_Garage_Store_Server","info"] call SunriseClient_gui_bottomNotification;
	life_garage_store = true;
	closeDialog 0;
//};