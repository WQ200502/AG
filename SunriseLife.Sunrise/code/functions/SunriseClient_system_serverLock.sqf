/*

	Filename: 	SunriseClient_system_serverLock.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
/* Выключено до лучших времен
#include "..\..\script_macros.hpp"
private ["_type","_modifier","_amount","_rnd"];
if (call life_isAdmin) exitWith {};
uiSleep 60;

[format["Внимание! Вы зашли на сервер Sunrise #%1.<br/><br/>Через 5 минут вы будете закреплены и не сможете зайти на другие сервера Sunrise до рестарта!",life_server]] call SunriseClient_system_hint;

uiSleep 300;

life_myserver = life_server;
if (life_playerTrasnferDone) exitWith {};

["Вы были закреплены на этом сервере и не сможете зайти на другие сервера Sunrise до следующего рестарта!","done"] call SunriseClient_system_hint;
*/