/*
	
	Filename: 	SunriseClient_surgery_Init.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (EQUAL(life_myIdentity,"")) exitWith {};

if !(EQUAL(face player,life_myIdentity)) then {
	[player,life_myIdentity] remoteExec ["setFace",RANY,netId player];
};