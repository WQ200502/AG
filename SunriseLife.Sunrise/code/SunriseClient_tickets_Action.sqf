/*

	Filename: 	SunriseClient_tickets_Action.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitwith {};
if (!isPlayer _unit) exitwith {};
disableSerialization;
if !(createDialog "SunriseDialogFreeTicketGive") exitWith {hint "Ошибка"};
ctrlSetText [5201,format[localize "STR_Ticket_For",GVAR_RNAME(_unit)]];
life_ticket_unit = _unit;