/*

	Filename: 	SunriseClient_vehdatabase_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) then {
	if !(createDialog "SunriseDialogVehData") exitWith {};
};

private _title = CONTROL(5600,5601);
_title ctrlSetText "База данных техники";

private _data = CONTROL(5600,5604);
_data ctrlSetStructuredText parseText format["<t color='%1'>Введите регистрационный номер транспортного средства и нажмите Поиск</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];