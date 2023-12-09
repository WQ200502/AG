/*

	Filename: 	SunriseClient_system_isShopNear.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {false};

private _shop = nearestObjects[getPosATL _unit,["Land_Laptop_device_F","Land_InfoStand_V1_F","Land_InfoStand_V2_F","Land_CashDesk_F","bv_terminal_base"],5];
private _return = if (count _shop > 0) then {true} else {false};

_return;