/*
	
	Filename: 	SunriseClient_system_postBail.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [1,ObjNull,[ObjNull]];
if (life_bail_paid) exitWith {};
if (isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if (!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if (BANK < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

["atm","take",life_bail_amount] call SunriseClient_system_myCash;
life_bail_paid = true;
[0,"STR_NOTF_Bail_Bailed",true,[GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];