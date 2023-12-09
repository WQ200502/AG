/*

	Filename: 	SunriseClient_dhl_boxStoreInVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (isNull life_dhl_box OR isNull life_dhl_vehicle) exitWith {};

detach life_dhl_box;
deleteVehicle life_dhl_box;

AID_TFW = life_dhl_vehicle addAction ["<img image='\sunrise_dhl\data\dhl_logo.paa' /> Достать коробку из фургона",SunriseClient_dhl_boxTakeFromVeh,"",0,false,false,"",' life_job_inProgress && isNull objectParent player && isNull life_dhl_box', 5];