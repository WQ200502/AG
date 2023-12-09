/*
	
	Filename: 	SunriseClient_gestures_danceMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isnull (findDisplay 37400)};

private _display = findDisplay 37400;
INIT_BUTTON(1,37402,"Ivan",'["cl3_duoivan"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(2,37403,"Stefan",'["cl3_stephan"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(3,37404,"Stefan V",'["cl3_duostephan"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(4,37405,"Night Club",'["cl3_nightclubdance"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(5,37406,"DubStep",'["cl3_dubstepdance"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(6,37409,"DubStep Pop",'["cl3_dubsteppop"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(7,37410,"Hip Hop",'["cl3_hiphopdance"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(8,37411,"Crazy Drunk",'["cl3_crazydrunkdance"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(9,37412,"Robot",'["cl3_robotdance"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(10,37413,"Танец 1",'["Acts_Dance_01"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(11,37414,"Танец 2",'["Acts_Dance_02"] spawn SunriseClient_gestures_danceAction; closeDialog 0;');
INIT_BUTTON(12,37415,localize "STR_pInAct_Cancel","[] call SunriseClient_system_animDo; closeDialog 0;");

if (life_dance) then {
	_b1 ctrlEnable false;
	_b2 ctrlEnable false;
	_b3 ctrlEnable false;
	_b4 ctrlEnable false;
	_b5 ctrlEnable false;
	_b6 ctrlEnable false;
	_b7 ctrlEnable false;
	_b8 ctrlEnable false;
	_b9 ctrlEnable false;
	_b10 ctrlEnable false;
	_b11 ctrlEnable false;
};