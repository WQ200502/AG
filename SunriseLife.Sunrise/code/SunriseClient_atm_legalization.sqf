/*

	Filename: 	SunriseClient_atm_legalization.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _value = DCASH;

["dcash","drop",DCASH,"moneyLegal"] call SunriseClient_system_myCash;
["cash","add",_value,"moneyLegal"] call SunriseClient_system_myCash;
[format["У вас были нелегальные деньги в размере $%1. Они были конвертированы в легальную наличность и теперь вы можете положить их на свой банковский счет.",[_value] call SunriseClient_system_numberText], "done"] call SunriseClient_gui_BottomNotification;