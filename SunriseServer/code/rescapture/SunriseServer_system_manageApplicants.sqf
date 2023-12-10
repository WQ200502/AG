/*

    Filename:   SunriseServer_system_manageApplicants.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
private ["_changeApplicants","_index"];
params [
	["_register",true,[true]],
	["_resource","",[""]],
	["_group",grpNull,[grpNull]],
	["_player",objNull,[objNull]]
];

{ 
  if ((_x select 0) isEqualTo _resource) then {_changeApplicants = _x select 4;_index = _forEachIndex}; 
} forEach enabledCaptures;

private _gangID = _group GVAR ["gang_id",0];
private _gangName = _group GVAR ["gang_name",""];
if (_gangID isEqualTo 0 OR _gangName isEqualTo "" OR isNull _player) exitWith {};

if (_register) then {
	if (_gangID in (enabledCaptures select _index select 8)) exitWith {diag_log "manageApplicants Applicant is already in list"};
	_changeApplicants pushBack ([_gangName,_gangID]);
} else {
	_changeApplicants = [];
	{
		if ((_x select 0) != _gangName) then {_changeApplicants pushBack _x};
	} forEach (enabledCaptures select _index select 4);
};
format ["manageCaptures:%1:%2",_changeApplicants,_resource] call SunriseServer_database_fireAndForget;
diag_log (format ["RESOURCE CAPTURE:manageCaptures:%1:%2",_changeApplicants,_resource]);
uiSleep 1;
[] call SunriseServer_system_loadEnabledCaptures;
[] remoteExecCall ["SunriseClient_system_ResCaptureMenu",_player];