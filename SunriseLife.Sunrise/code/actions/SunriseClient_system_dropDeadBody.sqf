/*
	
	Filename: 	SunriseClient_system_dropDeadBody.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (isNull life_DraggedBody) exitWith {};

detach life_DraggedBody;
player removeWeapon "EXT_FakePrimaryWeapon";
if (NOTINVEH(player) && !(call SunriseClient_system_isInterrupted)) then {	
	[] call SunriseClient_system_animDo;
};

[life_DraggedBody,"draggedBy"] call SunriseClient_system_clearGlobalVar;
[life_DraggedBody,"unconsciousrevivedefault"] remoteExecCall ["SunriseClient_system_animSync",RCLIENT];

life_DraggedBody = ObjNull;

player removeAction life_actions_drag;