/*

	Filename: 	fn_adminInit.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\script_macros.hpp"
if (!isNil "life_isDev" OR !isNil "life_isAdmin") exitWith {
	["cheat",format["%1 (%2) !isNil adminInit",getPlayerUID player,name player]] remoteExecCall ["SunriseServer_system_customlog",-2];
	endMission "SpyGlass";
};

life_isDev = compileFinal "getPlayerUID player in ['76561198154738510','76561198207021187']";
life_isAdmin = compileFinal ("getPlayerUID player in " + str [
	'76561198154738510', //Makar
	'76561198207021187', //Efim
	'76561198273344718' // Blank
]);

true