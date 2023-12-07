#include "..\..\script_macros.hpp"
/*
    File: fn_virt_buy.sqf
    Author: Arma-Life

    Description:
    Buy a virtual item from the store.
*/
private _display = findDisplay 889922;
private _ctrlListItems = _display displayCtrl 83;
private _itemData = _ctrlListItems lnbData [lnbCurSelRow _ctrlListItems, 0];
_buyPrice = M_CONFIG(getNumber,"VirtualItems",_itemData,"buyPrice");

if (_itemData isEqualTo "") exitWith {["项目没有数据，请将此发送给开发人员。","false","slow"] call ANZUS_fnc_notificationSystem};

// Make sure they cannot buy if the price is nothing
if (_buyPrice isEqualTo -1) exitWith {["您不能购买此商品","false","slow"] call ANZUS_fnc_notificationSystem;};

private _amount = ctrlText 84;
_amount = parseNumber(_amount);
if (_amount >= 15) exitWith {["一次只能购买15件物品。","false","slow"] call ANZUS_fnc_notificationSystem;};
if (!([] call anzus_fnc_antispam)) exitWith {};

private _successes = 0;
for "_i" from 1 to _amount do
{
    if ([_itemData,_amount,life_carryWeight,life_maxWeight] call ANZUS_fnc_calWeightDiff > 0) then
    {
        _successes = _successes + 1;
    };
};

if (_successes >= 1) then
{
    private _displayName = localize (ITEM_NAME(_itemData));
    private _illegal = ITEM_ILLEGAL(_itemData);
    private _totalPurchasePrice = _buyPrice * _successes;
    if (!([_totalPurchasePrice] call ANZUS_fnc_debitCard)) exitWith {["你没有足够的钱买这件物品.","false","slow"] call ANZUS_fnc_notificationSystem;};

    [true,_itemData,_successes] call ANZUS_fnc_handleInv;
    [format["You bought %1x %3 for $%2",_successes,[_totalPurchasePrice] call ANZUS_fnc_numberText,_displayName],"true","slow"] call ANZUS_fnc_notificationSystem;
}
else
{
    ["Purchase was not successful.","true","slow"] call ANZUS_fnc_notificationSystem;
};

[] call ANZUS_fnc_virt_update;
[0] call ANZUS_fnc_updatePartial;
