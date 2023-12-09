/*

	Filename: 	SunriseClient_setdamage.sqf
    Project: 	Sunrise Altis Life
	Author:		Sunrise Team
	
*/
#include "..\script_macros.hpp"
_damage = [_this,0,-1,[0]] call BIS_fnc_param;
_mode = [_this,1,"",[""]] call BIS_fnc_param;

if (_damage isEqualTo -1) exitWith {};
if (_mode isEqualTo "") exitWith {};
if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) exitWith {};

private _damagePlayer = damage player;
_damage = _damage * 0.01;

switch (_mode) do {
	case "damage": {
		if ((_damagePlayer + _damage) < 0.88) then {
			player setDamage (_damagePlayer + _damage);
			if (life_blood_legs && !life_morphine_used) then {
				[player, "HitLegs", 1, false] call BIS_fnc_setHitPointDamage
			};
		} else {
			[player,player] call SunriseClient_dmg_Agony;
		};
	};
	case "heal": {
		if ((_damagePlayer - _damage) < 0) then {
			player setDamage 0;
			if (life_blood_legs && !life_morphine_used) then {
				[player, "HitLegs", 1, false] call BIS_fnc_setHitPointDamage
			};
		} else {
			player setDamage (_damagePlayer - _damage);
			if (life_blood_legs && !life_morphine_used) then {
				[player, "HitLegs", 1, false] call BIS_fnc_setHitPointDamage
			};
		};
	};
	default {};
};

if !(life_blood_legs) then {[player, "HitLegs", 0, false] call BIS_fnc_setHitPointDamage};
