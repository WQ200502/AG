/*
	
	Filename: 	SunriseClient_system_restrainAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR (player distance _unit > 3) OR !isPlayer _unit OR EQUAL(player,_unit)) exitWith {}; //Not valid
if (GVAR_RESTRAINED(_unit)) exitWith {};
if (([player] call SunriseClient_system_isSafeZone) && !(life_copDuty OR life_medDuty)) exitWith {hint localize "STR_NOTF_GreenZone"}; 
if (([player] call SunriseClient_system_isShopNear) && !(life_copDuty OR life_medDuty)) exitWith {hint localize "STR_NOTF_ShopNear"};
if (_unit GVAR ["inPBfight",false]) exitWith {hint localize "STR_NOTF_PlayerInFight"};
	
private _sound = if (life_copDuty OR life_medDuty) then {
	"cuff";
} else {	
	selectRandom ["action_ducttape_0", "action_ducttape_1", "action_ducttape_2"];	
};
	
player say3D _sound;
titleText [localize "STR_NOTF_TargetRestrained","PLAIN"];

[_unit,"restrained",true] call CBA_fnc_setVarNet;
[player,steamid] remoteExec ["SunriseClient_system_restrain",_unit];