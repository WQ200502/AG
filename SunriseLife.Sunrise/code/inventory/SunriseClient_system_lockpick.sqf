/*
	
	Filename: 	SunriseClient_system_lockpick.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _curTarget = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};
if (isNull _curTarget) exitWith {}; //Bad type
private _distance = ((boundingBox _curTarget select 1) select 0) + 2;
if (player distance _curTarget > _distance) exitWith {}; //Too far

if !([_curTarget] call SunriseClient_system_isVehicleKind) exitWith {};
if (_curTarget in life_vehicles) exitWith {[localize "STR_ISTR_Lock_AlreadyHave","error"] call SunriseClient_gui_bottomNotification};
if ([player] call SunriseClient_system_isSafeZone) exitWith {["Вы находитесь в зеленой зоне! Запрещено грабить, угонять технику и связывать людей!","error"] call SunriseClient_gui_bottomNotification};
//if !(_curTarget getVariable ["vehicle_limits",""] isEqualTo "") exitWith {};


[_curTarget] remoteExecCall ["SunriseClient_vehicles_alarmSound",RCLIENT];

//[format[localize "STR_ISTR_Lock_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")],(25 * perk_bearcracker),"","",true,{player distance _curTarget > _distance}] call SunriseClient_system_progressBar;
[format[localize "STR_ISTR_Lock_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")],(15),"","",true,{player distance _curTarget > _distance}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if (player distance _curTarget > _distance) exitWith {[localize "STR_ISTR_Lock_TooFar","error"] call SunriseClient_gui_bottomNotification};
if !("srl_lockpick" in (magazines player)) exitWith {};

if (random(100) < 10) then {
	["srl_lockpick"] call SunriseClient_system_removeItem;
	["Набор отмычек сломался!","error"] call SunriseClient_gui_bottomNotification;
};

if (random 100 < (30 * perk_cracker)) then {
	[localize "STR_ISTR_Lock_Success","done"] call SunriseClient_gui_bottomNotification;
	life_vehicles pushBack _curTarget;
	[[steamid,GVAR_RNAME(player),"487"],"wantedAdd"] call SunriseClient_system_hcExec;
	["VehicleLockpicked"] spawn SunriseClient_experience_addExp;
} else {
	[localize "STR_ISTR_Lock_Failed","error"] call SunriseClient_gui_bottomNotification;	
	[[steamid,GVAR_RNAME(player),"215"],"wantedAdd"] call SunriseClient_system_hcExec;
	[0,"STR_ISTR_Lock_FailedNOTF",true,[GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
};
[] call SunriseClient_fast_hudWeaponUpdate;