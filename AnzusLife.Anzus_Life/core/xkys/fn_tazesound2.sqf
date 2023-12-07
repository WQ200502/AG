/*

	Filename: 	fn_isSafeZone.sqf
	Project: 	YDZY Life!
	Author:		SAYREX

*/
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};

private _return = false;

{
	if ((_unit distance getMarkerPos (_x select 0)) < _x select 1) exitWith {_return = true};
} forEach (LIFE_SETTINGSWORLD(getArray,worldName,"life_sz"));

_return;