/*

	Filename: 	SunriseServer_system_saveVehicleRestart.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
{
	_dbInfo = _x getVariable ["dbInfo",[]];
	if !(_dbInfo isEqualTo []) then {
		if (alive _x) then {
			_dbInfo params ["_pid","_plate"];
			_class = typeOf _x;
			_pos = getPos _x;
			_dir = getDir _x;
			_owners = _x getVariable ["vehicle_info_owners", []];
			if (_owners isEqualTo []) exitWith {};

			
			format ["saveVehicle:%1:%2:%3:%4:%5:%6:%7",_pid,_plate,_class,_owners,_pos,_dir] call SunriseServer_database_fireAndForget;

		} else {
			if (_x getVariable ["isInsured",false]) then {
				format ["clearInsured:%1:%2",_dbInfo select 0,_dbInfo select 1] call SunriseServer_database_fireAndForget;
			} else {
				format ["clearNotInsured:%1:%2",_dbInfo select 0,_dbInfo select 1] call SunriseServer_database_fireAndForget;
			};
		};
	};
} forEach vehicles;