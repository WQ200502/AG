/*

	Filename: 	SunriseClient_system_vehTransfer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
[[getPlayerUID player,"Transfer",player/*,"transfer"*/],"getVehicles","SYS",false] call SunriseClient_system_hcExec;
createDialog "SunriseDialogVehTransfer";
disableSerialization;
waitUntil {!isNull (findDisplay 5100)};
ctrlSetText[5102,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[5103,false];
ctrlShow[5104,false];