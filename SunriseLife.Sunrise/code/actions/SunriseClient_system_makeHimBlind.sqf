/*
	
	Filename: 	SunriseClient_system_makeHimBlind.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];

if (isNull _unit OR (player distance _unit > 3) OR (EQUAL(player,_unit)) OR !isPlayer _unit) exitWith {}; //Not valid
if (_unit GVAR ["isBlind",false]) exitWith {};
if !(GVAR_RESTRAINED(_unit)) exitWith {};

if ( ([player] call SunriseClient_system_isSafeZone) && !(life_copDuty)) exitWith {hint localize "STR_NOTF_GreenZone"}; 
if ( ([player] call SunriseClient_system_isShopNear) && !(life_copDuty)) exitWith {hint localize "STR_NOTF_ShopNear"};
if (!(["srl_headBag"] call SunriseClient_system_removeItem) && !(life_copDuty)) exitWith {hint localize "STR_NOTF_DontHaveItem"};
	
player say3D "blind";

[player,steamid] remoteExec ["SunriseClient_system_blinded",_unit];