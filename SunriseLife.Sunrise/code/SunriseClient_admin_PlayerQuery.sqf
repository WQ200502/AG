/*

	Filename: 	SunriseClient_admin_PlayerQuery.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _ret = param [0,objNull,[objNull]];
if (isNull _ret) exitWith {};

[BANK,CASH,FETCH_CONST(life_donator),life_licenses,player,call TFAR_fnc_activeSwRadio] remoteExecCall ["SunriseClient_admin_info",_ret];