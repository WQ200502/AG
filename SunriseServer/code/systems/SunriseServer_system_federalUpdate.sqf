/*

	Filename: 	SunriseServer_system_federalUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
[{_funds = fed_bank getVariable ["safe",0]; fed_bank setVariable ["safe",round(_funds+((count playableUnits)/2)),true]},300] call CBA_fnc_addPerFrameHandler;