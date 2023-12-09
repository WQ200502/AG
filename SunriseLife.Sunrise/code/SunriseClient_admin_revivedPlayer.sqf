/*
	
	Filename: 	SunriseClient_admin_revivedPlayer.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

*/
#include "..\script_macros.hpp"

player setUnconscious false;
player playMoveNow "amovpercmstpsnonwnondnon";

[player,"medicStatus"] call SunriseClient_system_clearGlobalVar;

player SVAR ["tf_unable_to_use_radio", false];
TF_speak_volume_meters = 5;

["all"] call SunriseClient_removeBuff;


["Death_Screen_V2"] call SunriseClient_gui_DestroyRscLayer;
player setDamage 0;

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

2 fadeSound 1;
cutText ["Вы приходите в себя...", "BLACK IN", 5];
uiSleep 4;

if (LIFE_HANDLE_HUD isEqualTo -1) then {[] call SunriseClient_hud_init};
if (LIFE_HANDLE_EFFECTS isEqualTo -1) then {LIFE_HANDLE_EFFECTS = [SunriseClient_effects_Init,2] call CBA_fnc_addPerFrameHandler};

[] call SunriseClient_fast_hudWeaponUpdate;