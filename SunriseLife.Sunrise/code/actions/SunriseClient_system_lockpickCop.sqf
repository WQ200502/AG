/*
	
	Filename: 	SunriseClient_system_lockpickCop.sqf
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
if (_curTarget in life_vehicles) exitWith {["error","",format[localize "STR_ISTR_Lock_AlreadyHave"]] call SunriseClient_message};


//[format[localize "STR_ISTR_Lock_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")],(20 * perk_bearcracker),"","",true,{player distance _curTarget > _distance}] call SunriseClient_system_progressBar;
[format[localize "STR_ISTR_Lock_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")],(15),"","",true,{player distance _curTarget > _distance}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};
if (player distance _curTarget > _distance) exitWith {["error","",format[localize "STR_ISTR_Lock_TooFar"]] call SunriseClient_message};


["done","",format[localize "STR_ISTR_Lock_Success"]] call SunriseClient_message;
life_vehicles pushBack _curTarget;
["VehicleLockpicked"] spawn SunriseClient_experience_addExp;