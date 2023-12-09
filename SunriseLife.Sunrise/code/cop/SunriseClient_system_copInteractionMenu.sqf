/*

	Filename: 	SunriseClient_system_copInteractionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if (!isPlayer _curTarget) exitWith {}; //Bad side check?

if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
INIT_BUTTON(1,37402,localize "STR_pInAct_Unrestrain","[life_pInact_curTarget] call SunriseClient_system_unrestrain; closeDialog 0;");

//Set Check Licenses Button
private _checkLicensesAction = "[player] remoteExecCall [""SunriseClient_system_licenseCheck"",life_pInact_curTarget]";
INIT_BUTTON(2,37403,localize "STR_pInAct_checkLicenses",_checkLicensesAction);

//Set Search Button
INIT_BUTTON(3,37404,localize "STR_pInAct_SearchPlayer","[life_pInact_curTarget] call SunriseClient_system_searchAction; closeDialog 0;");
if (life_coplevel < 4) then {_b3 ctrlEnable false};

//Set Escort Button
if (NOTATTACHED(_curTarget)) then {
	INIT_BUTTON(4,37405,localize "STR_pInAct_Escort","[life_pInact_curTarget] call SunriseClient_system_escortAction; closeDialog 0;");
} else {
	INIT_BUTTON(4,37405,localize "STR_pInAct_StopEscort","[life_pInact_curTarget] call SunriseClient_system_stopEscorting; closeDialog 0;");
};

//Set Ticket Button
INIT_BUTTON(5,37406,localize "STR_pInAct_TicketBtn","[life_pInact_curTarget] call SunriseClient_system_ticketAction;");

//ДОСВИДАНИЯ
INIT_BUTTON(6,37407,localize "STR_pInAct_Arrest","[life_pInact_curTarget] call SunriseClient_system_arrestAction;closeDialog 0;");
(_display displayCtrl 37408) ctrlShow true;

//Check that you are near a place to jail them.
if !([player] call SunriseClient_system_checkForSearch) then {
	(_display displayCtrl 37407) ctrlEnable false;
	(_display displayCtrl 37408) ctrlEnable false;
};

INIT_BUTTON(7,37410,localize "STR_pInAct_PutInCar","[life_pInact_curTarget] call SunriseClient_system_putInCar;");
INIT_BUTTON(8,37411,"Забрать телефон","[life_pInact_curTarget] call SunriseClient_system_dropRadio; closeDialog 0;");

if (_curTarget GVAR["isBlind",false]) then {
    INIT_BUTTON(9,37412,"Снять мешок","[life_pInact_curTarget] call SunriseClient_system_makeHimUnBlind; closeDialog 0;");
} else {
    INIT_BUTTON(9,37412,"Надеть мешок","[life_pInact_curTarget] call SunriseClient_system_makeHimBlind; closeDialog 0;");
};

private _pasportAction = "[player] remoteExecCall [""SunriseClient_system_showPassportTo"",life_pInact_curTarget]; closeDialog 0";
INIT_BUTTON(10,37413,"Посмотреть паспорт",_pasportAction);
INIT_BUTTON(11,37414,"Показать паспорт","[life_pInact_curTarget] call SunriseClient_system_showPassport");