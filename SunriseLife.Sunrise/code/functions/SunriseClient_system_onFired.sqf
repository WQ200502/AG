/*
	
	Filename: 	SunriseClient_system_onFired.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
params ["_unit","_weapon","_muzzle","_mode","_ammoType","_magazine","_projectile","_gunner"];

switch (true) do {
	case (EQUAL(_ammoType,"sunrise_Ammo_Swing")): {
		deleteVehicle _projectile;
		//if ({_x == "sunrise_Magazine_Swing"} count magazines player > 0) then {player removeMagazines "sunrise_Magazine_Swing"};
		if !(EQUAL((stance _unit),"STAND")) exitWith {hint "Встаньте..."};
		switch (true) do {
			case (_weapon in ["sunrise_Tool_PickAxe","sunrise_Tool_Hoe"]): {player playActionNow "FT_Act_Dig_PickAxe_Loop_Full_3x"; [] spawn SunriseClient_gather_Action;};
			case (EQUAL(_weapon,"sunrise_Tool_Shovel")): {player playActionNow "FT_Act_Dig_Shovel_Loop_Full_3x"; [] spawn SunriseClient_gather_Action;};			
			case (EQUAL(_weapon,"sunrise_Tool_Axe")): {player playActionNow "FT_Act_Axe_Swing"; [] spawn SunriseClient_gather_Tree;};
			default {};
		};		
	}; 
	//Стрельба в круге смерти
	if (life_inDeadZone) exitWith {
		deleteVehicle _projectile;
		player setAmmo[currentWeapon player, 0];
	};
	case (life_newbie) : {
		deleteVehicle _projectile;
		["error","",format["Новоприбывшим на остров нельзя стрелять, уберите оружие"]] call SunriseClient_message;
	};
	case (EQUAL(_magazine,"srl_FlashBang")) : {
		_projectile spawn {
			private "_position";
			while {!isNull _this} do {
				_position = getPosATL _this;
				uiSleep 0.1;
			};		
			[_position] remoteExec ["SunriseClient_system_flashbang",RCLIENT];
		};
	};
	case (EQUAL(_ammoType,"Caseless_blau")): {
		if !(player GVAR ["inPBfight",false]) then {
			deleteVehicle _projectile;
			hint "Вы не можете использовать это оружие вне зоны сражения и без регистрации в бою";
		};
	};
	default {
		life_pvp = true;
		life_pvp_start = time;
		//_this call SunriseClient_suppression_fired;
	}; 
};