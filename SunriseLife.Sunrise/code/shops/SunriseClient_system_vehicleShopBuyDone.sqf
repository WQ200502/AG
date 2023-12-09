/*

	Filename: 	SunriseClient_system_vehicleShopBuyDone.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		

*/
#include "..\..\script_macros.hpp"
params [	
	["_done",false,[true]],
	["_vehicle",objNull,[objNull]],
	["_plate","",[""]],
	["_price",0,[0]],
	["_color","",[""]],
	["_custom_color","",[""]],
	["_material","",[""]],
	["_box",0,[0]]
];

if (_done) then {
	//private _logText = format["Приобрел технику %1 за $%2",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call SunriseClient_system_numberText];	
	["cash","take",_price,"VB"/*,_logText*/] call SunriseClient_system_myCash;
	[["vehicle",format["%1 (%2) bought %3 for $%4",GVAR_RNAME(player),steamid,getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call SunriseClient_system_numberText]],"customLog"] call SunriseClient_system_hcExec;
	
	//[format["Вы купили %1 #%3 за $%2",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call SunriseClient_system_numberText,_plate],"done"] call SunriseClient_gui_bottomNotification;
	
	["done","",format["Вы купили %1 #%3 за $%2",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call SunriseClient_system_numberText,_plate],true] call SunriseClient_message;
	
	["VehiclePurchased"] spawn SunriseClient_experience_addExp;
	//player moveInDriver _vehicle;
	
	if !(EQUAL(_color,"")) then {[_vehicle,_color,true,_custom_color] call SunriseClient_system_colorVehicle};
	if !(EQUAL(_material,"")) then {[_vehicle,_material] call SunriseClient_system_materialVehicle};
	if !(EQUAL(_box,0)) then {[_vehicle,[_box,false]] call SunriseClient_adac_InitUpgrades};
	if ([typeof _vehicle] call SunriseClient_system_havePlate) then {[_vehicle] call SunriseClient_system_setPlate};
} else {
	["Не удалось совершить сделку попробуйте еще раз.","error"] call SunriseClient_gui_bottomNotification;
};