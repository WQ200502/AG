/*

	Filename:   SunriseServer_system_updateGang.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
#include "..\..\script_macros.hpp"
if !(params [
	["_mode",0,[0]],
	["_group",grpNull,[grpNull]],
	["_uid","",[""]]
]) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {["error",format ["|updateGang| PARAMS=%1, GANG_ID=%2",_this,_groupID]] call SunriseServer_system_customLog};

switch (_mode) do {
	case 1: {
		diag_log format ["||updateGang updateGangBank|| %1",(_group getVariable ["gang_bank",0])];

		format ["updateGangBank:%1:%2",([(_group getVariable ["gang_bank",0])] call SunriseServer_database_numberSafe),_groupID] call SunriseServer_database_fireAndForget;
	};

	case 2: {
		diag_log format ["||updateGang updateSlots|| %1",[_groupID,_uid]];

		format ["updateSlots:%1:%2",_group getVariable ["gang_maxMembers",8],_groupID] call SunriseServer_database_fireAndForget;
	};

	case 3: {
		diag_log format ["||updateGang updateOwner|| %1",[_groupID,_uid]];
		_owner = _group getVariable ["gang_owner",""];
		if (_owner isEqualTo "") exitWith {};

		format ["updateOwner:%1:%2",_owner,_groupID] call SunriseServer_database_fireAndForget;
	};

	case 4: {
		diag_log format ["||updateGang setDeputy|| %1",[_groupID,_uid]];
		_deputy = _group getVariable ["gang_deputy","-1"];

		format ["setDeputy:%1:%2",_deputy,_groupID] call SunriseServer_database_fireAndForget;
	};

	case 5: {
		diag_log format ["||updateGang kickPlayer|| %1",[_groupID,_uid]];
		private _membersCount = _group getVariable ["gang_membersCount",0];
		_group setVariable ["gang_membersCount",(_membersCount - 1),true];

		format ["kickPlayer:%1",_uid] call SunriseServer_database_fireAndForget;
	};

	case 6: {
		diag_log format ["||updateGang invitePlayer|| %1",[_groupID,_uid]];
		private _membersCount = _group getVariable ["gang_membersCount",0];
		_group setVariable ["gang_membersCount",(_membersCount + 1),true];

		format ["invitePlayer:%1:%2",_groupID,_uid] call SunriseServer_database_fireAndForget;
	};

	case 7: {
		diag_log format ["||updateGang updateGangInfo|| %1",[_groupID,_uid]];
		private _gangInfo = _group getVariable ["gang_info",[]];
		if (_gangInfo isEqualTo []) exitWith {};
		
		format ["updateGangInfo:%1:%2",_gangInfo,_groupID] call SunriseServer_database_fireAndForget;
	};

	default {["error",format ["|updateGang| _mode not found PARAMS=%1",_this]] call SunriseServer_system_customLog}
};