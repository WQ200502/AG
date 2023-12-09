/*

	Filename: 	SunriseClient_system_punishment.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_type",-1,[0]]
];
if (isNull _unit) exitWith {};

switch (_type) do {
    case 1: {//килл в зеленой зоне
        life_jail_time = 90;
    	[player,true,life_jail_time] call SunriseClient_system_jail;
        [["agony",format["%1 (%2) punished for green zone kill",GVAR_RNAME(player),steamid]],"customLog"] call SunriseClient_system_hcExec;
        [3] call SunriseClient_system_updateKarma;
    };
    case 2: {//заход в круг смерти
        life_jail_time = 30;
        [player,true,life_jail_time] call SunriseClient_system_jail;
        [["Punish",format["%1 (%2) punished for new life rule",GVAR_RNAME(player),steamid]],"customLog"] call SunriseClient_system_hcExec;
        [4] call SunriseClient_system_updateKarma;
    };
};
