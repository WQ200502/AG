/*

	Filename: 	SunriseClient_ds_boxPutDown.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
player removeAction AID_DROPDSBOX;
detach life_ds_box;
deleteVehicle life_ds_box;
if (EQUAL(CURWEAPON,"")) then {player PlayActionNow "FT_Act_Gesture_Reset"};
_price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_ds_price");
if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
[format["Вы заработали на доставке $%1",[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;
["DSDone"] spawn SunriseClient_experience_addExp;
["atm","add",_price,"dsJob"] call SunriseClient_system_myCash;

life_ds_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_ds_job;
life_job_inProgress = false;
[["earning", getPlayerUID player, (player getVariable ["realname",""]), "ds", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;