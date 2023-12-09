/*
	
	Filename: 	SunriseClient_system_ticketGive.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (isNil {life_ticket_unit}) exitWith {["error","",format[localize "STR_Cop_TicketNil"]] call SunriseClient_message};
if (isNull life_ticket_unit) exitWith {["error","",format[localize "STR_Cop_TicketExist"]] call SunriseClient_message};
private _val = ctrlText 2652;
if (!([_val] call SunriseClient_system_isnumber)) exitWith {["error","",format[localize "STR_Cop_TicketNum"]] call SunriseClient_message};
if ((parseNumber _val) > 200000) exitWith {["error","",format[localize "STR_Cop_TicketOver100"]] call SunriseClient_message};
if (player distance life_ticket_unit > 5) exitWith {["error","","Вы стоите очень далеко"] call SunriseClient_message};

[0,"STR_Cop_TicketGive",true,[GVAR_RNAME(player),[(parseNumber _val)] call SunriseClient_system_numberText,GVAR_RNAME(life_ticket_unit)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExecCall ["SunriseClient_system_ticketPrompt",life_ticket_unit];
closeDialog 0;