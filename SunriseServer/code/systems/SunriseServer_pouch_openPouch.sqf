/*

	Filename: 	SunriseServer_pouch_openPouch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_player",objNull,[objNull]]
];
if (isNull _player) exitWith {};

private _pouch = format["openPouch:%1",getPlayerUID _player] call SunriseServer_database_selectSingle;//return enabled, inventory
if (_pouch isEqualTo []) exitWith {["У вас нет защищенного контейнера", "error"] remoteExecCall ["SunriseClient_gui_BottomNotification",_player];};
if !(_pouch select 0) exitWith {["Защищенный контейнер неактивен", "error"] remoteExecCall ["SunriseClient_gui_BottomNotification",_player];};
[_pouch select 1] remoteExecCall ["SunriseClient_pouch_pouchMenu",_player];