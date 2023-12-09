/*
    
    Filename:   SunriseClient_system_loadGear.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
[] call SunriseClient_system_stripDownPlayer;

if (EQUAL(life_gear,[])) exitWith {
    switch (true) do {
        case (life_copDuty): {[] call SunriseClient_loadout_cop};
        case (life_medDuty): {[] call SunriseClient_loadout_medic};
		default {[] call SunriseClient_loadout_civ};
    };
};
life_gear params ["_iItems", "_yItems"];

//systemChat "Загрузка инвентаря...";
["info","",format["Загрузка инвентаря..."],true] call SunriseClient_message;

[player,_iItems] call SunriseClient_inventory_load;

life_maxWeight = 100;
{
	[true,_x select 0,_x select 1] call SunriseClient_system_handleInv;
} foreach _yItems;
life_maxWeight = 24;

//удаляем ключи от тюрьмы
private _keys = ["srl_prisonKey"] call SunriseClient_system_itemCount;
if !(EQUAL(_keys,0)) then {
	for "_i" from 1 to _keys do {
		["srl_prisonKey"] call SunriseClient_system_removeItem;
	};
};

//если сохранилась униформа зека
if (EQUAL(PUNIFORM,"U_C_WorkerCoveralls")) then {
	[] call SunriseClient_system_stripDownPlayer;
    switch (true) do {
        case (life_copDuty): {[] call SunriseClient_loadout_cop};
        case (life_medDuty): {[] call SunriseClient_loadout_medic};
		default {[] call SunriseClient_loadout_civ};
    };
    //systemChat "У вас сохранилась форма заключенного! Загружен стандартный набор.";
	["info","",format["У вас сохранилась форма заключенного! Загружен стандартный набор."],true] call SunriseClient_message;
} else {
	//systemChat "Загрузка инвентаря завершена";
	["info","",format["Загрузка инвентаря завершена"],true] call SunriseClient_message;
};


[] call SunriseClient_system_saveGear;