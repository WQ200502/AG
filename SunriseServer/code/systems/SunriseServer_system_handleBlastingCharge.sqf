/*

	Filename: 	SunriseServer_system_handleBlastingCharge.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private ["_bomb","_time"];
_time = time + (5 * 60);
waitUntil{(round(_time - time) < 1)};
sleep 0.9;
if (!(fed_bank getVariable ["chargeplaced",false])) exitWith {};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable ["chargeplaced",false,true];
fed_bank setVariable ["safe_open",true,true];
