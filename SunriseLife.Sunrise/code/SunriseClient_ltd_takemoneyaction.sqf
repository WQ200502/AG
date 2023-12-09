/*

	Filename: 	SunriseClient_ltd_takemoneyaction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
if (EQUAL(life_ltdData,[])) exitWith {hint "У вас нет фирмы"};
disableSerialization;
if (isNull (findDisplay 7300)) exitWith {};
if (life_action_inUse) exitWith {};

life_ltdData params ["_id","_owner","_name","_bank","_info","_licenses","_shopsCount"];

if !(EQUAL(_owner,steamid)) exitWith {hint "Вы не владелец фирмы"};
if (EQUAL(_bank,0)) exitWith {hint "Денег на счету-то нет..."};

closeDialog 0;

life_action_inUse = true;
hint "Отправка запроса на сервер...";
[_id,steamid,player] remoteExec ["SunriseServer_ltd_getAllMoney",RSERV];

true