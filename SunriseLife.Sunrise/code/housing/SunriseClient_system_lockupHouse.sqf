/*

	Filename: 	SunriseClient_system_lockupHouse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};

private _numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if (_numberOfDoors <= 0) exitWith {};

titleText [localize "STR_House_LockingUp","PLAIN"];
uiSleep 3;

for "_i" from 1 to _numberOfDoors do {
	_house animate[format["door_%1_rot",_i],0];
	_house SVAR [format["bis_disabled_Door_%1",_i],1,true];
};

private _state = _house GVAR ["locked",false];

if (!_state) then {
	[_house] call SunriseClient_system_lockHouse;
};

titleText [localize "STR_House_LockedUp","PLAIN"];