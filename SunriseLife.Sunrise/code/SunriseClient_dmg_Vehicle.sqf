/*
	
	Filename: 	SunriseClient_dmg_Vehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_source",Objnull,[Objnull]]
];

if (isNull _unit OR isNull _source) exitWith {};
if (_unit GVAR ["dmgVehicle",false]) exitWith {};

if (!isNull life_DraggedBody) then {[] call SunriseClient_system_dropDeadBody};

private _driverName = getPlayerUID (driver _source);
private _message = format ["%1 пытался вас задавить! Сделайте скриншот, если считаете это намеренным наездом!",_driverName];

_unit SVAR ["dmgVehicle",true];
life_hit_by_car = true;
titleText [_message,"PLAIN"];
//systemchat _message;

["error","Нарушение",format ["%1 пытался вас задавить! Сделайте скриншот, если считаете это намеренным наездом!",_driverName],true] call SunriseClient_message;
[{_this SVAR ["dmgVehicle",false]}, _unit, 3] call CBA_fnc_waitAndExecute;