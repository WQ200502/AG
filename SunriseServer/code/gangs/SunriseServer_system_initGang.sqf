/*

	Filename: 	SunriseServer_system_initGang.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
server_gangsRating = "ratingGangs" call SunriseServer_database_selectSingle;
publicVariable "server_gangsRating";
///////////////////////////
private _count = "countGangs" call SunriseServer_database_selectSingleField;
for "_x" from 0 to _count step 10 do {	
	private _queryResult = format ["initGangs:%1",_x] call SunriseServer_database_selectFull;
	format ["OK fn_initGangs:_queryResult = %1",_queryResult] call SunriseServer_system_log;

	if (_queryResult isEqualTo []) exitWith {};

	{
		_obj = getText(missionConfigFile >> "LifeCfgTrunks" >> _x select 0 >> "object");
		_obj = missionNameSpace getVariable [_obj,objNull];

		if !(isNull _obj) then {
			_obj setVariable ["VarDB",_x select 0,true];
			_obj setVariable ["inventory",_x select 1,true];
			_obj setVariable ["Trunk",_x select 2,true];
			_obj setVariable ["slots",_x select 3,true];
			_obj setVariable ["locked",true,true]; //Lock up all the stuff.
    	};
    } forEach _queryResult;
};