/*
	
	Filename: 	SunriseClient_tickets_Prompt.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_owner",objNull,[objNull]],
	["_val",-1,[-1]]
];
if (isNull _owner) exitWith {};
if (!isNull (findDisplay 5300)) exitwith {};

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_owner = _owner;

disableSerialization;
createDialog "SunriseDialogFreeTicketPay";

(CONTROL(5300,5301)) ctrlSetStructuredText parseText format[localize "STR_Ticket_FormText",GVAR_RNAME(_owner),_val,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

[{life_ticket_paid OR isNull (findDisplay 5300)}, {
	if (isNull (findDisplay 5300) && !life_ticket_paid) then {
		[format[localize "STR_Ticket_Refuse",GVAR_RNAME(player)],"error"] remoteExecCall ["SunriseClient_gui_bottomNotification",life_ticket_owner];
	};
}] call CBA_fnc_waitUntilAndExecute;