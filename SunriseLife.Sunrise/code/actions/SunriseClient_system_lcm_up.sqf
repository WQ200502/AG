/*

	Filename: 	SunriseClient_system_lcm_up.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _lcm = param [0,objNull,[objNull]];
player attachto [_lcm,[-3.3,-12,-3.5]];
PLAYER switchmove "GetInHemttBack";
uiSleep 2;
player attachto [_lcm,[-3.3,-11,-2.5]];
uiSleep 1;
player attachto [_lcm,[-3.3,-10.5,-2]];
detach player;