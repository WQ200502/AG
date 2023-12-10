/*

	Filename:   SunriseServer_system_objectClean.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	
	
*/
params ["_object", "_delay"];
private _tick = _object getVariable "cleanup_tick";
private _deleted = false;

if (_object getVariable["cleanup_ignore", false]) exitWith {};
if (!isNil "_tick") then {
	if (diag_tickTime >= _tick) then {
		{detach _x; deleteVehicle _x} forEach (attachedObjects _object);
		deleteVehicle _object;
		_deleted = true;
	};
} else {
	_object setVariable["cleanup_tick", diag_tickTime + _delay];
};

_deleted