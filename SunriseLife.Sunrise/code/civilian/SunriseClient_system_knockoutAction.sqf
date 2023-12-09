/*

	Filename: 	SunriseClient_system_knockoutAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _target = param [0,ObjNull,[ObjNull]] ;

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};
if (([player] call SunriseClient_system_isShopNear) && !(life_copDuty)) exitWith {hint "Нельзя сбивать с ног рядом с продавцами"};
	
//if (random 1 > perk_hit) exitWith {["error","","Неудачный удар!"] call SunriseClient_message};	

life_knockout = true;

["CL3_anim_Punch2"] call SunriseClient_system_animDo;
uiSleep 0.5;
player say3D "kick";

[_target,steamid] remoteExec ["SunriseClient_system_knockedOut",_target];
uiSleep 3;
life_knockout = false;