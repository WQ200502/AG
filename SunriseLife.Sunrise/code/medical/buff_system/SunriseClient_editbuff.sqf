/*

	Filename: 	SunriseClient_editbuff.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF
	Web:		http://sunriserp.ru

*/
#include "..\..\..\script_macros.hpp"
disableSerialization;
private _name = param [0,"",[""]];
private _variable = param [1,"",[""]];
private _time = param [2,-1,[0]];

if (_name isEqualTo "") exitWith {};
if (_variable isEqualTo "") exitWith {};
if (_time <= 0) exitWith {};
if (_variable in (getArray(missionConfigFile >> "Life_Settings" >> "dont_use_buffs"))) exitWith {};
if (ui_buff_array isEqualTo []) exitWith {};

private _time_stop = -1;
private _tmp = +[];

{
_toastControl = _x select 0;
_variableLocal = (_x select 4);

if (_variableLocal isEqualTo _variable) then {
[_variableLocal] call SunriseClient_terminateBuffVar;
_time_stop = (_x select 2);
ctrlDelete _toastControl;
_tmp pushBack _x;
};
} forEach ui_buff_array;
ui_buff_array = ui_buff_array - _tmp;

_time_stop = _time_stop - diag_tickTime;
if (_time_stop <= 0) exitWith {};

waitUntil {isNull (missionnamespace getVariable [format ["%1_handler",_variable],objNull])};

[_name,_variable,_time_stop + _time,0] call SunriseClient_addBuff;
