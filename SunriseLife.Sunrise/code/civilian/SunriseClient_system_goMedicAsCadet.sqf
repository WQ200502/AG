/*

	Filename: 	SunriseClient_system_goMedicAsCadet.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_action","_price"];
if (true)exitWith {hint "Временно отключено"};
_price = 30000;
_action = [
	format["Вы собираетесь вступить в ряди EMS в качестве кадета. Вступительный взнос составляет $%1 и даст вам возможность спасать жизни и помогать гражданам в трудный момент. Не забудьте изучить правила сотрудников EMS! Вы согласны?",[_price] call SunriseClient_system_numberText],"Вступление в EMS","Да","Отказаться"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _price) exitWith {hint "У вас недостаточно денег на счету"};
	["atm","take",_price,"goMedicAsCadet"] call SunriseClient_system_myCash;
	hint "Отправка запроса на сервер...";
	[player,steamid] remoteExecCall ["SunriseServer_system_goMedic",RSERV];
};