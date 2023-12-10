/*

	Filename: 	SunriseServer_system_updateHouseSlots.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
    ["_house",Objnull,[Objnull]],
    ["_slots",0,[0]],
    ["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_updateHouseSlots| PARAMS=%1",_this]] call SunriseServer_system_customLog};

format ["updateHouseSlot:%1:%2",_slots,_house getVariable ["house_id",-1]] call SunriseServer_database_fireAndForget;
[format ["Вы увеличили количество слотов до %1",_slots],"done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];
