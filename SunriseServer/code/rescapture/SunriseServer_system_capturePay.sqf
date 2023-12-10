/*

    Filename:   SunriseServer_system_CapturePay.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_processor","",[""]],
	["_gangID",-1,[0]],
	["_value",-1,[0]]
];
if (_gangID isEqualTo -1 OR _value isEqualTo -1) exitWith {diag_log "EXIT1";};
_gang = objNull;
{
    if (_gangID isEqualTo (_x getVariable ["gang_id", -1])) exitWith {_gang = _x;};
} forEach allGroups;

if !(isNull _gang) then {
	_gBank = _gang getVariable ["gang_bank", -1];
	if (_gBank isEqualTo -1) exitWith {};
	_gang setVariable ["gang_bank",(_gBank + _value),true];
	format ["updateGangBankOnline:%1:%2:%3:%4",(_gBank + _value),_gangID,_value,_processor] call SunriseServer_database_fireAndForget;
	diag_log (format ["RESOURCE CAPTURE:updateGangBankOnline:%1:%2:%3:%4",(_gBank + _value),_gangID,_value,_processor]);
} else {
	format ["updateCapturesBalance:%1:%2:%3",_value,_processor,_gangID] call SunriseServer_database_fireAndForget;
	diag_log (format ["RESOURCE CAPTURE:updateCapturesBalance:%1:%2:%4",_value,_processor,_gangID]);
};


uiSleep 1;
[] call SunriseServer_system_loadEnabledCaptures;