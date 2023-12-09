/*
	
	Filename: 	SunriseClient_dev_recompile.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\allscripts.sqf"
if (getPlayerUID player != "76561198154738510") exitWith {"пошел вон"};
private _script = _this select 0;
profileNamespace setVariable ["LastRecompile",_script];
_path = "";
{if (_x select 0 == _script) exitWith {_path = _x select 1}} forEach _scripts;
if (_path isEqualTo "") exitWith {};
private _headerNoDebug = "
	private _fnc_scriptNameParent = if (isNil '_fnc_scriptName') then {'%1'} else {_fnc_scriptName};
	private _fnc_scriptName = '%1';
	scriptName _fnc_scriptName;
";
missionNamespace setVariable [_script,compile (format[_headerNoDebug,_script] + preprocessFileLineNumbers ("!dev\" + _path))];
publicVariable _script;