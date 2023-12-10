/*

	Filename: 	SunriseServer_system_spikeStrip.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _spikeStrip = param [0,objNull,[objNull]];
if (isNull _spikeStrip) exitWith {};

[{!(nearestObjects[_this,["Car"],5] isEqualTo []) OR isNull _this}, {
	if (isNull _this) exitWith {};
	_vehicle = (nearestObjects[_this,["Car"],5]) select 0;

	if (isNil "_vehicle") exitWith {deleteVehicle _this;};
	[_vehicle] remoteExecCall ["SunriseClient_system_spikeStripEffect",_vehicle];
	deleteVehicle _this;
}, _spikeStrip] call CBA_fnc_waitUntilAndExecute
