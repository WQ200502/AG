/*

	Filename: 	SunriseClient_system_medInteractionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if (GVAR_RESTRAINED(player)) exitWith {}; //Bad target
if (!isPlayer _curTarget) exitWith {}; //Bad side check?
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
INIT_BUTTON(1,37402,localize "STR_pInAct_Unrestrain","[life_pInact_curTarget] call SunriseClient_system_unrestrain; closeDialog 0;");

//Set Escort Button
if (NOTATTACHED(_curTarget)) then {
	INIT_BUTTON(2,37403,localize "STR_pInAct_Escort","[life_pInact_curTarget] call SunriseClient_system_escortAction; closeDialog 0;");	
} else {
	INIT_BUTTON(2,37403,localize "STR_pInAct_StopEscort","[life_pInact_curTarget] call SunriseClient_system_stopEscorting; closeDialog 0;");
};
private _passportAction = "[player] remoteExecCall [""SunriseClient_system_showPassportTo"",life_pInact_curTarget]; closeDialog 0";
INIT_BUTTON(3,37404,"Паспорт",_passportAction);