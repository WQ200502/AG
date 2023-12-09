/*

	Filename: 	SunriseClient_system_vehicleShopColorLBChange.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
[typeOf ShopBoxVehicle,CONTROL_DATA(8401),CONTROL_DATA(8402)] call SunriseClient_system_serviceBoxUpdate;
if (CONTROL_DATA(8401) isEqualTo "custom") then {
	for "_i" from 8404 to 8409 do {ctrlShow[_i,true]};
} else {
	for "_i" from 8404 to 8409 do {ctrlShow[_i,false]};
};
call SunriseClient_system_vehicleServiceLBChange;