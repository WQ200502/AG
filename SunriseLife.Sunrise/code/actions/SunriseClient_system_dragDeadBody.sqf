/*

	Filename: 	SunriseClient_system_dragDeadBody.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (EQUAL(RIFLE,"")) then {player addWeapon "EXT_FakePrimaryWeapon"};
player selectWeapon RIFLE;
life_DraggedBody = param [0,ObjNull,[ObjNull]];
if (isNull life_DraggedBody) exitWith {};
if (!(life_DraggedBody isKindOf "CAManBase") OR (player distance life_DraggedBody > 5) OR life_DraggedBody isEqualTo player) exitWith {life_DraggedBody = ObjNull};

if (!isNil {life_DraggedBody GVAR "draggedBy"}) exitWith {life_DraggedBody = ObjNull};
private _lastCoef = getAnimSpeedCoef player;
player setAnimSpeedCoef 1;
[life_DraggedBody,"draggedBy",player] call CBA_fnc_setVarNet;

life_DraggedBody setPosASL (getPosASL player vectorAdd (vectorDir player));
life_DraggedBody setDir (getDir player + 180);
[life_DraggedBody,"AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExecCall ["SunriseClient_system_animSync",RCLIENT];
["AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon"] call SunriseClient_system_animDo;

[{
	[life_DraggedBody,"AinjPfalMstpSnonWnonDf_carried_dead"] remoteExecCall ["SunriseClient_system_animSync",RCLIENT];
	["AcinPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;

	life_DraggedBody attachTo [player, [0.1,-0.1,-1.25], "LeftShoulder"];
	player setAnimSpeedCoef _this;

	life_actions_drag = player addAction["<img image='\sunrise_pack\icons\ui\s_icon_stop.paa' /> " + localize "STR_pAct_DropDraggedBody",SunriseClient_system_dropDeadBody,"",0,false,false];
}, _lastCoef, 15] call CBA_fnc_waitAndExecute;


[{!(NOTINVEH(player)) OR !alive life_DraggedBody OR (call SunriseClient_system_isInterrupted)}, {[] call SunriseClient_system_dropDeadBody}] call CBA_fnc_waitUntilAndExecute;