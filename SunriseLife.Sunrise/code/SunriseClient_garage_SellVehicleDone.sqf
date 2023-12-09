/*
	
	Filename: 	SunriseClient_garage_SellVehicleDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
    ["_vehicle","",[""]],
    ["_price",0,[0]]
];
[format["Вы успешно продали %1 за $%2",getText(configFile >> "CfgVehicles" >> (_vehicle) >> "displayName"),[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;

["atm","add",_price,"sellVehicleFromGarage"] call SunriseClient_system_myCash;
["VehicleSold"] spawn SunriseClient_experience_addExp;
life_action_inUse = false;
[["vehicle",format["(Garage sell) %1 (%2) sold %3 for $%4",GVAR_RNAME(player),steamid,_vehicle,[_price] call SunriseClient_system_numberText]],"customLog"] call SunriseClient_system_hcExec;