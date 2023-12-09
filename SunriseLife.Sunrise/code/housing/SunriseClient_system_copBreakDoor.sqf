/*
	
	Filename: 	SunriseClient_system_copBreakDoor.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
private _house_owner_uid = (_house GVAR "house_owner") select 0;
if (isNil "_house_owner_uid") exitWith {[localize "STR_House_Raid_NoOwner", "error"] call SunriseClient_gui_BottomNotification};
if !([_house_owner_uid] call SunriseClient_system_isUIDActive) exitWith {[localize "STR_House_Raid_OwnerOff", "error"] call SunriseClient_gui_BottomNotification};

private _door = [_house] call SunriseClient_system_nearestDoor;
if (EQUAL(_door,0)) exitWith {[localize "STR_Cop_NotaDoor", "error"] call SunriseClient_gui_BottomNotification};

if ((_house GVAR[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {[localize "STR_House_Raid_DoorUnlocked", "error"] call SunriseClient_gui_BottomNotification};

{
	if (EQUAL(getPlayerUID _x,_house_owner_uid)) exitWith {[1] remoteExecCall ["SunriseClient_system_raidAlert",_x]};
} foreach allPlayers;

private _time = 100;
if (IS_VIP) then {_time = _time call SunriseClient_system_timeDiscount};

[localize "STR_House_Raid_Progress",_time,"","",true,{}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if !(_house in life_vehicles) then {
	life_vehicles pushBack _house;
	["Дверь вскрыта и теперь у вас есть ключи от дома", "done"] call SunriseClient_gui_BottomNotification
};
