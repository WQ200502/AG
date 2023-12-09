/*

	Filename: 	SunriseClient_system_freeInteractionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {};
if (!isPlayer _curTarget) exitWith {};
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_pInact_curTarget = _curTarget;

INIT_BUTTON(1,37402,"Показать паспорт","[life_pInact_curTarget] call SunriseClient_system_showPassport");
if (life_copDuty OR life_medDuty) then {
	INIT_BUTTON(2,37403,"Выставить счет","[life_pInact_curTarget] call SunriseClient_tickets_Action");
	private _alcoAction = "[player] remoteExecCall ['SunriseClient_system_breathalyzer',life_pInact_curTarget]";
	INIT_BUTTON(3,37404,"Алкотестер",_alcoAction);

	if (life_medDuty) then {
		private _healAction = "closeDialog 0;0 spawn {['Лечим пациента',15,'','',true] call SunriseClient_system_progressBar;[] remoteExecCall ['SunriseClient_system_healDoctor',life_pInact_curTarget]};";
		INIT_BUTTON(4,37405,"Вылечить человека",_healAction);
	};
};