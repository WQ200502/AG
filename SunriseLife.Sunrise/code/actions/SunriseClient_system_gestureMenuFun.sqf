/*

	Filename: 	SunriseClient_system_gestureMenuFun.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isnull (findDisplay 37400)};

private _display = findDisplay 37400;
INIT_BUTTON(1,37402,localize "STR_GSTR_Bouncer","[""cl3_bouncer""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(2,37403,localize "STR_GSTR_Pray","[""cl3_bow_pray""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(3,37404,localize "STR_GSTR_Clapping","[""cl3_clapping""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(4,37405,localize "STR_GSTR_HandStand","[""cl3_hand_stand""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(5,37406,localize "STR_GSTR_Muscle","[""cl3_muscle""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(6,37409,localize "STR_GSTR_PushUps","[""cl3_pushups""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(7,37410,localize "STR_GSTR_Violin","[""cl3_violin""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(8,37411,localize "STR_GSTR_Wank","[""cl3_wank""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(9,37412,localize "STR_GSTR_Wanker","[""cl3_wanker""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(10,37413,localize "STR_GSTR_ThumbsUp","[""cl3_thumbs_up""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(11,37414,localize "STR_GSTR_ThumbsDown","[""cl3_thumbs_down""] call SunriseClient_gestures_playAction; closeDialog 0;");