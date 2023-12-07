/*
    File: fn_ticketAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the ticketing process.
*/
params [
    ["_unit",objNull,[objNull]]
];

if (!alive _unit) exitWith {["这个玩家不存在","true","slow"] call ANZUS_fnc_notificationSystem;};
if (_unit isEqualTo player) exitWith {["你不能给自己罚单","true","slow"] call ANZUS_fnc_notificationSystem;};
if (side _unit isEqualTo west) exitWith {};

disableSerialization;
createDialog "AnzusLife_TicketGive";

private _display = findDisplay 99921;
private _ctrlInput = _display displayCtrl 23;
private _ctrlControlsGroupFooter = _display displayCtrl 24;
private _ctrlButtonIssue = _ctrlControlsGroupFooter controlsGroupCtrl 25;

_ctrlButtonIssue ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlButtonIssue ctrlAddEventHandler ["ButtonClick", {[_this select 0] call ANZUS_fnc_ticketGive;}];

life_ticket_unit = _unit;