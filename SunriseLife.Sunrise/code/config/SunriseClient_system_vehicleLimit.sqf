/*
	
	Filename: 	SunriseClient_system_vehicleLimit.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicleLimit = 200;
if (life_currentExpLevel > 4) then {_vehicleLimit = 250};
if (life_currentExpLevel > 9) then {_vehicleLimit = 400};
if (IS_VIP) then {_vehicleLimit = _vehicleLimit + (call life_donator) * 2};
 
_vehicleLimit