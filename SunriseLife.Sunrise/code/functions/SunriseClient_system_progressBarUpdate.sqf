/*
	
	Filename: 	SunriseClient_system_progressBarUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _ui = uiNamespace getVariable "life_progress";
if (isNull _ui) exitWith {};

private _p_bar = _ui displayCtrl 38201;
_p_bar progressSetPosition _this;