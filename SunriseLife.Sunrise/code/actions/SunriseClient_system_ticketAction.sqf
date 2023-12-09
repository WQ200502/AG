/*

	Filename: 	SunriseClient_system_ticketAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
disableSerialization;
if !(createDialog "SunriseDialogTicketGive") exitWith {hint localize "STR_Cop_TicketFail"};
if (isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format[localize "STR_Cop_Ticket",GVAR_RNAME(_unit)]];
life_ticket_unit = _unit;