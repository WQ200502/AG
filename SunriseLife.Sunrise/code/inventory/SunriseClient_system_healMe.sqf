/*

	Filename: 	SunriseClient_system_healMe.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];

if (EQUAL(_item,"")) exitWith {};

switch(true) do {
	case (_item == "srl_ItemDetoxin"): {
		titleText["Применяем детоксин...","PLAIN"];		
		player say3D "action_morphine";
		if (NOTINVEH(player)) then {
			call SunriseClient_animation_kneelWork;
			uiSleep 6;		
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;

		if (random(100) < (70 * perk_pharmacist)) then {
			life_drug_light = false;[getPlayerUID player,"life_drug_light",life_drug_light] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
			life_drug_hard = false;[getPlayerUID player,"life_drug_hard",life_drug_hard] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
			titleText["Вы избавились от наркозависимостей.","PLAIN"];
		} else {titleText["Не удалось избавиться от зависимости. Попробуйте еще.","PLAIN"]};

	};

	case (_item == "srl_bandage"): {
		titleText["Бинтуемся...","PLAIN"];		
		player say3D "action_bandage_0";
		if (NOTINVEH(player)) then {
			call SunriseClient_animation_kneelWork;
			uiSleep 6;		
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;		 
		["life_bleeding"] call SunriseClient_removeBuff;
		titleText["Вы перебинтовались и остановили кровотечение.","PLAIN"];
	};

	case (_item == "srl_ItemMorphine"): {
		titleText["Делаем укол Морфина...","PLAIN"];		
		player say3D "action_morphine";
		if (NOTINVEH(player)) then {
			call SunriseClient_animation_kneelWork;
			uiSleep 6;		
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;

		if (random(100) < (80 * perk_pharmacist)) then {			 
			["life_blood_legs"] call SunriseClient_removeBuff;
			titleText["Укол снял эффект от критического ранения.","PLAIN"];
		} else {titleText["Не удалось избавиться от критического ранения. Попробуйте еще...","PLAIN"];};
	};

	case (_item == "srl_vitaminbottle"): {

		titleText["Принимаем витамины...","PLAIN"];		
		player say3D "action_painkiller_3";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;

		if (random(100) < (50 * perk_pharmacist)) then {
			life_diarrhea = false;
			[getPlayerUID player,"life_diarrhea",life_diarrhea] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
			titleText["Витамины поправили ваще здоровье и избавили от диареи.","PLAIN"];
		} else {titleText["Не удалось избавиться от диареи. Попробуйте еще...","PLAIN"]};

	};

	/*case (_item == "srl_antibiotic"): {

		titleText["Принимаем антибиотики...","PLAIN"];
		player say3D "action_painkiller_3";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;

		if (random(100) < (50 * perk_pharmacist)) then {
			life_sickness = false;
			titleText["Курс антибиотиков поправил ваще здоровье и избавил от болезней.","PLAIN"];
		} else {titleText["Не удалось вылечиться от болезней. Попробуйте еще...","PLAIN"]};

	};*/

	case (_item == "srl_painkillers"): {

		titleText["Принимаем болеутоляющее...","PLAIN"];
		player say3D "action_painkiller_3";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call SunriseClient_system_removeItem;

		if (random(100) < (80 * perk_pharmacist)) then {			 
			["life_pain_shock"] call SunriseClient_removeBuff;
			titleText["Эффект от травматического шока нейтрализован.","PLAIN"];
		} else {titleText["Не удалось избавиться от травматического шока. Попробуйте еще...","PLAIN"]};

	};
};
[] call SunriseClient_fast_hudWeaponUpdate;