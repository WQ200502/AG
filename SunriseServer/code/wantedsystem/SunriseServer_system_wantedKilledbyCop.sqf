/*

	Filename:   SunriseServer_system_wantedKilledbyCop.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
params [
	["_unit",objNull,[objNull]],
	["_cop",objNull,[objNull]]
];
_unitId = getPlayerUID _unit;
if (isNull _unit || isNull _cop || _unitId isEqualTo "") exitWith {
	["error",format ["|wantedKilledbyCop| PARAMS=%1",_this]] call SunriseServer_system_customLog;
};

private _queryResult = format ["wantedBounty:%1",_unitId] call SunriseServer_database_selectSingleField;
if !(isNil "_queryResult") then {
	[_unitId] call SunriseServer_system_wantedRemove;
	[{[_this select 0] remoteExecCall ["SunriseClient_system_bountyReceive",(_this select 1)]}, [_queryResult,_cop], random [120,240,120]] call CBA_fnc_waitAndExecute;
};
