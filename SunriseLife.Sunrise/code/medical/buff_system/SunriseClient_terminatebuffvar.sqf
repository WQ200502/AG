#include "..\..\..\script_macros.hpp"
disableSerialization;
private _variable = param [0,"",[""]];

if (_variable isEqualTo "") exitWith {};
if (_variable in (getArray(missionConfigFile >> "Life_Settings" >> "dont_use_buffs"))) exitWith {};

missionNamespace setVariable [_variable,false];

if (isNull (missionnamespace getVariable [format ["%1_handler",_variable],objNull])) exitWith {};

terminate (missionnamespace getVariable format ["%1_handler",_variable]);
