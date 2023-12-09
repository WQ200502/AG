/*

    Filename:   SunriseClient_system_civInteractionMenu.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if (GVAR_RESTRAINED(player)) exitWith {}; //Bad target
if !(isPlayer _curTarget) exitWith {}; //Bad side check?
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
//set put in vehicle
INIT_BUTTON(3,37404,localize "STR_pInAct_PutInCar","[life_pInact_curTarget] call SunriseClient_system_putInCar; closeDialog 0;");

private _pasportAction = "[player] remoteExecCall [""SunriseClient_system_showPassportTo"",life_pInact_curTarget]; closeDialog 0";
INIT_BUTTON(4,37405,"Паспорт",_pasportAction);

if (_curTarget GVAR["isBlind",false]) then {
	INIT_BUTTON(5,37406,"Снять мешок","[life_pInact_curTarget] call SunriseClient_system_makeHimUnBlind; closeDialog 0;");
} else {
	INIT_BUTTON(5,37406,"Надеть мешок","[life_pInact_curTarget] call SunriseClient_system_makeHimBlind; closeDialog 0;");
};

INIT_BUTTON(6,37409,"Ограбить","[life_pInact_curTarget] call SunriseClient_system_robAction; closeDialog 0;");
INIT_BUTTON(7,37410,"Забрать телефон","[life_pInact_curTarget] call SunriseClient_system_dropRadio; closeDialog 0;");
INIT_BUTTON(8,37411,"Забрать снаряжение","[life_pInact_curTarget] spawn SunriseClient_system_dropAllAnimat; closeDialog 0;");