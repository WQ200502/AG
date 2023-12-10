/*

    Filename:   SunriseServer_system_initCaptures.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
private _count = "countCaptures" call SunriseServer_database_selectSingleField;
//for [{_i=0},{_i<=_count},{_i=_i+10}] do {
for "_i" from 0 to _count step 10 do {
    private _queryResult = format ["initCaptures:%1",_i] call SunriseServer_database_selectFull;
	diag_log format ["OK fn_initCaptures:_queryResult = %1",_queryResult];
    if (_queryResult isEqualTo []) exitWith {};
	{
	    private _processor = call compile format ["%1",_x select 0];
		_processor setVariable ["proc_owner",_x select 1,true];
        _processor setVariable ["proc_name",_x select 2,true];
    } forEach _queryResult;
};
[] call SunriseServer_system_loadEnabledCaptures;