/*

	Filename: 	SunriseClient_tasks_DeleteAll.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _tasks = [player] call BIS_fnc_tasksUnit;
{
	format["Task %1 deleted",_x] call SunriseClient_system_log;
	[_x] call BIS_fnc_deleteTask;
} forEach _tasks;