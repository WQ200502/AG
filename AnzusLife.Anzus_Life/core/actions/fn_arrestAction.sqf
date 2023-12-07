#include "..\..\script_macros.hpp"

private["_unit","_id","_time"];
_unit = param [0,objNull,[objNull]];
_time = param [1,30];
if (isNull _unit) exitWith {};
if (isNil "_unit") exitWith {};
if (!(_unit isKindOf "Man")) exitWith {};
if (!isPlayer _unit) exitWith {};
if (!(_unit getVariable "restrained")) exitWith {};
if (!((side _unit) in [civilian,independent,east])) exitWith {};
if (isNull _unit) exitWith {};

if(_time < 1) exitwith {};
if (isNull _unit) exitWith {};
detach _unit;

[_unit,false,_time,player] remoteExec ["ANZUS_fnc_initjail",_unit]; 