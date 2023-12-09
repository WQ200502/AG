#include "..\..\script_macros.hpp"
/*

	Filename: 		fn_useHotKey.sqf
	Project: 	  	AmazingLife - RPG
	Author:		  	AmazingTeam
	E-mail:		  	dev@amazingrp.ru
	Web:		    http://amazingrp.ru/

*/
private _useKeyNumber = [_this,0,-1,[0]] call BIS_fnc_param;
private _infoKey = [_this,1,[],[[]]] call BIS_fnc_param;

if (_useKeyNumber isEqualTo -1) exitWith {};

private _unit = player;
//private _vehicle = vehicle _unit;
private _target = cursorTarget;
private _object = cursorObject;

switch (_useKeyNumber) do {
    case 0: {
      if ((primaryWeapon _unit) isEqualTo "") exitWith {};
      if ((currentWeapon player) isEqualTo (primaryWeapon _unit)) exitWith {};

    	_weapon = primaryWeapon _unit;
    	_wepIdx = 0;
    	_unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
    	while{true} do {
    		if ((currentWeapon _unit) isEqualTo _weapon) exitWith {
    			[] call SunriseClient_system_SwitchWeaponHandler;
    		};
    		_wepIdx = _wepIdx + 1;
        _unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
    	};
      [] call SunriseClient_fast_hudWeaponUpdate;
	  [] call SunriseClient_evh_click_check;
    };
    case 1: {
      if ((secondaryWeapon _unit) isEqualTo "") exitWith {};
      if ((currentWeapon player) isEqualTo (secondaryWeapon _unit)) exitWith {};

    	_weapon = secondaryWeapon _unit;
    	_wepIdx = 0;
    	_unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
    	while{true} do {
    		if ((currentWeapon _unit) isEqualTo _weapon) exitWith {
    			[] call SunriseClient_system_SwitchWeaponHandler;
    		};
    		_wepIdx = _wepIdx + 1;
        _unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
    	};
      [] call SunriseClient_fast_hudWeaponUpdate;
	  [] call SunriseClient_evh_click_check;
    };
    case 2: {
      if ((handgunWeapon _unit) isEqualTo "") exitWith {};
      if ((currentWeapon _unit) isEqualTo (handgunWeapon _unit)) exitWith {};

    	_weapon = handgunWeapon _unit;
    	_wepIdx = 0;
    	_unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
    	while{true} do {
    		if ((currentWeapon _unit) isEqualTo _weapon) exitWith {
    			[] call SunriseClient_system_SwitchWeaponHandler;
    		};
    		_wepIdx = _wepIdx + 1;
        _unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
    	};
      [] call SunriseClient_fast_hudWeaponUpdate;
	  [] call SunriseClient_evh_click_check;
    };
    default {};
};

if (_useKeyNumber in [0,1,2]) exitWith {};
if (_infoKey isEqualTo []) exitWith {};

private _type = _infoKey select 0;
private _item = _infoKey select 1;

//Для еды.воды 1 бинд на все банки
if ((_type isEqualTo "inventory") && !(_item in (magazines player)) && (_item in ["srl_TacticalBacon_100","srl_TacticalBacon_75","srl_TacticalBacon_50","srl_TacticalBacon_25"])) then {
	{
		if (_x in (magazines player)) then {
			_item = _x;
		};
	} forEach ["srl_TacticalBacon_100","srl_TacticalBacon_75","srl_TacticalBacon_50","srl_TacticalBacon_25"];
};

if ((_type isEqualTo "inventory") && !(_item in (magazines player)) && (_item in ["srl_BakedBeans_100","srl_BakedBeans_75","srl_BakedBeans_50","srl_BakedBeans_25"])) then {
	{
		if (_x in (magazines player)) then {
			_item = _x;
		};
	} forEach ["srl_BakedBeans_100","srl_BakedBeans_75","srl_BakedBeans_50","srl_BakedBeans_25"];
};
if ((_type isEqualTo "inventory") && !(_item in (magazines player)) && (_item in ["srl_cereal","srl_cereal_50"])) then {
	{
		if (_x in (magazines player)) then {
			_item = _x;
		};
	} forEach ["srl_cereal","srl_cereal_50"];
};
if ((_type isEqualTo "inventory") && !(_item in (magazines player)) && (_item in ["srl_canteen_clean_3","srl_canteen_clean_2","srl_canteen_clean_1"])) then {
	{
		if (_x in (magazines player)) then {
			_item = _x;
		};
	} forEach ["srl_canteen_clean_3","srl_canteen_clean_2","srl_canteen_clean_1"];
};
if ((_type isEqualTo "inventory") && !(_item in (magazines player)) && (_item in ["srl_bottleclean_100","srl_bottleclean_50"])) then {
	{
		if (_x in (magazines player)) then {
			_item = _x;
		};
	} forEach ["srl_bottleclean_100","srl_bottleclean_50"];
};

if ((_type isEqualTo "inventory") && !(_item in (magazines player))) exitWith {["error","Оружейный HUD","Предмет отсутствует"] call SunriseClient_message};

