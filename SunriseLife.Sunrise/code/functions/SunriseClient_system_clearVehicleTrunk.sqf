/*

	Filename: 	SunriseClient_system_clearVehicleTrunk.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {};

private _vehInv = _vehicle GVAR ["Trunk",[[],0]];
if (EQUAL((_vehInv select 0),[])) exitWith {};

_vehInv params ["_vehInvData","_vehInvVal"];

/*private ["_var","_val","_index"];
{
	_var = _x select 0;
	_val = _x select 1;

	_index = [_var,life_illegal_items] call SunriseClient_system_index;
	if !(EQUAL(_index,-1)) then {
		_vehInvData set [_forEachIndex,-1];
		_vehInvVal = _vehInvVal - ((ITEM_WEIGHT(_var)) * _val);
	};
} foreach _vehInvData;

_vehInvData = _vehInvData - [-1];*/

if (EQUAL(_vehInvData,[])) then {
	[_vehicle,"Trunk"] call SunriseClient_system_clearGlobalVar;
} else {	
	[_vehicle,"Trunk",[_vehInvData,_vehInvVal]] call CBA_fnc_setVarNet;
};