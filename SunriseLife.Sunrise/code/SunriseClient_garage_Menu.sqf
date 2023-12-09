/*

	Filename: 	SunriseClient_garage_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _vehicles = param [0,[],[[]]];

waitUntil {!isNull (findDisplay 2800)};

if (_vehicles isEqualTo []) exitWith {
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

private _control = ((findDisplay 2800) displayCtrl 2802);
lbClear _control;

{
	_vehicleInfo = [_x select 1] call SunriseClient_system_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetData [(lbSize _control)-1,str([_x select 1,_x select 2,_x select 6,_x select 3,_x select 4,_x select 5,_x select 10,_x select 11])];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;


ctrlShow[2810,false];
ctrlShow[2811,false];