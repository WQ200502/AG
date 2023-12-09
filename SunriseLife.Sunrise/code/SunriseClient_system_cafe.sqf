/*

	Filename: 	SunriseClient_system_cafe.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _price = LIFE_SETTINGS(getNumber,"life_cafe_eat");
if (CASH < _price) exitWith {[format["У вас нет $%1 необходимых для обеда в кафе",[_price] call SunriseClient_system_numberText],"error"] call SunriseClient_gui_bottomNotification};

_action = [format["Стоимость приема пищи в кафе составляет $%1",[_price] call SunriseClient_system_numberText],"Трапеза в кафе","Купить","Отказаться"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};
	
if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};
call SunriseClient_actions_inUse;

player playAction "FT_Act_Eat_Bread";
titleText["Кушаем...","PLAIN"];
player say3D "action_eat_3";
uiSleep 5;
player say3D "action_eat_3";
uiSleep 5;

if (call SunriseClient_system_isInterrupted) exitWith {life_action_inUse = false};

if (CASH < _price) exitWith {[format["У вас нет $%1 необходимых для обеда в кафе",[_price] call SunriseClient_system_numberText],"error"] call SunriseClient_gui_bottomNotification;life_action_inUse = false};
["cash","take",_price] call SunriseClient_system_myCash;

life_thirst = 100;
life_hunger = 100;
player setDamage 0;

[format["+ %1%2 голода",life_hunger,"%"]] spawn SunriseClient_gui_Notification;
[format["+ %1%2 жажды",life_thirst,"%"]] spawn SunriseClient_gui_Notification;

["Вы утолили голод и жажду","done"] call SunriseClient_gui_bottomNotification;

life_action_inUse = false;