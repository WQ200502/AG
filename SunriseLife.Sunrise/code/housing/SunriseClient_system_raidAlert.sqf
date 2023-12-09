/*

	Filename: 	SunriseClient_system_raidAlert.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _mode = param [0,0,[0]];

switch (_mode) do {
	case 0: {
		[localize "STR_ISTR_Bolt_AlertHouse","info"] call SunriseClient_system_hint;
		titleText[localize "STR_ISTR_Bolt_AlertHouse","PLAIN"];
	};

	case 1: {
		[localize "STR_House_Raid_NOTF","police"] call SunriseClient_system_hint;
		titleText[localize "STR_House_Raid_NOTF","PLAIN"];
	};
};

life_pvp = true;		
life_pvp_start = time;
[player,"houseRaid",true] call CBA_fnc_setVarNet;