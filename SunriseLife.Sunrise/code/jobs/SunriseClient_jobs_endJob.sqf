/*

	Filename: 	SunriseClient_jobs_endJob.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (time - life_endjob_timer < 300) exitWith {["Чтобы завершить работу снова придется подождать", "error"] call SunriseClient_gui_bottomNotification};
life_endjob_timer = time;
switch (true) do { 
	case !(isNull life_bus_job) : {
		life_bus_points = [];
		life_bus_job setTaskState "FAILED"; 
		player removeSimpleTask life_bus_job;
		player removeSimpleTask life_bus_task;
		["Вы завершили работу водителя автобуса!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_dlv_job) : {
		life_dlv_job setTaskState "FAILED"; 
		player removeSimpleTask life_dlv_job;
		[life_dlv_vehicle,"cargoDeliver"] call SunriseClient_system_clearGlobalVar;
		["Вы завершили работу дальнобойщика!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_gas_job) : {
		life_gas_job setTaskState "FAILED"; 
		player removeSimpleTask life_gas_job;
		[life_gas_vehicle,"gasDelivery"] call SunriseClient_system_clearGlobalVar;
		["Вы завершили работу развозчика топлива!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_dhl_job) : {
		detach life_dhl_box;
		deleteVehicle life_dhl_box;
		life_dhl_job setTaskState "FAILED"; 
		player removeSimpleTask life_dhl_job;
		life_dhl_vehicle removeAction AID_TFW;
		life_dhl_startPoint = objNull;
		life_dhl_finishPoint = objNull;
		life_dhl_box = objNull;
		["Вы завершили работу курьера DHL!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_ds_job) : {
		player removeAction AID_DROPDSBOX;
		detach life_ds_box;
		deleteVehicle life_ds_box;
		if (currentWeapon player isEqualTo "") then {player PlayActionNow "FT_Act_Gesture_Reset"};
		life_ds_job setTaskState "FAILED"; 
		player removeSimpleTask life_ds_job;
		["Вы завершили работу доставщика!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_eco_gs_job) : {
		life_eco_gs_job setTaskState "FAILED"; 
		player removeSimpleTask life_eco_gs_job;
		player removeSimpleTask life_eco_gs_task;
		deleteMarkerLocal "eco_gs_marker";
		["Вы завершили работу пробоотборщика!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_eco_ws_job) : {
		life_eco_ws_job setTaskState "FAILED"; 
		player removeSimpleTask life_eco_ws_job;
		player removeSimpleTask life_eco_ws_task;
		deleteMarkerLocal "eco_ws_marker";
		["Вы завершили работу пробоотборщика!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_eln_job) : {
		life_eln_job setTaskState "FAILED"; 
		player removeSimpleTask life_eln_job;
		player removeSimpleTask life_eln_task;
		["Вы завершили работу электрика!", "done"] call SunriseClient_gui_bottomNotification;
	};
	//darkjobs
	case !(isNull life_dcleaner_job) : {
		life_dcleaner_job setTaskState "FAILED"; 
		deleteVehicle life_dcleaner_corpse;
		player removeSimpleTask life_dcleaner_job;
		player removeSimpleTask life_dcleaner_task;
		["Вы завершили работу чистильщика!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_dcourrier_job) : {
		life_dcourrier_job setTaskState "SUCCEEDED"; 
		player removeSimpleTask life_dcourrier_job;
		player removeSimpleTask life_dcourrier_task;
		["Вы завершили работу наркокурьера!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_rob_job) : {
		life_rob_job setTaskState "FAILED"; 
		player removeSimpleTask life_rob_job;
		["Вы завершили работу грабителя!", "done"] call SunriseClient_gui_bottomNotification;
	};
	case !(isNull life_terror_job) : {
		life_terror_job setTaskState "FAILED"; 
		player removeSimpleTask life_terror_job;
		["Вы завершили работу диверсанта!", "done"] call SunriseClient_gui_bottomNotification;
	};

	default {["У вас нет работы!", "error"] call SunriseClient_gui_bottomNotification}; 
};

life_job_inProgress = false;