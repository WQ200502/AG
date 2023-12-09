/*
	
	Filename: 	SunriseClient_system_ticketPrompt.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_cop",objNull,[objNull]],
	["_val",-1,[-1]]
];
if (isNull _cop) exitWith {};
if (!isNull (findDisplay 2600)) exitwith {};

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;

disableSerialization;
createDialog "SunriseDialogTicketPay";

(CONTROL(2600,2601)) ctrlSetStructuredText parseText format["<t align='center' color='%3'><t size='.8px'>" +(localize "STR_Cop_Ticket_GUI_Given"),GVAR_RNAME(_cop),_val,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

[{life_ticket_paid OR isNull (findDisplay 2600)}, {
	if (isNull (findDisplay 2600) && !life_ticket_paid) then {
		[0,"STR_Cop_Ticket_Refuse",true,[GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
		//[format[localize "STR_Cop_Ticket_Refuse",GVAR_RNAME(player)],"error"] remoteExecCall ["SunriseClient_gui_bottomNotification",life_ticket_cop];
		["error","",format[localize "STR_Cop_Ticket_Refuse",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_message",life_ticket_cop];
	};
}] call CBA_fnc_waitUntilAndExecute;