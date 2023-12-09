/*

	Filename: 	SunriseClient_system_soundDevice.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\..\script_macros.hpp"
if (isNull _this) exitWith {};
if (player distance _this > 2500) exitWith {}; //Don't run it... They're to far out..

while {true} do {
	if (isNull _this OR !alive _this) exitWith {};
	if (isNil {_this GVAR "mining"}) exitWith {};
	_this say3D "Device_disassembled_loop";
	uiSleep 28.6;
};