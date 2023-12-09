/*

	Filename: 	SunriseClient_system_refuelVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_vehicle", "_id"];
closeDialog 0;
if (isEngineOn _vehicle) exitWith {["Выключите двигатель перед началом заправки!","error"] call SunriseClient_gui_bottomNotification};

private _amount = gas_array # _id # 0;
if (_amount < 1) exitWith {["На заправке кончилось топливо","error"] call SunriseClient_gui_bottomNotification};
private _capacity = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "fuelCapacity");

private _litres = 0;
private _cost = 0;
private _level = fuel _vehicle;
private _delay = 0.5;
private _station = nearestObject [player, "Land_fs_feed_F"];
private _litrePrice = LIFE_SETTINGS(getNumber,"life_fuel_litrePrice");
if (_vehicle isKindOf "Air") then { 
	_delay = _delay / 3;
	_litrePrice = _litrePrice / 3;
};

call SunriseClient_actions_inUse;

while {_level < 1} do {
	uiSleep _delay;	
	if (player distance _station > 5) exitWith {};
	
	_litres = _litres + 1;
	
	_cost = _cost + _litrePrice;
	if (BANK < _cost) exitWith {};
	if (_litres > _amount) exitWith {};
	_tick = 1 / _capacity;
	_level = _level + _tick;
	if (_level > 1) then {_level = 1; };
	
	hintSilent parseText format["Заправка компании<br /><t size='1.5' color='#00a8ff'>""АлтисНефтьГаз""</t><br /><br /><t color='#cec25b'>Литров:</t> %1<br/><t color='#cec25b'>Стоимость:</t> $%2<br/><t color='#cec25b'>Заправлено:</t> %3%4", _litres, [_cost] call SunriseClient_system_numberText, floor (_level * 100), "%"];
};

hintSilent parseText format["Заправка компании<br /><t size='1.5' color='#00a8ff'>""АлтисНефтьГаз""</t><br /><br /><t color='#cec25b'>Литров:</t> %1<br/><t color='#cec25b'>Стоимость:</t> $%2<br/><t color='#cec25b'>Заправлено:</t> %3%4<br/><br/><t color='#00FF00'>Заправка закончена</t>", _litres, [_cost] call SunriseClient_system_numberText, floor (_level * 100), "%"];

["atm","take",_cost] call SunriseClient_system_myCash;
life_tmp_tax = life_tmp_tax + _cost;	

if (!local (_vehicle)) then {	
	[_vehicle,_level] remoteExecCall ["SunriseClient_system_setFuel",_vehicle];
} else {
	_vehicle setFuel _level;
};
life_action_inUse = false;

private _gas_left = (gas_array # _id # 0) - _litres;
if (_gas_left < 1) then {_gas_left = 0};
gas_array set [_id, [_gas_left]];
publicVariable "gas_array";