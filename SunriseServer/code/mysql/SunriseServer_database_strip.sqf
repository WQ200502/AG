/*

	Filename: 	SunriseServer_database_strip.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _string = param [0, "", [""]];

private _array = toArray _string;
{
    if ( _x in [58,34,39]) then {
        _array set[_forEachIndex, -1];
    };
} forEach _array;
_array = _array - [-1];

private _return = toString _array;

diag_log format["STRIP: %1 => %2", _string, _return];

_return;