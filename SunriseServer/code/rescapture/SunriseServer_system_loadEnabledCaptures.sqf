/*

    Filename:   SunriseServer_system_loadEnabledCaptures.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
enabledCaptures = "enabledCaptures" call SunriseServer_database_selectFull; 
{
    private _applicantsNames = "";
	{
        if !((_x select 0) isEqualTo []) then {
            if (_applicantsNames isEqualTo "") then { 
                _applicantsNames = _x select 0;
            } else {
                _applicantsNames = format["%1,%2", _applicantsNames, _x select 0];
            };
        } else {
            _applicantsNames = _x;
        };
    }
    forEach(_x select 4);
	private _applicantsIDs = [];
	{
		_applicantsIDs pushback (_x select 1);
	}
    forEach(_x select 4);
    (enabledCaptures select _forEachIndex) set[5, format["%1-%2-%3 %4:%5", _x select 5 select 2, _x select 5 select 1, _x select 5 select 0, _x select 5 select 3, _x select 5 select 4]];
    (enabledCaptures select _forEachIndex) set[6, format["%1-%2-%3 %4:%5", _x select 6 select 2, _x select 6 select 1, _x select 6 select 0, _x select 6 select 3, _x select 6 select 4]];
	(enabledCaptures select _forEachIndex) set[7, _applicantsNames];
	(enabledCaptures select _forEachIndex) set[8, _applicantsIDs];
} foreach enabledCaptures;

publicVariable "enabledCaptures";