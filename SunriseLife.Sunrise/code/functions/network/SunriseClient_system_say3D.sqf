/*

	Filename: 	SunriseClient_system_say3D.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\..\script_macros.hpp"
params [
    ["_object",ObjNull,[ObjNull]],
    ["_sound","",[""]]
];
if (isNull _object OR _sound isEqualTo "") exitWith {};
if (_object distance player > 10) exitWith {};

_object say3D _sound;