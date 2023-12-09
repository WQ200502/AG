/*

	Filename: 	SunriseClient_system_findGPS.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _gps = ctrlText (findDisplay 12 displayCtrl 1162);
if !(count _gps isEqualTo 6) exitWith {};
private _pos = [_gps] call SunriseClient_system_gpsToPos;
mapAnimAdd [0.5, 0.025, _pos];
mapAnimCommit;