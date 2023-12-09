/*

	Filename: 	SunriseClient_gestures_playAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\script_macros.hpp"
private _gesture = param [0,"",[""]];

if (_gesture in ["CRPTHSForward", "CRPTHSStop", "CRPTHSRegroup", "CRPTHSEngage", "CRPTHSPoint", "CRPTHSHold", "CRPTHSWarning"] && {((ANIMSTATE) select [0, 12]) in ["amovpercmstp", "amovpercmwlk", "amovpercmtac"]} && {weaponLowered player} ) then {
	_gesture = format ["%1StandLowered", _gesture];
};

player playAction _gesture;