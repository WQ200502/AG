/*

	Filename: 	SunriseClient_gangs_disbanded.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {};
if (!isNull (findDisplay 2620)) then {closedialog 2620};

[localize "STR_GNOTF_DisbandWarn_2","info"] call SunriseClient_gui_bottomNotification;
[player] joinSilent (createGroup civilian);
[] call SunriseClient_gangs_ClearLicense;