/*

	Filename: 	SunriseClient_ltd_shopmenuownerlbchange.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
disableSerialization;
params ["_control","_index"];
private _dataArr = call compile format["%1",CONTROL_DATAI(_control,_index)];

if !(_dataArr isEqualType []) exitWith {};

(CONTROL(7800,7807)) ctrlSetText format["%1",_dataArr select 2];