#include "..\..\script_macros.hpp"
/*
    File: fn_ticketPrompt
    Author: Bryan "Tonic" Boardwine

    Description:
    Prompts the player that he is being ticketed.
*/
private ["_cop","_val"];
if (!isNull (findDisplay 2600)) exitWith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if (isNull _cop) exitWith {};
_amount = _this select 1;

private _ticketAccepted = ["Ticket Received", format ["您已收到一张 $%1. 您接受支付这张票吗?", [_amount] call ANZUS_fnc_numberText], "支付", "拒绝", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

if (_ticketAccepted) then
{
    private _payFromBank = ["Payment Alternatives", format ["选择付款选项。按下退出将自动选择现金.",_amount], "银行", "现金", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

    if (_payFromBank) then
    {
        if (BANK < _amount) exitWith {["您的银行帐户资金不足.","false","slow"] call ANZUS_fnc_notificationSystem; ["人的银行里没有足够的钱.","true","slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];};
        [_amount,true] call xiyECYLNxrKhXypAac;
        [1] call ANZUS_fnc_updatePartial;

        ["您的罰單已签发并发送给此人.","false","slow"] call ANZUS_fnc_notificationSystem;
        ["人已经支付了罚单,已存入您的银行.","false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];
    }
    else
    {
        if (CASH < _amount) exitWith {["你没有这么多现金支付.","false","slow"] call ANZUS_fnc_notificationSystem; ["Person does not have enough cash.","true","slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];};
        [_amount,true] call cKGySJkJHNXbPgorKa;
        [0] call ANZUS_fnc_updatePartial;

        ["你用现金把罚单支付了.","false","slow"] call ANZUS_fnc_notificationSystem;
        ["这名玩家已经支付了罚单 又一半罚单钱已经转入你银行里.","false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];
    };

    _newamount = round (_amount / 2);
    [_newamount] remoteExec ["xiyECYLNxrKhXypAac",remoteExecutedOwner];
}
else
{
    ["你拒绝支付罚单.","false","slow"] call ANZUS_fnc_notificationSystem;
    ["该名玩家选择拒绝支付罚单.","false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",remoteExecutedOwner];
};

closeDialog 0;
