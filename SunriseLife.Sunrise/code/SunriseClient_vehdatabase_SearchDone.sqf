/*

	Filename: 	SunriseClient_vehdatabase_SearchDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) exitWith {};
["Данные получены!", "done"] call SunriseClient_gui_BottomNotification;
(CONTROL(5600,5603)) ctrlEnable true;
private _data = CONTROL(5600,5604);
_data ctrlSetStructuredText parseText "";

private _retArray = param [0,[],[[]]];
if (EQUAL(_retArray,[])) exitWith {_data ctrlSetStructuredText parseText format["<t color='%1'>Ничего не найдено в базе данных</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']]};
_retArray params ["_classname","_type","_pid","_servermap","_name"];
_type = switch (_type) do {
	case "Car" : {"Наземная"};
	case "Air" : {"Воздушная"};
	case "Ship" : {"Водная"};
	default {"Не удалось определить"};
};
_data ctrlSetStructuredText parseText format ["<t size='1.5' color='%7'>Данные о технике</t><br/><br/>
<t size='0.9' color='%7'>Модель: %1<br/>
Тип: %2<br/>
Остров: %3<br/>
Владелец: %4<br/>
Номер паспорта: %5</t>",getText(configFile >> "CfgVehicles" >> _classname >> "displayName"),
_type,
_servermap,
_name,
_pid,
GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
];