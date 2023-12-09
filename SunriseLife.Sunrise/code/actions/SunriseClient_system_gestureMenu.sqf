/*

	Filename: 	SunriseClient_system_gestureMenu.sqf
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
INIT_BUTTON(1,37402,localize "STR_GSTR_Forward","[""CRPTHSForward""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(2,37403,localize "STR_GSTR_Stop","[""CRPTHSStop""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(3,37404,localize "STR_GSTR_Regroup","[""CRPTHSRegroup""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(4,37405,localize "STR_GSTR_Engage","[""CRPTHSEngage""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(5,37406,localize "STR_GSTR_Point","[""CRPTHSPoint""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(6,37409,localize "STR_GSTR_Hold","[""CRPTHSHold""] call SunriseClient_gestures_playAction; closeDialog 0;");
INIT_BUTTON(7,37410,localize "STR_GSTR_Warning","[""CRPTHSWarning""] call SunriseClient_gestures_playAction; closeDialog 0;");

/*_Btn8 ctrlSetText localize "STR_GSTR_Yes";
_Btn8 buttonSetAction "[""srl_yes""] call SunriseClient_gestures_playAction; closeDialog 0;";

_Btn9 ctrlSetText localize "STR_GSTR_No";
_Btn9 buttonSetAction "[""srl_no_way""] call SunriseClient_gestures_playAction; closeDialog 0;";

_Btn10 ctrlSetText localize "STR_GSTR_Finger";
_Btn10 buttonSetAction "[""srl_middle_finger""] call SunriseClient_gestures_playAction; closeDialog 0;";

_Btn11 ctrlSetText localize "STR_GSTR_SuckIt";
_Btn11 buttonSetAction "[""srl_suck_it""] call SunriseClient_gestures_playAction; closeDialog 0;";
*/