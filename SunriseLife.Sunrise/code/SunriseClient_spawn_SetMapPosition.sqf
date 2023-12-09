/*

	Filename: 	SunriseClient_spawn_SetMapPosition.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
params [
	["_control",controlNull,[controlNull]],
	["_time",1,[0]],
	["_zoom",0.1,[0]],
	["_position",[],[[]]]
];
if (isNull _control OR _position isEqualTo []) exitWith {};

_control ctrlMapAnimAdd[_time,_zoom,_position];
ctrlMapAnimCommit _control;