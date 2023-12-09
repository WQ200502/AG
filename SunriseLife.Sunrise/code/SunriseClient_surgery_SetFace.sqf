/*
	
	Filename: 	SunriseClient_surgery_SetFace.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (EQUAL(FETCH_CONST(life_donator),0) AND !life_isGirl) exitWith {titleText[localize "STR_SURGERY_NewFaceVIP","PLAIN"]};
disableSerialization;
life_myIdentity = CONTROL_DATA(5402);
if !(EQUAL(face player,life_myIdentity)) then {
	if (CASH < 50000) exitWith {titleText[localize "STR_ATM_NotEnoughCash","PLAIN"]};
	[player,life_myIdentity] remoteExec ["setFace",RANY,netId player];
	["cash","take",50000,"setFace"] call SunriseClient_system_myCash;
	titleText[localize "STR_SURGERY_NewFaceDone","PLAIN"];
	closeDialog 0;
};