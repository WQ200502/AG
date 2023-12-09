/*

	Filename: 	SunriseClient_system_boltcutter.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _building = param [0,ObjNull,[ObjNull]];
if (isNull _building) exitWith {};
if !(_building isKindOf "House_F") exitWith {["Вы должны смотреть на дверь!", "error"] call SunriseClient_gui_BottomNotification};
//if ([player] call SunriseClient_system_isSafeZone) exitWith {hint "Вы находитесь в зеленой зоне! Запрещено грабить, угонять технику и связывать людей!"};
if (_building in life_vehicles OR _building in life_tempHouses) exitWith {["У вас уже есть ключи от этого здания", "error"] call SunriseClient_gui_BottomNotification};
private _isFed = if ((nearestObject [[9684.1,8922.2,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[9684.1,8922.2,0],"Land_Research_house_V1_F"]) == _building) then {true} else {false};

private _door = [_building] call SunriseClient_system_nearestDoor;
if (EQUAL(_door,0)) exitWith {[localize "STR_House_Door_NotNear", "error"] call SunriseClient_gui_BottomNotification};

if ((_building GVAR [format["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {
	["Дверь уже была открыта, возможно в связи аномалиями на острове. Теперь она заперта и вы можете снова попробовать ее вскрыть", "error"] call SunriseClient_gui_BottomNotification;
	_building SVAR [format["bis_disabled_Door_%1",_door],1,true];
};
private ["_time","_marker","_error"];
private _error = "";
if !(_isFed) then {
	_house_owner_uid = _building GVAR "house_owner" select 0;
	if (isNil "_house_owner_uid") exitWith {_error = "У дома не прописан владелец"};
	if !([_house_owner_uid] call SunriseClient_system_isUIDActive) exitWith {_error = localize "STR_House_OwnerOffline"};
	_time = (1 * perk_bearcracker);
	if (_building GVAR ["house_security",false]) then {
		_time = _time * 1.5;
		_marker = createMarker [format["%1_houserob", steamid], getPos player];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "!Внимание! Домушник!";
		_marker setMarkerType "mil_warning";

		{
			if (EQUAL(getPlayerUID _x,_house_owner_uid)) exitWith {[0] remoteExecCall ["SunriseClient_system_raidAlert",_x]};
		} foreach allPlayers;
	};
} else {
	private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
	if (count units life_copGroup < _minCops) exitWith {_error = format[localize "STR_Civ_NotEnoughCops",_minCops]};
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
	_time = 240;
};
if (_error != "") exitWith {[_error, "error"] call SunriseClient_gui_BottomNotification};

[localize "STR_ISTR_Bolt_Process",_time,"","",true,{}] call SunriseClient_system_progressBar;
if (!isNil "_marker") then {deleteMarker _marker;};
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if (_isFed) then {
	_building SVAR [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
} else {
	if (random(100) > (60 * perk_cracker)) then {
		if (!(_building in life_tempHouses)) then {life_tempHouses pushBack _building};
		[[steamid,GVAR_RNAME(player),"459"],"wantedAdd"] call SunriseClient_system_hcExec;
		["Вы вскрыли входную дверь и завладели ключами!","done"] call SunriseClient_gui_BottomNotification;		
	} else {
		["Не удалось вскрыть дверь. Попробуйте еще.","error"] call SunriseClient_gui_BottomNotification;		
	};
};
[] call SunriseClient_fast_hudWeaponUpdate;