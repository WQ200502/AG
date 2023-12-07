#include "..\..\script_macros.hpp"
/*
    File: fn_buyClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Buys the current set of clothes and closes out of the shop interface.
*/
private ["_price"];
if ((tvCurSel 4) isEqualTo []) exitWith {[localize "STR_Shop_NoClothes","true","slow"] call ANZUS_fnc_notificationSystem;};

_price = 0;
{
    if (!(_x isEqualTo -1)) then {
        _price = _price + _x;
    };
} forEach life_clothing_purchase;

_hasCheated = call AnzusLife_AC_CheckMoney;
if (_hasCheated) exitWith {};

[_price] spawn {
	params [["_price",0,[0]]];

    _payFromCash = false;
    private _requiredBuyRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_UseBank");
    private _playerRank = [player] call ANZUS_fnc_gangGetRank;
    private _isAllowedToBuy = _playerRank >= _requiredBuyRank;

   
        if (!([_price] call ANZUS_fnc_debitCard)) exitWith {["你没有足够的钱.","false","slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};
        [0] call ANZUS_fnc_updatePartial;

        [format["您成功地以%1的价格购买了您的衣服!", [_price] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
        life_clothesPurchased = true;
        closeDialog 0;
};
