/*

	Filename:   SunriseClient_factory_orderDone.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	
	
*/
params [
	["_amount",-1,[0]],
	["_price",-1,[0]],
	["_player",objNull,[objNull]]
];
if (_amount isEqualTo -1 OR _player isEqualTo objNull) exitWith {};

["atm","take",_price,"factoryOrder"] call SunriseClient_system_myCash;
player say3D "caching";
hint format["Вы успешно оформили заказ на %1 единиц за $%2. Обработка займет время, ожидайте (обычно до 15 минут)", _amount, [_price] call SunriseClient_system_numberText];