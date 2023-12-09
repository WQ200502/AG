/*
	
	Filename: 	SunriseClient_system_dropRadio.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (_unit getVariable ["newbie",false]) exitWith {["error","","Новичков нельзя грабить!"] call SunriseClient_message};
	
private _item = "";
{
	if (["tf_", _x] call SunriseClient_system_xString && !(EQUAL(_x,"tf_microdagr"))) exitWith {_item = _x};
} forEach (assignedItems _unit);
if (EQUAL(_item,"")) exitWith {hint localize "STR_NOTF_TargetDontHaveRadio"};

private _box = createVehicle ["groundWeaponHolder", player modelToWorld [0,0.8,0], [], 0.5, "CAN_COLLIDE"];
_box setDir floor (random 360);
_box addItemCargoGlobal [_item, 1];
_unit unlinkItem _item;

hint localize "STR_NOTF_RadioDropped";