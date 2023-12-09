/*

	Filename: 	SunriseClient_hazard_clothSpawn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _price = getNumber(missionConfigFile >> "LifeCfgHazard" >> "cloth_price");
private _action = [format ["Для посещения зоны вам необходима подходящая экипировка, стоимость покупки составляет $%1. Экипировка включает в себя: костюм химзащиты и детектор аномалий (активация в руках Shift+L). Учитывайте, что детектор перегревается за 10 минут работы!",[_price] call SunriseClient_system_numberText],"Покупка защитной экипировки",localize "STR_Global_Yes",localize "STR_Global_No"] call SunriseClient_gui_guiMessage;
if (CASH < _price) exitWith {["error","",format["У вас нет $%1 необходимых для покупки экипировки!",[_price] call SunriseClient_system_numberText]] call SunriseClient_message;};

if (_action) then {
	["cash","take",_price] call SunriseClient_system_myCash;
	["Skyline_HeadGear_NBC_Hazmat_01_F"] call SunriseClient_system_addItem;
	["Skyline_Glasses_Masque_GP5_01_F"] call SunriseClient_system_addItem;
	["Skyline_Character_U_CivilD_01_F"] call SunriseClient_system_addItem;
	[getText(missionConfigFile >> "LifeCfgHazard" >> "detectorItem")] call SunriseClient_system_addItem;
} else {
	["info","","Вы отказались от покупки экипировки"] call SunriseClient_message;
};