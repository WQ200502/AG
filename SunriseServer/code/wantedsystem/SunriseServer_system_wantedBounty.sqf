/*

    Filename:   SunriseServer_system_wantedBounty.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
if !(params [
	["_unit",objNull,[objNull]],
	["_cop",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_wantedBounty| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _amount = format ["wantedBounty:%1",getPlayerUID _unit] call SunriseServer_database_selectSingleField;
if !(isNil "_amount") then {
	[_amount] remoteExecCall ["SunriseClient_system_bountyReceive",_cop];
};