switch (_type) do {
    case "inventory": {
      switch(true) do
      {
      	case (EQUAL(_item,"srl_blastingcharge")): {
      		if !(NOTINVEH(player)) exitWith {["error","Инвентарь","Этот предмет нельзя использовать в технике"] call SunriseClient_message};
              player reveal fed_bank;
              (group player) reveal fed_bank;
              [_object] spawn SunriseClient_system_blastingCharge;
      	};
      	case (_item in ["srl_canteen_clean_3","srl_canteen_clean_2","srl_canteen_clean_1","srl_bottleclean_100","srl_bottleclean_50","srl_Spirit","srl_franta","srl_canteen_dirty","srl_bottle_dirty","srl_CarltonDraught","srl_Coopers","srl_Corona","srl_Jimbeam"]): {
      		[_item] spawn SunriseClient_system_food;
      	};

      	case (_item in ["srl_cereal","srl_cereal_50","srl_TacticalBacon_100","srl_TacticalBacon_75","srl_TacticalBacon_50","srl_TacticalBacon_25","srl_BakedBeans_100","srl_BakedBeans_75","srl_BakedBeans_50","srl_BakedBeans_25","srl_MeatC","srl_MeatB","srl_SmithsChips","srl_Steak","srl_Ration_A","srl_Ration_B","srl_Sardine_100","srl_Sardine_50","srl_canFruits_100","srl_canFruits_75","srl_canFruits_50","srl_canFruits_25","srl_HamCheeseSanga","srl_MaggiiNoodle","srl_Sausages","srl_Bread"]): {
      		[_item] spawn SunriseClient_system_food;
      	};

      	case (_item in ["srl_TacticalBacon","srl_BakedBeans","srl_Sardine","srl_canFruits"]): {
      		if ("srl_canopener" in (magazines player)) then {
      			[_item] spawn SunriseClient_system_canOpener;
      		} else {
      			["error","Инвентарь","Консерва закрыта. Нужна открывашка."] call SunriseClient_message;
      		};
      	};

      	case (_item == "srl_woodenLog"): {
      		if ("srl_matches" in (magazines player)) then {
      			if(vehicle player != player) exitWith {["error","Инвентарь","Этот предмет нельзя использовать в технике"] call SunriseClient_message};
      			[_item] spawn SunriseClient_system_campFire;
      		} else {
      			["error","Инвентарь","Не хватает спичек"] call SunriseClient_message;
      		};
      	};

      	case (_item in ["srl_canteen_empty","srl_bottle_empty"]): {
      		if !(NOTINVEH(player)) exitWith {["error","Инвентарь","Этот предмет нельзя использовать в технике"] call SunriseClient_message};
      		[_item] spawn SunriseClient_system_refuelWater;
      	};
      	case (_item in ["srl_redgull","srl_Buffout","srl_ItemJet","srl_ItemPsycho","srl_ItemRadX","srl_ItemTurbo","srl_ItemAdrenaline"]): {
      		[_item] spawn SunriseClient_system_buffMe;
      	};

      	case (_item in ["srl_ItemDetoxin","srl_vitaminbottle","srl_bandage","srl_antibiotic","srl_painkillers","srl_ItemMorphine","srl_ItemSurgeryKit","amazing_heel_tabs_elleg","amazing_heel_tabs_off","srl_tire_new"]): {
      		[_item] spawn SunriseClient_system_healMe;
      	};

      	case (_item == "srl_Fuelcan"): {
      		if !(NOTINVEH(player)) exitWith {["error","Инвентарь","Этот предмет нельзя использовать в технике"] call SunriseClient_message};
      		[_item,_object] spawn SunriseClient_system_refuelJerrycan;
      	};

      	case (_item == "srl_Waterpure"): {
      		if ("srl_canteen_dirty" in (magazines player) OR "srl_bottle_dirty" in (magazines player)) then {
      			[_item] spawn SunriseClient_system_clearWater;
      		} else {["error","Инвентарь","У вас нет грязной воды для очистки"] call SunriseClient_message};
      	};

      	case (_item == "srl_MetalWire" && isNull life_spikestrip): {
      		if !(NOTINVEH(player)) exitWith {["error","Инвентарь","Этот предмет нельзя использовать в технике"] call SunriseClient_message};
      		[] spawn SunriseClient_system_spikeStrip;
      	};
      	case (_item == "srl_lockpick"): {
      		if !(NOTINVEH(player)) exitWith {["error","Инвентарь","Этот предмет нельзя использовать в технике"] call SunriseClient_message};
      		[] spawn SunriseClient_system_lockpick;
      	};
      	default {["error","Инвентарь","Этот предмет нельзя использовать"] call SunriseClient_message};
      };
    };
    case "gesture": {
      [_item] call SunriseClient_system_gestureMenu;
    };
    case "dance": {
      [_item] spawn SunriseClient_gestures_danceAction;
    };
    case "pose": {
      [_item] spawn life_fnc_pose;
    };

    default {
      /* code */
    };
};
