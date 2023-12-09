/*

	Filename:	SunriseClient_system_createTimer.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _name = param [0,"",[""]];
if (_name isEqualTo "") exitWith {};

disableSerialization;
(_name call BIS_fnc_rscLayer) cutRsc ["life_timer", "PLAIN"];
private _display = uiNamespace getVariable "life_timer";
private _factor = {if (_x isEqualTo displayNull) exitWith {life_timerArray set [_forEachIndex,_display];0.03 * _forEachIndex}} forEach life_timerArray;

private _ctrlPic = _display displayCtrl 38300;
_ctrlPic ctrlSetPosition [0.005 * safezoneW + safezoneX,(0.25 + _factor) * safezoneH + safezoneY,0.0140625 * safezoneW,0.025 * safezoneH];
_ctrlPic ctrlCommit 0;

private _ctrlText = _display displayCtrl 38301;
_ctrlText ctrlSetPosition [0.025625 * safezoneW + safezoneX,(0.25 + _factor) * safezoneH + safezoneY,0.12 * safezoneW,0.025 * safezoneH];
_ctrlText ctrlCommit 0;

_ctrlText