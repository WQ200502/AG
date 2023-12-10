/*

	Filename: 	SunriseServer_system_updateGangWarPoints.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _crate = param [0];
private _player = param [1];
private _group = param [2];

[_crate,"priceTaked",true] call CBA_fnc_setVarNet;
_groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {diag_log "groupID = -1 fn_updateGangWarPoints"};

_groupNAME = _group getVariable ["gang_name",""];
["priceTaked",_groupNAME] remoteExecCall ["SunriseClient_warzones_message",-2];

_query = format ["UPDATE gangs SET warpoints=warpoints + 1 WHERE id='%1'",_groupID];

[_query,1] call SunriseServer_database_asyncCall;
