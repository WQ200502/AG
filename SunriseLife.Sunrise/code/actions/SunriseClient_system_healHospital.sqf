/*

	Filename: 	SunriseClient_system_healHospital.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _price = LIFE_SETTINGS(getNumber,"life_hospital_heal");
if (CASH < _price) exitWith {["error","",format["У вас нет $%1 необходимых для лечения",[_price] call SunriseClient_system_numberText]] call SunriseClient_message};

_action = [format["Стоимость лечения в госпитале составляет $%1",[_price] call SunriseClient_system_numberText],"Лечение в госпитале","Купить","Отказаться"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};

if (CASH < _price) exitWith {["error","",format["У вас нет $%1 необходимых для лечения",[_price] call SunriseClient_system_numberText]] call SunriseClient_message};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
uiSleep 8;
if (player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setDamage 0;
["all"] call SunriseClient_removeBuff;
["cash","take",_price] call SunriseClient_system_myCash;