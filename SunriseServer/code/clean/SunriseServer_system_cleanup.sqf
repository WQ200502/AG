/*

	Filename:   SunriseServer_system_cleanup.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	
	
*/
private["_deleted", "_veh", "_dbInfo", "_units", "_uid", "_owner", "_type"];
while {true} do {
	sleep (5 * 60);

	{deleteVehicle _x} count allMissionObjects "CraterLong"; 
	{deleteVehicle _x} count allMissionObjects "#destructioneffects"; 
	{if ((damage _x) isEqualTo 1) then {hideObjectGlobal _x}} count (nearestTerrainObjects [getMarkerPos "spawn_kavala",["TREE", "SMALL TREE", "BUSH"], 750]);
	{if ((damage _x) isEqualTo 1) then {hideObjectGlobal _x}} count (nearestTerrainObjects [getMarkerPos "spawn_pd",["TREE", "SMALL TREE", "BUSH"], 500]);

	{
		_veh = _x;
		_type = typeOf _veh;
		switch (true) do {
			case (_type in ["GroundWeaponHolder", "WeaponHolderSimulated"]):{
					[_x, (5 * 60)] call SunriseServer_system_objectClean;
				};
			case (_type isEqualTo "Box_Wps_F"):{
					_units = playableUnits findIf {_x distance _veh < 15};
					if (_units isEqualTo -1) then {
						[_veh, (10 * 60)] call SunriseServer_system_objectClean;
					} else {
						_veh setVariable ["cleanup_tick",nil];
					};
				};
			case (_type isEqualTo getText(missionConfigFile >> "LifeCfgSettings" >> "life_ds_box")):{
					if (isNull attachedTo _veh) then {
						[_veh, (5 * 60)] call SunriseServer_system_objectClean
					} else {
						_veh setVariable ["cleanup_tick",nil];
					};
				};
			case ([_veh] call SunriseClient_system_isVehicleKind):{
					if (alive _veh) then {
						if (crew _veh isEqualTo []) then {
							_owners = _veh getVariable["vehicle_info_owners", []];
							if (_owners isEqualTo []) exitWith {};
							_uid = (_owners select 0) select 0;
							_units = playableUnits findIf {_x distance _veh < 150};
							_ownersOnline = _owners findIf {[_x#0] call SunriseClient_system_isUIDActive} > -1;
							if (_units isEqualTo -1 OR !_ownersOnline) then {
								_dbInfo = _veh getVariable["dbInfo", []];
								_deleted = [_veh, (15 * 60)] call SunriseServer_system_objectClean;
								if (_deleted) then {
									if !(_dbInfo isEqualTo []) then {
										format["clearNotActive:%1",_dbInfo select 0] call SunriseServer_database_fireAndForget;
									};
								};
							} else {
								_veh setVariable ["cleanup_tick",nil];
							};
						} else {
							_veh setVariable ["cleanup_tick",nil];
						};
					} else {
						_dbInfo = _veh getVariable["dbInfo", []];
						if !(_dbInfo isEqualTo []) then {
							if (_veh getVariable["isInsured", false]) then {
								format["clearInsured:%1",_dbInfo select 0] call SunriseServer_database_fireAndForget;
							} else {
								format["clearNotInsured:%1",_dbInfo select 0] call SunriseServer_database_fireAndForget;
							};
						}; 
						{detach _x; deleteVehicle _x} forEach (attachedObjects _veh);
						deleteVehicle _veh;
					};
				};
			default {};
		};
	} count allMissionObjects "All";
};