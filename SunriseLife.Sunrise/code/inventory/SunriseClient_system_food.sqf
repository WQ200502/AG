/*

	Filename: 	SunriseClient_system_food.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];

if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};
call SunriseClient_actions_inUse;

private _newItem = "";
private _sound = "";
private _thirstAmount = 0;
private _hungerAmount = 0;
private _action = "";
private _type = "";

switch (true) do {
	//чистая вода из фляжки или бутылки
	case (_oldItem in ["srl_canteen_clean_3","srl_canteen_clean_2","srl_canteen_clean_1","srl_bottleclean_100","srl_bottleclean_50"]): {
		_newItem = switch (_oldItem) do {
			case "srl_canteen_clean_3": {"srl_canteen_clean_2"};
			case "srl_canteen_clean_2": {"srl_canteen_clean_1"};
			case "srl_canteen_clean_1": {"srl_canteen_empty"};
			case "srl_bottleclean_100": {"srl_bottleclean_50"};
			case "srl_bottleclean_50": {"srl_bottle_empty"};
		};
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 70;
		_type = "drink";
	};

	case (EQUAL(_oldItem,"srl_Juice")): {
		_newItem = "srl_bottle_empty";
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 70;
		_type = "drink";
	};

	//спирит и фанта (убраны из магазина)
	case (_oldItem in ["srl_Spirit","srl_franta"]): {
		_sound = "action_drink_soda";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 50;
		_type = "drink";
	};

	//грязная вода из бутылки или фляги
	case (_oldItem in ["srl_canteen_dirty","srl_bottle_dirty"]): {
		_newItem = switch (_oldItem) do {
			case "srl_canteen_dirty": {"srl_canteen_empty"};
			case "srl_bottle_dirty": {"srl_bottle_empty"};
		};
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 20;
		_type = "drink";
	};

	//морская вода из фляги или бутылки
	case (_oldItem in ["srl_canteen_salt","srl_bottle_salt"]): {
		_newItem = switch (_oldItem) do {
			case "srl_canteen_salt": {"srl_canteen_empty"};
			case "srl_bottle_salt": {"srl_bottle_empty"};
		};
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 10;
		_type = "drink";
	};

	//алкоголь
	case (_oldItem in ["srl_CarltonDraught","srl_Coopers","srl_Corona","srl_Jimbeam"]): {
		_newItem = "";
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 15;
		_type = "drink";
	};


	//бекон (убран из магазина)
	case (_oldItem in ["srl_TacticalBacon_100","srl_TacticalBacon_75","srl_TacticalBacon_50","srl_TacticalBacon_25"]): {
		_newItem = switch (_oldItem) do {
			case "srl_TacticalBacon_100": {"srl_TacticalBacon_75"};
			case "srl_TacticalBacon_75": {"srl_TacticalBacon_50"};
			case "srl_TacticalBacon_50": {"srl_TacticalBacon_25"};
			case "srl_TacticalBacon_25": {""};
		};

		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {12} else {25};
	};

	//бобы (убраны из магазина)
	case (_oldItem in ["srl_BakedBeans_100","srl_BakedBeans_75","srl_BakedBeans_50","srl_BakedBeans_25"]): {
		_newItem = switch (_oldItem) do {
			case "srl_BakedBeans_100": {"srl_BakedBeans_75"};
			case "srl_BakedBeans_75": {"srl_BakedBeans_50"};
			case "srl_BakedBeans_50": {"srl_BakedBeans_25"};
			case "srl_BakedBeans_25": {""};
		};

		_sound = "action_eat_1";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {10} else {25};
	};

	case (_oldItem in ["srl_cereal","srl_cereal_50"]): {
		_newItem = switch (_oldItem) do {
			case "srl_cereal": {"srl_cereal_50"};
			case "srl_cereal_50": {""};
		};

		_sound = "action_eating_cereal";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {20} else {40};
	};

	case (_oldItem in ["srl_Steak","srl_SmithsChips"]): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {25} else {50};
	};

	case (_oldItem isEqualTo "srl_HamCheeseSanga"): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {10} else {20};
	};

	case (_oldItem isEqualTo "sl_burger_mag"): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {20} else {40};
	};

	case (_oldItem isEqualTo "sl_pizza_mag"): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {60} else {80};
	};

	//основная еда (жаренное мясо и рыба)
	case (_oldItem in ["srl_MeatC","srl_FishC"]): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {30} else {60};
	};

	//фрукт
	case (_oldItem in ["srl_Apple","srl_Peach","srl_Banana","srl_PineApple","srl_Coconut"]): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {10} else {20};
		_thirstAmount = 10;
	};
};

if (_newItem != "" && {!(player canAdd _newItem)}) exitWith {life_action_inUse = false; ["Инвентарь переполнен","error"] call SunriseClient_gui_bottomNotification};

if (NOTINVEH(player)) then {player playAction _action};

switch (_type) do {
	case "eat" : {titleText["Кушаем...","PLAIN"]};
	case "drink" : {titleText["Пьем...","PLAIN"]};
	default {};
};

player say3D _sound;
uiSleep 5;
player say3D _sound;
uiSleep 5;

if (call SunriseClient_system_isInterrupted) exitWith {life_action_inUse = false};

if !([_oldItem] call SunriseClient_system_removeItem) exitWith {life_action_inUse = false;["Не удалось удалить предмет","error"] call SunriseClient_gui_bottomNotification};
if !(EQUAL(_newItem,"")) then {[_newItem] call SunriseClient_system_addItem};

private _life_thirst = life_thirst + _thirstAmount;
if (_life_thirst > 100) then {_life_thirst = 100};
life_thirst = _life_thirst;

private  _life_hunger = life_hunger + _hungerAmount;
if (_life_hunger > 100) then {_life_hunger = 100};
life_hunger = _life_hunger;

if (_hungerAmount > 0) then {[format["- %1%2 голода",_hungerAmount,"%"]] spawn SunriseClient_gui_Notification};
if (_thirstAmount > 0) then {[format["- %1%2 жажды",_thirstAmount,"%"]] spawn SunriseClient_gui_Notification};

switch (_type) do {
	case "eat" : {
		if (life_diarrhea) then {
			titleText["Вы частично утолили голод, но эффект ослаблен из-за диареи","PLAIN"];
		} else {
			titleText["Вы утолили голод","PLAIN"];
		};
	};
	case "drink" : {titleText["Вы утолили жажду","PLAIN"];};
	default {};
};

if (_oldItem in ["srl_canteen_dirty","srl_bottle_dirty","srl_Meat"]) then {
	if (random 1 > perk_immunity) then {
		life_sickness = true;
		[getPlayerUID player,"life_sickness",life_sickness] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
	} else {
		life_diarrhea = true;
		[getPlayerUID player,"life_diarrhea",life_diarrhea] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
	};
};

if (_oldItem in ["srl_canteen_salt","srl_bottle_salt","srl_HamCheeseSanga","sl_burger_mag","sl_pizza_mag"] && (random 1 > (perk_immunity + 0.9))) then {
	life_sickness = true;
	[getPlayerUID player,"life_sickness",life_sickness] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
};

if (_oldItem in ["srl_HamCheeseSanga","sl_burger_mag","sl_pizza_mag"] && (random 1 > perk_immunity)) then {
	life_diarrhea = true;
	[getPlayerUID player,"life_diarrhea",life_diarrhea] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
};

if (_oldItem in ["srl_CarltonDraught","srl_Coopers","srl_Corona","srl_Jimbeam"]) then {
	if (isNil "life_drink") then {life_drink = 0};
	life_drink = life_drink + 0.02;
	if (life_drink >= 0.04) then {
		[] spawn SunriseClient_system_drinkbeer;
	};
};
[] call SunriseClient_fast_hudWeaponUpdate;
life_action_inUse = false;