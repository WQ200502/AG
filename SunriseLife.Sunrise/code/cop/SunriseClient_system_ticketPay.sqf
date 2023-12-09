/*
	
	Filename: 	SunriseClient_system_ticketPay.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (isnil "life_ticket_val" OR isNil "life_ticket_cop") exitWith {};
if (CASH < life_ticket_val) exitWith {
	if (BANK < life_ticket_val) exitWith {
		["error","",format[localize "STR_Cop_Ticket_NotEnough"]] call SunriseClient_message;
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	["done","",format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call SunriseClient_system_numberText]] call SunriseClient_message;
	["atm","take",life_ticket_val] call SunriseClient_system_myCash;
	life_ticket_paid = true;	
	[1,"STR_Cop_Ticket_PaidNOTF",true,[GVAR_RNAME(player),[life_ticket_val] call SunriseClient_system_numberText]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];	
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_ticket_cop];	
	
	[[steamid],"wantedRemove"] call SunriseClient_system_hcExec;

	["atm","add",life_ticket_val,"ticketPaid"] remoteExecCall ["SunriseClient_system_myCash",life_ticket_cop];
	closeDialog 0;
};

["cash","take",life_ticket_val] call SunriseClient_system_myCash;
life_ticket_paid = true;

[0,"STR_Cop_Ticket_PaidNOTF",true,[GVAR_RNAME(player),[life_ticket_val] call SunriseClient_system_numberText]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_ticket_cop];

[[steamid],"wantedRemove"] call SunriseClient_system_hcExec;

["atm","add",life_ticket_val,"ticketPaid"] remoteExecCall ["SunriseClient_system_myCash",life_ticket_cop];

closeDialog 0;