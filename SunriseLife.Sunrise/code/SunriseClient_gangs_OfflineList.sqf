/*

	Filename: 	SunriseClient_gangs_OfflineList.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;

if (isNull (findDisplay 3800)) then {
	if !(createDialog "SunriseDialogGangOffline") exitWith {};
};

private _ret = param [0,[],[[]]];
private _members = CONTROL(3800,3802);
lbClear _members;

if (_ret isEqualTo []) exitWith {_members lbAdd "Список пуст"};

{
	_x params ["_uid","_name"];
	if (!([_uid] call SunriseClient_system_isUIDActive)) then {
		_members lbAdd format["%1",_name];
		_members lbSetData [(lbSize _members)-1,_uid];
	};
} foreach _ret;