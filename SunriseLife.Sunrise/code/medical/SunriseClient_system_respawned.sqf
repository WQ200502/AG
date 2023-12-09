/*

	Filename: 	SunriseClient_system_respawned.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
player SVAR ["tf_unable_to_use_radio",false];
TF_speak_volume_meters = 5;
["all"] call SunriseClient_removeBuff;

if !(isNull life_corpse) then {deleteVehicle life_corpse};

2 fadeSound 1;
cutText ["", "BLACK IN", 1];

if (BANK > 100000 && !(life_copDuty OR life_medDuty)) then {
	private _price = BANK * 0.045;
	//if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
	["atm","take",_price] call SunriseClient_system_myCash;
 	hint parseText format["<t size='2.2'><t color='#1dae0e'>Новая жизнь</t></t><br /><br /> Ваше возрождение обошлось вам в $%1 (4.5%2 от вашего банковского счета). Цените свою жизнь!", [_price] call SunriseClient_system_numberText,"%"];
};

[] call SunriseClient_fast_hudWeaponUpdate;
[] call SunriseClient_system_updateViewDistance;

if (LIFE_HANDLE_EFFECTS isEqualTo -1) then {LIFE_HANDLE_EFFECTS = [SunriseClient_effects_Init,2] call CBA_fnc_addPerFrameHandler};

player enableStamina true;
player switchMove "amovpercmstpsnonwnondnon";
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

/*ADD(life_deaths,1);
if (life_deaths >= life_deaths_max) then {
	[true] spawn SunriseClient_system_logout;
} else {
	[parseText format ["<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Внимание!<br/><br/></t>Вы умерли <t color='#ffd800'>%1</t> раз(а) из <t color='#ffd800'>%2</t> допустимых.<br/>После достижения лимита вы не сможете зайти до следующей бури.<br/><br/> <t color='#9cff00'>Цените свою жизнь!</t></t>", life_deaths, life_deaths_max],[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
};*/

[] call SunriseClient_experience_initPerks;

if (life_is_arrested) exitWith {
	closeDialog 0;
	life_death_markers = [];
	life_death_endtime = 0;
	[] call SunriseClient_system_inJail;
	[] call SunriseClient_session_updateRequest;
};

[serverTime + 1200] call SunriseClient_system_DeathTimer;
[] call SunriseClient_session_updateRequest;