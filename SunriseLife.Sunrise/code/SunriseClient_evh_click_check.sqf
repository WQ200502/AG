#include "..\script_macros.hpp"
/*

	Filename: 	SunriseClient_evh_click_check.sqf
	Project: 	AmazingLife - RPG
	Author:		AmazingTeam
	E-mail:		dev@amazingrp.ru
	Web:		http://amazingrp.ru/

*/

/*private _melee = ["am_axe","am_batclear","am_batv2","am_bat_saw","am_pickaxe","am_shovel","am_policeStick","am_katana","am_knife","am_dildo","am_tab","am_guitar"];
if (currentWeapon player in _melee) then {
	if (life_evh_index_click_mouse isEqualTo -1) then {
		life_evh_index_click_mouse = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
			if ((_this select 1 isEqualTo 0)) then {
				[player,true] spawn life_fnc_melee_attack;
			};
		}];
	};
} else {
	if !(life_evh_index_click_mouse isEqualTo -1) then {
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", life_evh_index_click_mouse];
		life_evh_index_click_mouse = -1;
	};
};*/