/*

	Filename: 	SunriseClient_garage_MarkerMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
(_this select 3) params[
	["_spawnPos","",[""]],
	["_type","",[""]]
];
if ((time - life_garage_timer) < 10) exitWith {["Гараж закрыт на обед. Зайдите еще раз через 10 секунд","error"] call SunriseClient_gui_bottomNotification};

life_garage_timer = time;
life_garage_sp = _spawnPos;
life_garage_sp_name = _spawnPos;
life_garage_type = _type;
life_garage_isHouse = false;

[[getPlayerUID player,_type,player],"getVehicles","SYS",false] call SunriseClient_system_hcExec;

createDialog "SunriseDialogImpound";
disableSerialization;
waitUntil {!isNull (findDisplay 2800)};
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[2803,false];
ctrlShow[2812,false];
ctrlShow[2813,false];
ctrlShow[2814,false];