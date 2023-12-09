/*
	
	Filename: 	SunriseClient_system_ResCaptureInfo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _data = CONTROL_DATA(4501);
_data = call compile format["%1", _data];

if (isNil "_data") exitWith {};
if (typeName _data != "ARRAY") exitWith {};
if (EQUAL(_data,[])) exitWith {};
if (grpPlayer GVAR["gang_id", -1] in (_data select 8)) then {
    ctrlSetText[4505, "Отказаться от участия в битве"];
} else {
    ctrlSetText[4505, "Принять участие в битве за этот ресурс"];
};
_display = findDisplay 4500;
(_display displayCtrl 4502) ctrlSetStructuredText parseText format["<t size='1'>
			<t underline='true'>Переработка:</t> %1	<br/>		
			<t underline='true'>Владелец:</t> %2<br/>
			<t underline='true'>Заработано:</t> %3<br/>
			<t underline='true'>Претенденты:</t> %4<br/>
			<t underline='true'>Следующая битва:</t> %5<br/>
			<t underline='true'>Захвачена:</t> %6<br/>",
			_data select 1,_data select 2,_data select 3,_data select 7,_data select 5,_data select 6];