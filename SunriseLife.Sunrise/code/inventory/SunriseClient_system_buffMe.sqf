/*

	Filename: 	SunriseClient_system_buffMe.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (call SunriseClient_system_isInterrupted) exitWith {};
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {};
if (_item isEqualTo "") exitWith {};

private _buffType = "";
private _drug = "";
private _buffTime = 0;
private _chance = 0;

private _itemInfo = [_item] call SunriseClient_system_itemDetails;
private _itemName = _itemInfo select 1;
private _itemIcon = _itemInfo select 2;

switch (_item) do {
	case "srl_Buffout": {
		_buffType = "speed_buff";
		_drug = "";
		if (life_copDuty) then {
			_buffTime = switch (FETCH_CONST(life_donator)) do {
				case 0: {5};
				case 1: {5};
				case 2: {7};
				case 3: {10};
				case 4: {10};
			};
		} else {_buffTime = 5};		
		_chance = 0;
	};
	case "srl_ItemJet": {
		_buffType = "jet_buff";
		_drug = "light";
		_buffTime = 8;		
		_chance = 15;
	};
	case "srl_ItemPsycho": {
		_buffType = "speed_buff";
		_drug = "hard";
		_buffTime = 15;		
		_chance = 15;
	};

	case "srl_ItemRadX": {
		_buffType = "radx_buff";
		_buffTime = 20;
	};

	case "srl_ItemTurbo": {
		_buffType = "turbo_buff";
		_drug = "light";
		_chance = 15;
		_buffTime = 10;
	};

	case "srl_redgull": {
		_buffType = "redgull_buff";
		_buffTime = 1;	
	};
	
	case "srl_ItemAdrenaline": {
		_buffType = "life_adrenalin_used";
		_buffTime = 5;
	};
};

if (_buffType == "") exitWith {};
_buffTime = _buffTime * 60;

switch(true) do {
	case (_buffType == "speed_buff" && life_speed_buff): {["error","Инвентарь","Вы уже находитесь под эффектом, ускоряющим регенерацию бодрости"] call SunriseClient_message};
	case (_buffType == "turbo_buff" && life_turbo_used): {["error","Инвентарь","Вы уже находитесь под эффектом от трубо"] call SunriseClient_message};
	case (_buffType == "life_adrenalin_used" && life_adrenalin_used): {["error","Инвентарь","Вы уже находитесь под эффектом от адреналина"] call SunriseClient_message};
	case (_buffType == "life_psyho_used" && life_psyho_used): {["error","Инвентарь","Вы уже находитесь под эффектом от психо"] call SunriseClient_message};
	case (_buffType == "radx_buff" && life_radx_used): {["error","Вы уже находитесь под эффектом защиты от радиации!"] call SunriseClient_message};
	case (_buffType == "jet_buff" && life_jet_used): {["error","Инвентарь","Вы уже находитесь под эффектом от Джета"] call SunriseClient_message};

	case (_buffType == "redgull_buff"): {
		call SunriseClient_actions_inUse;
		titleText["Пьем Энергетик...","PLAIN"];
		player say3D "action_drink_soda";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Drink_Water";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;
		player setFatigue 0;
		["Энергетик","life_speed_buff",_buffTime,0] call SunriseClient_addBuff;
		titleText["Энергетик дал вам заряд бодрости!","PLAIN"];
		life_action_inUse = false;
	};

	case (_buffType == "speed_buff" && !life_speed_buff): {
		call SunriseClient_actions_inUse;
		titleText["Принимаем препарат...","PLAIN"];

		if (NOTINVEH(player)) then {
			if (_item == "srl_Buffout") then {
				player playAction "FT_Act_Eat_Bread";
				player say3D "action_painkiller_3";
				uiSleep 10;
			} else {
				call SunriseClient_animation_kneelWork;
				uiSleep 6;
			};
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;
		life_action_inUse = false;

		["Баффаут","life_speed_buff",_buffTime,0] call SunriseClient_addBuff;

		if (_drug != "" && random(100) < _chance) then {
			switch(_drug) do {
				case "light": {life_drug_light = true;hint "У вас появилась легкая зависимость...";[getPlayerUID player,"life_drug_light",life_drug_light] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2]};
				case "hard": {life_drug_hard = true;hint "У вас появилась тяжелая зависимость...";[getPlayerUID player,"life_drug_hard",life_drug_hard] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2]};
			};
		};

		if (life_thirst >= 30) then {
			life_thirst = life_thirst - 10;
		};
	};

	case (_buffType == "radx_buff" && !life_radx_used): {
		call SunriseClient_actions_inUse;
		titleText["Принимаем препарат...","PLAIN"];

		if (NOTINVEH(player)) then {
			call SunriseClient_animation_kneelWork;
			uiSleep 6;
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;
		life_action_inUse = false;

		//["life_radx_used","buff",_buffTime] spawn SunriseClient_system_addBuff;
		["Антирадин","life_radx_used",_buffTime,0] call SunriseClient_addBuff;
	};
	
	case (_buffType == "jet_buff" && !life_jet_used): {
		call SunriseClient_actions_inUse;
		titleText["Принимаем препарат...","PLAIN"];

		if (NOTINVEH(player)) then {
			[player,"ainvpknlmstpsnonwnondnon_medic_1"] remoteExecCall ["SunriseClient_system_animSync",0];
			uisleep 6;
		} else {
			uisleep 5
		};

		[_item] call SunriseClient_system_removeItem;
		life_action_inUse = false;

		if (random(100) < _chance) then {
			[] spawn SunriseClient_effects_cocaine;
		} else {
			["Джет","life_jet_used",_buffTime,0] call SunriseClient_addBuff;
		};
	};
	
	case (_buffType == "life_psyho_used" && !life_psyho_used): {
		call SunriseClient_actions_inUse;
		titleText["Вкалываем психо...","PLAIN"];

		if (NOTINVEH(player)) then {
			[player,"ainvpknlmstpsnonwnondnon_medic_1"] remoteExecCall ["SunriseClient_system_animSync",0];
			uisleep 6;
		} else {
			uisleep 5
		};

		[_item] call SunriseClient_system_removeItem;
		life_action_inUse = false;
		
		if (life_depsyho_used) then {
			["life_depsyho_used"] call SunriseClient_removeBuff;
		};

		["Психо","life_psyho_used",_buffTime,0] call SunriseClient_addBuff;
	};
	
	case (_buffType == "life_adrenalin_used" && !life_adrenalin_used): {
		call SunriseClient_actions_inUse;
		titleText["Вкалываем адреналин...","PLAIN"];

		if (NOTINVEH(player)) then {
			[player,"ainvpknlmstpsnonwnondnon_medic_1"] remoteExecCall ["SunriseClient_system_animSync",0];
			uisleep 6;
		} else {
			uisleep 5
		};

		[_item] call SunriseClient_system_removeItem;
		life_action_inUse = false;

		["Адреналин","life_adrenalin_used",_buffTime,0] call SunriseClient_addBuff;
	};

	case (_buffType == "turbo_buff" && !life_turbo_used): {
		call SunriseClient_actions_inUse;
		titleText["Принимаем препарат...","PLAIN"];

		if (NOTINVEH(player)) then {
			call SunriseClient_animation_kneelWork;
			uiSleep 6;
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;
		life_action_inUse = false;

		["Турбо","life_turbo_used",_buffTime,0] call SunriseClient_addBuff;

		if (_drug != "" && random(100) < _chance) then {
			switch(_drug) do {
				case "light": {life_drug_light = true;hint "У вас появилась легкая зависимость...";[getPlayerUID player,"life_drug_light",life_drug_light] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2]};
				case "hard": {life_drug_hard = true;hint "У вас появилась тяжелая зависимость...";[getPlayerUID player,"life_drug_hard",life_drug_hard] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];};
			};
		};
	};
};
[] call SunriseClient_fast_hudWeaponUpdate;