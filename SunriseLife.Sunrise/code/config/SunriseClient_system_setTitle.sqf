/*

	Filename: 	SunriseClient_system_setTitle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
[] call SunriseClient_system_titleConfig;
[player,"realtitle",M_CONFIG(getText,"LifeCfgTitles",life_myTitleID,"title")] call CBA_fnc_setVarNet;