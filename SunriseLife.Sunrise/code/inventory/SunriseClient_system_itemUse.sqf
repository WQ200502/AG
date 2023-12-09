/*

	Filename: 	SunriseClient_system_itemUse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _idc = _this select 0;
private _selectedIndex = _this select 1;
private _item = CONTROL_DATAI(_idc,_selectedIndex);
private _itemDisplayName = CONTROL_TEXTI(_idc,_selectedIndex);
private _target = cursorObject;

if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};

switch (true) do {
	case (_item isEqualTo ARC_SETTINGS(getText,"initItem")): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		[] spawn SunriseClient_archeology_init;
		closeDialog 0;
	};
	case (_item isEqualTo getText(missionConfigFile >> "LifeCfgHazard" >> "detectorItem")): {
		[] spawn SunriseClient_hazard_detector;
		closeDialog 0;
	};
	case (EQUAL(_item,"srl_grinder")): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		if ((typeOf _target) isEqualTo WZ_SETTINGS(getText,"vehClass")) then {
			[_target] spawn SunriseClient_warzones_openVehicle;
		} else {
			[_target] spawn SunriseClient_system_boltcutter;
		};
		closeDialog 0;
	};

	case (EQUAL(_item,"MineDetector")): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		[_target] spawn SunriseClient_system_defuseKit;
		closeDialog 0;
	};

	case (EQUAL(_item,"srl_MetalWire") && isNull life_spikestrip): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		[] spawn SunriseClient_system_spikeStrip;
		closeDialog 0;
	};

	case (EQUAL(_item,"srl_blastingcharge")): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		if ((typeOf _target) isEqualTo WZ_SETTINGS(getText,"boxClass")) then {
			[_target] spawn SunriseClient_warzones_blastingCharge;
		} else {
			player reveal fed_bank;
			(group player) reveal fed_bank; 
			[_target] spawn SunriseClient_system_blastingCharge;
		};
		closeDialog 0;
	};

	case (_item in ["srl_canteen_empty","srl_bottle_empty"]): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		[_item] spawn SunriseClient_system_refuelWater;
		closeDialog 0;
	};

	case (_item in ["srl_canteen_clean_3","srl_canteen_clean_2","srl_canteen_clean_1","srl_bottleclean_100","srl_bottleclean_50","srl_Spirit","srl_franta","srl_canteen_dirty","srl_bottle_dirty","srl_CarltonDraught","srl_Coopers","srl_Corona","srl_Jimbeam","srl_cereal","srl_cereal_50","srl_TacticalBacon_100","srl_TacticalBacon_75","srl_TacticalBacon_50","srl_TacticalBacon_25","srl_BakedBeans_100","srl_BakedBeans_75","srl_BakedBeans_50","srl_BakedBeans_25","srl_SmithsChips","srl_Steak","srl_MeatC","srl_FishC","srl_Juice","srl_Apple","srl_Peach","srl_Banana","srl_PineApple","srl_Coconut","sl_burger_mag","srl_HamCheeseSanga","sl_pizza_mag"]): {
		[_item] spawn SunriseClient_system_food;
		closeDialog 0;
	};

	case (_item in ["srl_canteen_salt","srl_bottle_salt"]): {
		if ([getPosATL player, 10] call SunriseClient_system_isFireNear) then {
			if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
			[_item] spawn SunriseClient_system_cooking;
			closeDialog 0;
		} else {
			[_item] spawn SunriseClient_system_food;
			closeDialog 0;
		};
	};

	case (EQUAL(_item,"srl_Waterpure")): {
		if ("srl_canteen_dirty" in (magazines player) OR "srl_bottle_dirty" in (magazines player)) then {
			[_item] spawn SunriseClient_system_clearWater;
			closeDialog 0;
		} else {hint "У вас нет грязной воды для очистки"};
	};

	case (EQUAL(_item,"srl_campFire")): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		[_item] spawn SunriseClient_system_campFire;
		closeDialog 0;
	};

	case (EQUAL(_item,"srl_Fuelcan_empty")): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		[_item] spawn SunriseClient_system_refuelJerrycan;
		closeDialog 0;
	};

	case (EQUAL(_item,"srl_Fuelcan")): {
		if !(NOTINVEH(player)) exitWith {["Этот предмет нельзя использовать технике","error"] call SunriseClient_gui_bottomNotification};
		[_item,_target] spawn SunriseClient_system_jerryRefuel;
		closeDialog 0;
	};

	case (EQUAL(_item,"srl_tinContainer")): {
		if (NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы не в технике."};
		[_item] spawn SunriseClient_fishing_placeTraps;
		closeDialog 0;
	};

	case (_item in ["srl_redgull","srl_Buffout","srl_ItemJet","srl_ItemPsycho","srl_ItemRadX","srl_ItemTurbo"]): {
		[_item] spawn SunriseClient_system_buffMe;
		closeDialog 0;
	};

	case (_item in ["srl_ItemDetoxin","srl_vitaminbottle","srl_bandage","srl_antibiotic","srl_painkillers","srl_ItemMorphine"]): {
		[_item] spawn SunriseClient_system_healMe;
		closeDialog 0;
	};

	case (_item in ["srl_TacticalBacon","srl_BakedBeans"]): {
		if ("srl_canopener" in (magazines player)) then {
			[_item] spawn SunriseClient_system_canOpener;
			closeDialog 0;
		} else {
			hint "Консерва закрыта. Нужна открывашка.";
		};
	};

	default {hint "Этот предмет нельзя использовать"};
};