/*

	Filename: 	SunriseServer_system_initVehicleRestart.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _count = "countVehicles" call SunriseServer_database_selectSingleField;
for "_x" from 0 to _count step 10 do {	
	private _queryResult = format ["initVehicles:%1",_x] call SunriseServer_database_selectFull;
	diag_log format ["OK fn_initVehicles:_queryResult = %1",_queryResult];

	if (_queryResult isEqualTo []) exitWith {};

	{
		params ["_class"];
		private _vehicle = createVehicle [_className,_pos,[],0,"NONE"];
		waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
		_vehicle allowDamage false;
		_vehicle setPos _pos;
		_vehicle setVectorUp (surfaceNormal _pos);
		_vehicle setDir _dir;
		_vehicle setDamage 0;
		_vehicle setFuel _fuel;
		_ids = [];
		{_ids pushBack (_x select 0)} count _owners;
		_condition = format['(getPlayerUID player) in %1',_ids];
		[_vehicle,["Достать ключи",SunriseClient_system_activeVehicle,"",0,false,false,"",_condition]] remoteExecCall ["addAction",-2,_vehicle];
    } forEach _queryResult;
};