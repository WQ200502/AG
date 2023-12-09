/*
	
	Filename: 	SunriseClient_system_vehicleServiceNitro.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _button = CONTROL(8400,8413);
life_service_updateNitro = !life_service_updateNitro;

if (life_service_nitro) then {
	_button ctrlSetText "Установить нитро";
	life_service_nitro = false;
} else {
	_button ctrlSetText "Убрать нитро";
	life_service_nitro = true;
};

call SunriseClient_system_vehicleServiceLBChange;