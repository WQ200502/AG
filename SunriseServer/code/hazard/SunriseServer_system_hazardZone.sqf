/*

	Filename:   SunriseServer_system_hazardZone.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
private _randomPos = {
	params ["_pos", "_sza", "_szb"]; _pos params ["_psx", "_psy"];
	private _dsx = random _sza * 2 - _sza;
	private _dsy = random _szb * 2 - _szb;
	[_psx + (_dsx), _psy + (_dsy), 0]
};
private _zones = [
	[8250,7250],
	[8750,7250],
	[8750,7750],
	[8750,8250],
	[8750,8750],
	[9250,7250],
	[9250,7750],
	[9250,8250],
	[9250,8750],
	[9750,6750],
	[9750,7250],
	[9750,7750],
	[9750,8250],
	[9750,8750],
	[9750,9250],
	[9750,9750],
	[9750,10250],
	[10250,6750],
	[10250,7250],
	[10250,7750],
	[10250,8250],
	[10250,8750],
	[10250,9250],
	[10250,9750],
	[10250,10250],
	[10750,6750],
	[10750,7250],
	[10750,7750],
	[10750,8250],
	[10750,8750],
	[10750,9250],
	[10750,9750],
	[10750,10250],
	[11250,6750],
	[11250,7250],
	[11250,7750],
	[11250,8250],
	[11250,8750],
	[11250,9250],
	[11250,9750],
	[11250,10250],
	[11750,6250],
	[11750,6750],
	[11750,7250],
	[11750,7750],
	[11750,8250],
	[11750,8750],
	[11750,9250],
	[11750,9750],
	[11750,10250],
	[12250,6750],
	[12250,7250],
	[12250,7750],
	[12250,8250],
	[12250,8750],
	[12250,9250],
	[12250,9750],
	[12750,6750],
	[12750,7250],
	[12750,7750],
	[12750,8250],
	[12750,8750],
	[12750,9250],
	[12750,9750],
	[13250,6750],
	[13250,7250],
	[13250,7750],
	[13750,6250],
	[13750,6750],
	[13750,7250]];
{
	_anomalies = [];
	for "_i" from 1 to 100 do {  
		_pos = [_x,240,240] call _randomPos;
		if (!(surfaceIsWater _pos) OR (_pos distance hazard_quest < 15)) then {_anomalies pushBack [_pos,ceil random 4]} else {_i=_i-1};
	};
	
	_trigger = createTrigger ["EmptyDetector", _x];
	_trigger setVariable ["anomalies", _anomalies, true];
	[_trigger, [260, 260, 0, true]] remoteExecCall ["setTriggerArea", -2, true];
	[_trigger, ["ANYPLAYER", "PRESENT", true]] remoteExecCall ["setTriggerActivation", -2, true];
	[_trigger, [
		"(local vehicle player) && (vehicle player in thisList)",
		"if (vehicle player inarea hazard_zone) then {thisTrigger spawn SunriseClient_hazard_activateZone}",
		"thisTrigger spawn SunriseClient_hazard_deactivateZone"
	]] remoteExecCall ["setTriggerStatements", -2, true];

	format["HazardZone - Generate Anomalies #%1 - Generated: %2",_forEachIndex ,count _anomalies] call SunriseServer_system_log;
} forEach _zones;

format["HazardZone - Generate Anomalies - Finished"] call SunriseServer_system_log;

call SunriseServer_system_hazardSpawnLoot;