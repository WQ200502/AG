/*

	Filename:   SunriseServer_database_updateRequest.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
params [
	["_uid","",[""]],
	["_cash",0,[0]],
	["_bank",0,[0]],
	["_dcash",0,[0]],
	["_licenses",[],[[]]],
	["_gear",[],[[]]],
	["_tmptax",0,[0]],
	["_indicators",[],[[]]],
	["_craft",[],[[]]],
	["_deaths",0,[0]],
	["_connected",true,[true]],
	["_logout_pos",[],[[]]]
];

//Get to those error checks.
if (_uid isEqualTo "") exitWith {};

format ["updatePlayer:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_uid,_cash,_bank,_licenses,_gear,_craft,_deaths,_dcash,_connected,_logout_pos] call SunriseServer_database_fireAndForget;
format ["updatePlayerIndicators:%1:%2",_uid,_indicators joinString ":"] call SunriseServer_database_fireAndForget;

if (_tmptax > 0) then {format ["updateServerBank:%1",_tmptax] call SunriseServer_database_fireAndForget;};