/*

	Filename: 	SunriseClient_dhl_boxSpawn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _place = param [0,objNull,[objNull]];
life_dhl_box = (LIFE_SETTINGS(getText,"life_dhl_box")) createVehicleLocal getPosATL _place;
life_dhl_box addAction ["<img image='\sunrise_dhl\data\dhl_logo.paa' /> Взять коробку",SunriseClient_dhl_boxPickUp,nil,0,true,true,"",' life_job_inProgress ', 4];