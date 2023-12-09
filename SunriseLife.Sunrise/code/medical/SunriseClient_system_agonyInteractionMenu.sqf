/*

	Filename: 	SunriseClient_system_agonyInteractionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if !(LSINCAP(_curTarget)) exitWith {};
if (GVAR_RESTRAINED(player)) exitWith {}; //Bad target
if (!isPlayer _curTarget) exitWith {}; //Bad side check?
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_pInact_curTarget = _curTarget;

private _passportAction = "[player] remoteExecCall [""SunriseClient_system_showPassportTo"",life_pInact_curTarget]; closeDialog 0";
INIT_BUTTON(1,37402,"Паспорт",_passportAction);
INIT_BUTTON(2,37403,"Тащить","[life_pInact_curTarget] call SunriseClient_system_dragDeadBody; closeDialog 0;");
if (!(NOTATTACHED(life_pInact_curTarget)) OR count attachedObjects player > 0 OR !isNull life_DraggedBody OR !isNil {life_pInact_curTarget GVAR "draggedBy"}) then {_b2 ctrlEnable false};
INIT_BUTTON(3,37404,localize "STR_pInAct_PutInCar","[life_pInact_curTarget] call SunriseClient_system_putInCar; closeDialog 0;");
INIT_BUTTON(4,37405,"Реанимировать","[life_pInact_curTarget] spawn SunriseClient_system_revivePlayer; closeDialog 0;");

if !(life_copDuty OR life_medDuty) then {INIT_BUTTON(6,37409,"Ограбить","[life_pInact_curTarget] call SunriseClient_system_robAction; closeDialog 0;")};
INIT_BUTTON(7,37410,"Забрать телефон","[life_pInact_curTarget] call SunriseClient_system_dropRadio; closeDialog 0;");
INIT_BUTTON(8,37411,"Забрать снаряжение","[life_pInact_curTarget] spawn SunriseClient_system_dropAllAnimat; closeDialog 0;");
INIT_BUTTON(9,37412,"Первая помощь","[life_pInact_curTarget] spawn SunriseClient_system_firstAid; closeDialog 0;");

if (player getVariable ["firstAid","NOTHEALED"] isEqualTo "HEALED") then {_b9 ctrlEnable false};
if (life_medDuty) then {_b7 ctrlEnable false;_b8 ctrlEnable false};
if !(life_copDuty OR life_medDuty) then {_b4 ctrlEnable false};