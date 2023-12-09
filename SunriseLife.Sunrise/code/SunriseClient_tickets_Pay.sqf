/*
	
	Filename: 	SunriseClient_tickets_Pay.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isnil "life_ticket_val" OR isNil "life_ticket_owner") exitWith {};
if (CASH < life_ticket_val) exitWith {
	if (BANK < life_ticket_val) exitWith {
		[localize "STR_Ticket_DontHaveMoney", "error"] call SunriseClient_gui_BottomNotification;		
		[1,format[localize "STR_Ticket_DontHaveMoneySend",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_ticket_owner];
		closeDialog 0;
	};
	["done","",format[localize "STR_Ticket_Done",[life_ticket_val] call SunriseClient_system_numberText]] call SunriseClient_message;
	["atm","take",life_ticket_val] call SunriseClient_system_myCash;
	life_ticket_paid = true;	
	[1,format[localize "STR_Ticket_DoneSend",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_ticket_owner];
	["atm","add",life_ticket_val,"freeTicketPaid"] remoteExecCall ["SunriseClient_system_myCash",life_ticket_owner];
	closeDialog 0;
};

[format[localize "STR_Ticket_Done",[life_ticket_val] call SunriseClient_system_numberText], "done"] call SunriseClient_gui_BottomNotification;

["cash","take",life_ticket_val] call SunriseClient_system_myCash;
life_ticket_paid = true;

[1,format[localize "STR_Ticket_DoneSend",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_ticket_owner];
["atm","add",life_ticket_val,"freeTicketPaid"] remoteExecCall ["SunriseClient_system_myCash",life_ticket_owner];

closeDialog 0;