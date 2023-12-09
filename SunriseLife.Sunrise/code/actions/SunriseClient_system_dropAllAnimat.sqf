/*

	Filename: 	SunriseClient_system_dropAllAnimat.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _curTarget = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};
if ([player] call SunriseClient_system_isSafeZone) exitWith {["error","",format[localize "STR_NOTF_GreenZone"]] call SunriseClient_message};
if ([player] call SunriseClient_system_isShopNear) exitWith {["error","",format[localize "STR_NOTF_ShopNear"]] call SunriseClient_message};
if (_curTarget getVariable ["newbie",false]) exitWith {["error","","Новичков нельзя грабить!",true] call SunriseClient_message};
	
_curTarget SVAR ["robbedinv",steamid,true];
[format["Раздеваем %1",(_curTarget GVAR ["realname",""])],25,"","",true,{(_curTarget GVAR ["robbedinv",""] != steamid)}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (_curTarget GVAR ["robbedinv",""] != steamid) exitWith {["error","",format["Действие недоступно кто-то его уже раздевает"],true] call SunriseClient_message};
_curTarget SVAR ["robbedinv",nil,true];
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};

[player] remoteExec ["SunriseClient_system_dropAll",_curTarget];
