/*
	
	Filename: 	SunriseClient_system_robAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _target = param [0,ObjNull,[ObjNull]];
if (isNull _target) exitWith {};
if (!isPlayer _target OR (player distance _target > 5)) exitWith {};

if ([player] call SunriseClient_system_isSafeZone) exitWith {["error","",format[localize "STR_NOTF_GreenZone"]] call SunriseClient_message};
if ([player] call SunriseClient_system_isShopNear) exitWith {["error","",format[localize "STR_NOTF_ShopNear"]] call SunriseClient_message};
if (_target getVariable ["newbie",false]) exitWith {["error","","Новичков нельзя грабить!"] call SunriseClient_message};

if (_target GVAR ["robbed",false]) exitWith {};
[player,steamid] remoteExecCall ["SunriseClient_system_robPerson",_target];
["PlayerRobbed"] spawn SunriseClient_experience_addExp;
[_target,"robbed",true] call CBA_fnc_setVarNet;