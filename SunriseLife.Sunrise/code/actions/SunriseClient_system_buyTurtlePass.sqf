/*
	
	Filename: 	SunriseClient_system_buyTurtlePass.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _price = LIFE_SETTINGS(getNumber,"life_turtle_pass");
if (life_turtle_pass) exitWith {["error","",format["У вас уже есть талон"]] call SunriseClient_message};
if (CASH < _price) exitWith {["error","",format["У вас нет $%1 необходимых для покупки талона!",[_price] call SunriseClient_system_numberText],true] call SunriseClient_message};

_action = [format["Талон для охоты на черепах стоит $%1",[_price] call SunriseClient_system_numberText],"Талон на охоту","Купить","Отказаться"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};

["cash","take",_price] call SunriseClient_system_myCash;
["done","",format["Вы купили пропуск на охоту на черепах"]] call SunriseClient_message;
life_turtle_pass = true;