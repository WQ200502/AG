/*
	
	Filename: 	SunriseClient_gangs_MenuCreat.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_action_gangInUse) exitWith {};
disableSerialization;
createDialog "SunriseDialogMyGangCreate";
waitUntil {!isNull (findDisplay 2520)};
(CONTROL(2520,2523)) ctrlSetStructuredText parseText format["<t color='%2'>Стоимость создании банды: <t color='#3b7200'>$%1</t></t>",[LIFE_SETTINGS(getNumber,"life_gangPrice")] call SunriseClient_system_numberText,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];