/*

	Filename: 	SunriseClient_buffeffects.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF
	Web:		http://sunriserp.ru

*/
#include "..\..\..\script_macros.hpp"
private _variable = param [0,"",[""]];

if (_variable isEqualTo "") exitWith {};
if !(GVAR_MNS _variable) exitWith {};
if !(isNull (missionnamespace getVariable [format ["%1_handler",_variable],objNull])) exitWith {};

private _tmp_var = objNull;

switch (_variable) do {
	case "life_bleeding": {
		_tmp_var = [] spawn {
			while {life_bleeding && alive player} do {
				[5,"damage"] call SunriseClient_setDamage;
				player setBleedingRemaining 10;
				addcamShake[1, 2, 10];
				[5000] call BIS_fnc_bloodEffect;				
				uiSleep 30;
			};
		};
	};
	case "life_pain_shock": {
		_tmp_var = [] spawn {
			while {life_pain_shock && alive player} do {
				if (life_pain_shock && alive player && !life_drink_buff) then {
				addcamShake[3, 5, 6]};
				uiSleep 5;
			};
		};
	};
	case "life_blood_legs": {
		_tmp_var = [] spawn {
			if (!isNull life_DraggedBody) then {[] call SunriseClient_system_dropDeadBody;};
			while {life_blood_legs && alive player} do {
				if (life_blood_legs && (alive player) && ((player getHitPointDamage "HitLegs") != 1) && !life_morphine_used) then {
					[player, "HitLegs", 1, false] call BIS_fnc_setHitPointDamage;
				};
				uiSleep 1;
			};
		};
	};
	case "life_speed_buff": {
		STAMINA = [] spawn {
			player enableStamina false;
			waitUntil {(player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) OR !life_speed_buff};
			player enableStamina true;
		};
	};
	case "life_adrenalin_used": {
		_tmp_var = [] spawn {
			player setAnimSpeedCoef 1.15;
			waitUntil {(player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) OR !life_adrenalin_used};
			player setAnimSpeedCoef 1;
		};
	};
	case "life_psyho_used": {
		_tmp_var = [] spawn {
			player setUnitRecoilCoefficient 0.7;
			waitUntil {(player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) OR !life_psyho_used};
			player setUnitRecoilCoefficient 1;
			["Психо","life_depsyho_used",60,0] call SunriseClient_addbuff;
		};
	};
	case "life_stepHeal_buff": {
		_tmp_var = [] spawn {
			while {life_stepHeal_buff && alive player} do {
				if ((damage player) <= 0.25) then {
					["life_stepHeal_buff"] call SunriseClient_removebuff;
				} else {
				if (random(100)<= 60) then {
					[1,"take"] call SunriseClient_setFood;
				} else {
					[1,"take"] call SunriseClient_setWater;
				};
					[1,"heal"] call SunriseClient_setDamage;
				};
				uiSleep 4;
			};
		};
	};
	case "life_pretolan_buff": {
		_tmp_var = [] spawn {
			while {life_pretolan_buff && alive player} do {
				if (random(100)<= 30) then {
					if (random(100)<= 50) then {
						[1,"take"] call SunriseClient_setFood;
					} else {
						[1,"take"] call SunriseClient_setWater;
					};
				};
				[1,"heal"] call SunriseClient_setDamage;
				uiSleep 10;
			};
		};
	};
	case "life_drink_buff": {
		_tmp_var = [] spawn {
			LIFE_PPE_DRUNK = ppEffectCreate ["ChromAberration", 1412];
			LIFE_PPE_DRUNK ppEffectEnable true;
			while {life_drink_buff && alive player} do {
				if (life_drink > 0.2) then {life_drink = 0.2};		
				LIFE_PPE_DRUNK ppEffectAdjust[life_drink, life_drink,true];
				LIFE_PPE_DRUNK ppEffectCommit 1;
				uiSleep 120;
				
				life_drink = life_drink - 0.005;
				if (life_drink <= 0) exitWith {
					["life_drink_buff"] call SunriseClient_removebuff;
				};
			};
			LIFE_PPE_DRUNK ppEffectAdjust [0,0,false];
			LIFE_PPE_DRUNK ppEffectCommit 2;
			LIFE_PPE_DRUNK = -1;
			life_drink = 0;
		};
	};
	default {   }; 
};

missionnamespace setVariable [format ["%1_handler",_variable],_tmp_var];
