/*
	
	Filename: 	SunriseClient_parking_MenuRet.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _vehicles = param [0,[],[[]]];
waitUntil {!isNull (findDisplay 5700)};

if (EQUAL(_vehicles,[])) exitWith {
	ctrlSetText[5702,localize "STR_Garage_NoVehicles"];
};

private _control = CONTROL(5700,5702); 
lbClear _control;

{
	_vehicleInfo = [_x select 1] call SunriseClient_system_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);

	_tmp = [_x select 2,_x select 3];
	_control lbSetData [(lbSize _control)-1,str(_tmp)];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;

ctrlShow[5703,false];
ctrlShow[5704,false];

