/*
	
	Filename: 	SunriseClient_tickets_Give.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNil {life_ticket_unit}) exitWith {hint localize "STR_Global_Error"};
if (isNull life_ticket_unit) exitWith {hint localize "STR_Global_Error"};
private _val = ctrlText 5202;
if (!([_val] call SunriseClient_system_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if ((parseNumber _val) > 200000) exitWith {["STR_Cop_TicketOver100","error"] call SunriseClient_gui_bottomNotification};
if (player distance life_ticket_unit > 5) exitWith {["Вы стоите очень далеко","error"] call SunriseClient_gui_bottomNotification};

[0,format[localize "STR_Ticket_ForLongText",GVAR_RNAME(player),[(parseNumber _val)] call SunriseClient_system_numberText,GVAR_RNAME(life_ticket_unit)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExecCall ["SunriseClient_tickets_Prompt",life_ticket_unit];
closeDialog 0;