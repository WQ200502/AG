/*

	Filename: 	SunriseClient_system_trunkCheck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _object = param [0,ObjNull,[ObjNull]];
if (isNull _object) exitWith {};

private _trunk = _object GVAR ["Trunk",[[],0]];
_trunk = _trunk select 0;
if (EQUAL(_trunk,[])) exitWith {};

private _newTrunk = [];
{
	if (isClass (missionConfigFile >> "LifeCfgVirtualItems" >> (_x select 0))) then {
		_newTrunk pushBack [_x select 0,_x select 1];
	} else {
		format ["Trunk Check - %1 is not Virtual Item. Removed from array",_x select 0] call SunriseClient_system_log; 
	};
} foreach _trunk;

private _trunkTotalWeight = 0;
{
	_trunkTotalWeight = _trunkTotalWeight + ((ITEM_WEIGHT(_x select 0)) * (_x select 1));
} forEach _newTrunk;

if (EQUAL(_newTrunk,[])) then {
	[_object,"Trunk"] call SunriseClient_system_clearGlobalVar;
} else {
	[_object,"Trunk",[_newTrunk,_trunkTotalWeight]] call CBA_fnc_setVarNet;
};