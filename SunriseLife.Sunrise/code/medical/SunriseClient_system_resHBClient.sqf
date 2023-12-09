/*

	Filename: 	SunriseClient_system_resHBClient.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

[player,"medicStatus"] call SunriseClient_system_clearGlobalVar;
player SVAR ["tf_unable_to_use_radio", false];
TF_speak_volume_meters = 5;
player setUnconscious false;

["Death_Screen_V2"] call SunriseClient_gui_DestroyRscLayer;
player setDamage 0;

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
[player,"firstAid","NOTHEALED"] call CBA_fnc_setVarNet;

2 fadeSound 1;
cutText ["Вы приходите в себя...", "BLACK IN", 5];
uiSleep 4;

if (life_is_arrested) then {
	life_is_arrested = false;
	[player,true,life_jail_time] call SunriseClient_system_jail;
};
if (life_thirst < 10) then {life_thirst = 10};
if (life_hunger < 10) then {life_hunger = 10};
if (LIFE_HANDLE_HUD isEqualTo -1) then {[] call SunriseClient_hud_init};
if (LIFE_HANDLE_EFFECTS isEqualTo -1) then {LIFE_HANDLE_EFFECTS = [SunriseClient_effects_Init,2] call CBA_fnc_addPerFrameHandler};