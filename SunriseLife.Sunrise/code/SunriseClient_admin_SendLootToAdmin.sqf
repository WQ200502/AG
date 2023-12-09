/*
	
	Filename: 	SunriseClient_admin_SendLootToAdmin.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _admin = param [0,objNull,[objNull]];
if (isNull _admin) exitWith {};

private _playerItems = [] call SunriseClient_system_getPlayerItems;
[_playerItems] remoteExecCall ["SunriseClient_admin_UnitLootInfo",_admin];