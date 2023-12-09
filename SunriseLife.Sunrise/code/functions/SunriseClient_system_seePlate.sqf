/*

	Filename: 	SunriseClient_system_seePlate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _target = cursorTarget;
private _dbInfo = _target getVariable ["dbInfo",[]];
if (isNull _target) exitwith {};
if (!alive _target) exitwith {};

if (EQUAL(_dbInfo,[])) exitWith {hint "Техника в аренде"};
_ret = format ["<t align='center' size='1.5'>Номер транспортного средства: <br/></t><t align='center' color='#FFD700' size='1.25'> %1</t>",_dbInfo select 1];
hint parseText _ret;