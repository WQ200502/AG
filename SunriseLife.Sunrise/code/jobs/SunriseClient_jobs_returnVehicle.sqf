/*

	Filename: 	SunriseClient_jobs_returnVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
_this = _this select 3;
if (time - life_check_timer < 3) exitWith {["Возвращать технику можно не чаще одного раза в 3 секунды","error"] call SunriseClient_gui_bottomNotification};
private _vehicle = missionNamespace getVariable [format["life_%1_vehicle",_this],objNull];
if (isNull _vehicle) exitWith {["Техника потеряна или уничтожена", "error"] call SunriseClient_gui_bottomNotification};

private _spawnPointPos = getMarkerPos (getText(missionConfigFile >> "LifeCfgSettings" >> (format["life_%1_office_spawn",_this])));
private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> (format["life_%1_vehicle_price",_this]));

if (_vehicle distance _spawnPointPos > 50) exitWith {["Техника должна находиться рядом!", "error"] call SunriseClient_gui_bottomNotification};
deleteVehicle _vehicle;
[_this] call SunriseClient_gui_DestroyRscLayer;
["atm","add",_price,_this + "Return"] call SunriseClient_system_myCash;
[format["Вам вернули $%1 за возврат техники",_price], "done"] call SunriseClient_gui_bottomNotification;
life_check_timer = time;