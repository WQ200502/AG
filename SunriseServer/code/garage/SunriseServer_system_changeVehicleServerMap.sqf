/*

	Filename: 	SunriseServer_system_changeVehicleServerMap.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_vid",0,[0]],
    ["_id","",[""]],
	["_unit",objNull,[objNull]]
];
format ["changeVehicleMap:%1:%2",worldName,_vid] call SunriseServer_database_fireAndForget;
["Вы заплатили за транспортировку техники, заберите ее в любом гараже.","done"] remoteExecCall ["SunriseClient_gui_BottomNotification",_unit];