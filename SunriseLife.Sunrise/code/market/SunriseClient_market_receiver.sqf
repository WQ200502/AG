/*

	Filename:	SunriseClient_market_receiver.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!market_loaded) exitWith {hint "Склад в данный момент обрабатывает получения. Пожалуйста, попробуйте еще раз!"};

_total = 0;
_toDel = [];
_uid = getPlayerUID player;
{
	if ((_x select 5 == _uid) && (_x select 7 == 2)) then {
		_total = _total + (_x select 4);
		_toDel pushBack (_x select 0);
	};
}forEach all_ah_items;

if (_total > 0) then {
	[_toDel] remoteExec ["SunriseServer_market_delete",RSERV];
	hint format["Вы получили $%1 с продаж ваших лотов на торговой площадке. Ждем вас снова!",[_total] call SunriseClient_system_numberText];
	["atm","add",_total] call SunriseClient_system_myCash;
	player say3D "caching";
} else {
	hint "На складе ничего нет на ваше имя.";
};
