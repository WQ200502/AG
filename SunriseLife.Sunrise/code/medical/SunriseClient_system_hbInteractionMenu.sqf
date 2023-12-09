/*

	Filename: 	SunriseClient_system_hbInteractionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {};
if !(EQUAL((typeOf _curTarget),"ExtremoHospitalBed")) exitWith {};
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_vInact_curTarget = _curTarget;

INIT_BUTTON(1,37402,localize "STR_vInAct_HosBedIn","[life_vInact_curTarget] spawn SunriseClient_system_loadInHB; closeDialog 0;");
private _bedoutAction = "[player] remoteExecCall [""SunriseClient_system_unloadFromHB"",(crew life_vInact_curTarget) select 0]; closeDialog 0;";
INIT_BUTTON(2,37403,localize "STR_vInAct_HosBedOut",_bedoutAction);
INIT_BUTTON(3,37404,localize "STR_vInAct_HosBedRes","[life_vInact_curTarget] spawn SunriseClient_system_resHB; closeDialog 0;");
INIT_BUTTON(4,37405,"Вылечить гастрит","[life_vInact_curTarget] spawn SunriseClient_system_healSickness; closeDialog 0;");

if (EQUAL(crew life_vInact_curTarget,[])) then {
	_b2 ctrlEnable false;
	_b3 ctrlEnable false;
	_b4 ctrlEnable false;
} else {
	private _unit = (crew life_vInact_curTarget) select 0;
	if (isNull _unit OR (LSINCAP(_unit))) then {
		_b2 ctrlEnable false;
	};
};