#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a ticket to the targeted player.
*/
params [["_ctrl", controlNull, [controlNull]]];

if (isNil "life_ticket_unit") exitWith {[localize "STR_Cop_TicketNil","true","slow"] call ANZUS_fnc_notificationSystem;};
if (isNull life_ticket_unit) exitWith {[localize "STR_Cop_TicketExist","true","slow"] call ANZUS_fnc_notificationSystem;};

private _val = ctrlText 23;
private _display = ctrlParent _ctrl;

if (!([_val] call ANZUS_fnc_isNumber)) exitWith {[localize "STR_Cop_TicketNum","true","slow"] call ANZUS_fnc_notificationSystem;};
if ((parseNumber _val) > 100000 || (parseNumber _val) < 200) exitWith {["您输入的数字必须大于$ 200，小于$ 100,000","true","slow"] call ANZUS_fnc_notificationSystem;};

["您的罚单已签发并发送给此人.","false","slow"] call ANZUS_fnc_notificationSystem;
[player,(parseNumber _val)] remoteExec ["ANZUS_fnc_ticketPrompt",life_ticket_unit];
[[player,"CL3_anim_Ticket"],"ANZUS_fnc_animSync",true,false] spawn bis_fnc_mp;

closeDialog 0;