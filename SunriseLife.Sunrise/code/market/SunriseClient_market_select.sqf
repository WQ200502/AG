/*

	Filename:	SunriseClient_market_select.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
disableSerialization;
private["_data","_cnt","_id","_units"];
params["_control","_index"];

_data = _control lbData _index;
_data = call compile format["%1",_data];
_cnt = count _data;
_units = [];

if (_cnt == 1) exitWith {};
_id = switch (_cnt) do {
    case 4: {_data select 3};
    case 6: {_data select 0};
    default {0};
};

if (_id != 0) then {
    {if (_x getVariable ["ahID",0] == _id) then {_units pushBack _x};}forEach playableUnits;
    if (count _units == 0) then
    {
        player setVariable ["ahID",_id,true];
        missionNamespace setVariable [format["ahItem_%1",_id],true,true];
    }
};

waitUntil{isNull (findDisplay 15600) && isNull (findDisplay 15100) OR (player getVariable["ahID",0] != _id)};
missionNamespace setVariable [format["ahItem_%1",_id],false,true];
