/*

	Filename: 	SunriseClient_system_vehInit.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (EQUAL(_vehicle,objNull)) exitWith {};
	
life_vehicles pushBack _vehicle;

private _vehicle_limits = _vehicle getVariable ["vehicle_limits",""];
if (EQUAL(_vehicle_limits,"")) exitWith {};

switch (_vehicle_limits) do {
	case "carsharing": {
		life_cs_vehicle = _vehicle;
		life_cs_renting = true;
		life_cs_start = time;
		[] call SunriseClient_carsharing_startTimer
	};
	case "bus": {
		life_bus_vehicle = _vehicle;
		[life_bus_vehicle,"bus"] call SunriseClient_jobs_rentTimer;
	};
	case "dhl": {
		life_dhl_vehicle = _vehicle;
		[life_dhl_vehicle,"dhl"] call SunriseClient_jobs_rentTimer;
	};
	case "eco_gs": {
		life_eco_gs_vehicle = _vehicle;
		[life_eco_gs_vehicle,"eco_gs"] call SunriseClient_jobs_rentTimer;
	};
	case "eco_ws": {
		life_eco_ws_vehicle = _vehicle;
		[life_eco_ws_vehicle,"eco_ws"] call SunriseClient_jobs_rentTimer;
	};
	case "eln": {
		life_eln_vehicle = _vehicle;
		[life_eln_vehicle,"eln"] call SunriseClient_jobs_rentTimer;
	};
	case "dlv": {
		life_dlv_vehicle = _vehicle;
		[life_dlv_vehicle,"dlv"] call SunriseClient_jobs_rentTimer;
	};
	case "gas": {
		life_gas_vehicle = _vehicle;
		[life_gas_vehicle,"gas"] call SunriseClient_jobs_rentTimer;
	};
	case "jail": {
		life_jail_truck = _vehicle;
	};

	default {[format["SunriseClient_system_vehInit ERROR %1",_vehicle_limits],"error"] call SunriseClient_gui_bottomNotification};
};