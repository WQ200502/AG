/*

	Filename: 	SunriseClient_dhl_orderDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
deleteVehicle life_dhl_box;
life_dhl_vehicle removeAction AID_TFW;

life_dhl_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_dhl_job;

private _distance = round(life_dhl_startPoint distance2D life_dhl_finishPoint);
private _price = round(_distance * LIFE_SETTINGS(getNumber,"life_dhl_price"));
if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
["atm","add",_price,"dhlJob"] call SunriseClient_system_myCash;
[format["Вы заработали на доставке $%1. Верните технику или продолжите работу.",[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;
["DHLdone",_distance] spawn SunriseClient_experience_addExp;

"DHL - Order done" call SunriseClient_system_log;

life_dhl_startPoint = objNull;
life_dhl_finishPoint = objNull;
life_dhl_box = objNull;
life_job_inProgress = false;
[["earning", getPlayerUID player, (player getVariable ["realname",""]), "dhl", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;