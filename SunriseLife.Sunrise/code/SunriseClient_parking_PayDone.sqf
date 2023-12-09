/*
	
	Filename: 	SunriseClient_parking_PayDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [	
	["_plate","",[""]],
	["_price",-1,[0]]
];
["ParkingPayed"] spawn SunriseClient_experience_addExp;
["atm","take",_price] call SunriseClient_system_myCash;
[format["Оплачен штраф в размере $%1 за технику с номером %2. Вы можете забрать технику со штрафстоянки",[_price] call SunriseClient_system_numberText,_plate], "done"] call SunriseClient_gui_BottomNotification;