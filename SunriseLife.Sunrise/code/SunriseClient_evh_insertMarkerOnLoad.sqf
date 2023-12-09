/*

	Filename: 	SunriseClient_evh_insertMarkerOnLoad.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;

private _ctrlMarkerChannel = (_this select 0) displayCtrl 103;
waitUntil {lbSize _ctrlMarkerChannel > 4 OR isNull _ctrlMarkerChannel};
if (isNull _ctrlMarkerChannel) exitWith {};
_ctrlMarkerChannel lbDelete 4;
_ctrlMarkerChannel lbDelete 2;
_ctrlMarkerChannel lbDelete 1;
_ctrlMarkerChannel lbDelete 0;
_ctrlMarkerChannel lbSetCurSel 0;