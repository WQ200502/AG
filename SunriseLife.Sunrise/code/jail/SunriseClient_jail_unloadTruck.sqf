/*

	Filename: 	SunriseClient_jail_loadTruck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_vehicle", objNull, [objNull]]
];

closeDialog 0;

if (isNull _vehicle) exitWith {};
if (_vehicle getVariable ["JailTrunk",0] < 5) exitWith {["Вы загрузили машину не полностью!", "done"] call SunriseClient_gui_BottomNotification;};
[_vehicle,"JailTrunk"] call SunriseClient_system_clearGlobalVar;
life_jail_time = life_jail_time - 1;
private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_jail_done");
["atm","add",_price,"jailDone"] call SunriseClient_system_myCash;
["JailDone"] spawn SunriseClient_experience_addExp;
[[getPlayerUID player,life_jail_time],"wantedUpdateJailTime"] call SunriseClient_system_hcExec;
[format["Ходка сделана! Вы получили $%1",_price], "done"] call SunriseClient_gui_BottomNotification;