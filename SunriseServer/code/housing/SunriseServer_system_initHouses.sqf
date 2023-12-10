/*

	Filename:   SunriseServer_system_initHouses.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
private _count = "countHouses" call SunriseServer_database_selectSingleField;
for "_x" from 0 to _count step 10 do {
	private _queryResult = format ["initHouses:%1",_x] call SunriseServer_database_selectFull;
	format ["OK fn_initHouses:_queryResult = %1",_queryResult] call SunriseServer_system_log;
	if (_queryResult isEqualTo []) exitWith {};
		
	{
		private _position = call compile format ["%1",_x select 3];
		private _house = nearestObject [_position, _x select 2];
		_house setVariable ["house_owner",[_x select 1,_x select 4],true];
		_house setVariable ["house_id",_x select 0,true];
		_house setVariable ["locked",true,true]; //Lock up all the stuff.
		_house setVariable ["house_security",_x select 5,true];
		_house setVariable ["house_expires",_x select 6,true];
	} forEach _queryResult;
};