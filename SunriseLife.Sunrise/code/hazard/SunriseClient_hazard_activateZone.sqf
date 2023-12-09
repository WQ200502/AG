/*

	Filename: 	SunriseClient_hazard_activateZone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _trigger = _this;
private _anomalies = _trigger getVariable ["anomalies",[]];
if (_anomalies isEqualTo []) exitWith {};
if (_trigger getVariable ["zone_loading",false]) exitWith {};
_trigger setVariable ["zone_loading",true];

private _zone_triggers = [];
{ 
	{
		if ((player distance (_x select 0)) > 5) then {
			_anomaly = switch (_x select 1) do { 
				case 1 : {[_x select 0] call SunriseClient_system_createMeatgrinder};
				case 2 : {[_x select 0] call SunriseClient_system_createSpringboard};
				case 3 : {[_x select 0] call SunriseClient_system_createBurner};
				case 4 : {[_x select 0] call SunriseClient_system_createElectra};
				default {};
			};
			_anomaly setVariable ["anomaly_type", _x select 1];
			_zone_triggers pushBack _anomaly;
		};
	} call CBA_fnc_directCall
} foreach _anomalies;

anomalies_holder = anomalies_holder + _zone_triggers;
_trigger setVariable ["zone_triggers",_zone_triggers];
_trigger setVariable ["zone_loading",false];