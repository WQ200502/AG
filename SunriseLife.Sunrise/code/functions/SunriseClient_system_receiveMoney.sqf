/*
	
	Filename: 	SunriseClient_system_receiveMoney.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_val","",[""]],
	["_from",Objnull,[Objnull]]
];

if (isNull _unit OR isNull _from OR _val isEqualTo "") exitWith {};
if (player != _unit) exitWith {};
if !([_val] call SunriseClient_system_isnumber) exitWith {};
if (_unit isEqualTo _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format[localize "STR_NOTF_GivenMoney",GVAR_RNAME(_from),[(parseNumber _val)] call SunriseClient_system_numberText];
["cash","add",(parseNumber _val),"MS",format["Cash Transfer from %1 (%2)",GVAR_RNAME(_from),getPlayerUID _from]] call SunriseClient_system_myCash;