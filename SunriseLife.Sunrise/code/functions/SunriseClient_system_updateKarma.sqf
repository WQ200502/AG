/*

	Filename: 	SunriseClient_system_updateKarma.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
life_karma = param [0,0,[0]];
player setVariable ["karma",life_karma,true];
[getPlayerUID player,"life_karma",life_karma] remoteExecCall ["SunriseServer_database_updatePartial",2]