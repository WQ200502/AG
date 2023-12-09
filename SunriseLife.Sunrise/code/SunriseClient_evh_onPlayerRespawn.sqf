/*

	Filename: 	SunriseClient_evh_onPlayerRespawn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
life_corpse = param [1,ObjNull,[ObjNull]];
player setpos getMarkerPos "respawn_civilian";

[life_corpse] spawn SunriseClient_system_dropItems;

[_unit] call SunriseClient_system_clearAllLifeVars;
["all"] call SunriseClient_removeBuff;

[] call SunriseClient_system_setTag;
[] call SunriseClient_system_setTitle;

["cash","drop",0] call SunriseClient_system_myCash;

_unit addRating 9999999999999999;

[_unit,"lifeState","RESPAWN"] call CBA_fnc_setVarNet;
[_unit,"karma",life_karma] call CBA_fnc_setVarNet;
[_unit,"newbie",life_newbie] call CBA_fnc_setVarNet;

switch(true) do {
	case (life_copDuty): {
		[_unit,"copLevel",life_coplevel] call CBA_fnc_setVarNet;
		[] call SunriseClient_loadout_cop;
	};
	case (life_medDuty): {
		[_unit,"medrank",life_medlevel] call CBA_fnc_setVarNet;
		[] call SunriseClient_loadout_medic;
	};
	default {
		[_unit,"lvl",life_civlevel] call CBA_fnc_setVarNet;
		[] call SunriseClient_loadout_civ;	
	};
};
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_prisonkey = false;
life_respawned = false;
life_slave = false;
life_pvp = false;
life_inwarzone = false;
life_surrended = false;
life_newLife = true;
life_ids = [];
life_tempHouses = [];

_unit playMoveNow "AinjPpneMstpSnonWnonDnon";
removeBackpack _unit;
removeAllWeapons _unit;

if !(EQUAL((goggles _unit),"")) then {removeGoggles _unit};
if !(EQUAL((goggles life_corpse),"")) then {removeGoggles life_corpse};

[] call SunriseClient_surgery_Init;
//[] call SunriseClient_init_actions;
if (LIFE_SETTINGS(getNumber,"life_enableFatigue") isEqualTo 0) then {_unit enableFatigue false};

[] call SunriseClient_system_saveGear;