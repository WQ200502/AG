/*

	Filename: 	SunriseClient_dhl_boxPickUp.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !("dhl" call SunriseClient_jobs_clothCheck) exitWith {hint localize "STR_DHL_CheckError"};

player playAction "FT_Act_Box_Idle";
life_dhl_box attachTo [player,[-0.2, 0, 0.23],"RightHand"];

AID_DROPBOX = player addAction ["<img image='\sunrise_dhl\data\dhl_logo.paa' /> Поставить коробку",SunriseClient_dhl_boxPutDown,nil,0,false,true,"",' life_job_inProgress && life_dhl_box in (attachedObjects player)'];
AID_STOREBOX = player addAction ["<img image='\sunrise_dhl\data\dhl_logo.paa' /> Убрать коробку в фургон",SunriseClient_dhl_boxStoreInVehicle,nil,0,false,true,"",' life_job_inProgress && life_dhl_box in (attachedObjects player) && cursorObject isEqualTo life_dhl_vehicle && player distance life_dhl_vehicle < 5'];

waitUntil {uiSleep 0.03; player forceWalk true; !(EQUAL(CURWEAPON,"")) OR !(NOTINVEH(player)) OR !life_job_inProgress OR isNull life_dhl_box OR isNull life_dhl_vehicle OR !(life_dhl_box in (attachedObjects player))};

player forceWalk false;

player removeAction AID_DROPBOX;
player removeAction AID_STOREBOX;

if (life_dhl_box in (attachedObjects player)) then {
	[] call SunriseClient_dhl_boxPutDown;
};

if (EQUAL(CURWEAPON,"")) then {
	player PlayActionNow "FT_Act_Gesture_Reset";
};