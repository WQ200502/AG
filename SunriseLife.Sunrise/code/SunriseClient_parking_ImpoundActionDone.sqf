/*
	
	Filename: 	SunriseClient_parking_ImpoundActionDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
life_impound_inuse = false;
private _price = LIFE_SETTINGS(getNumber,"life_impound_car");
["atm","add",_price,"vehParking"] call SunriseClient_system_myCash;
[format["Техника отправлена на штрафстоянку! Вы получили $%1 за очистку улиц!",[_price] call SunriseClient_system_numberText], "done"] call SunriseClient_gui_BottomNotification;