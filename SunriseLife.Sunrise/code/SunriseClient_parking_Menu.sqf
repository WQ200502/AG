/*

	Filename: 	SunriseClient_parking_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
[[getPlayerUID player,"Parking",player],"getVehicles","SYS",false] call SunriseClient_system_hcExec;
disableSerialization;
createDialog "SunriseDialogParkingCiv";
waitUntil {!isNull (findDisplay 5700)};
ctrlSetText[5702,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[5703,false];
ctrlShow[5704,false];