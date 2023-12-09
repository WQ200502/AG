/*

	Filename: 	SunriseClient_system_vehicleShopColorLBChange.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
[CONTROL_DATA(2300),CONTROL_DATA(2304),CONTROL_DATA(2305)] call SunriseClient_system_shopBoxUpdate;
if (CONTROL_DATA(2304) isEqualTo "custom") then {
	for "_i" from 2311 to 2316 do {ctrlShow[_i,true]};
} else {
	for "_i" from 2311 to 2316 do {ctrlShow[_i,false]};
};