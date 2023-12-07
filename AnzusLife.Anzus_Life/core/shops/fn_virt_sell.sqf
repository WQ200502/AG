#include "..\..\script_macros.hpp"
/*
    File: fn_virt_sell.sqf
    Author: Arma-Life

    Description:
    Sell a virtual item to the store / shop
*/
params [["_all",false,[false]]];

private _display = findDisplay 889922;
private _ctrlListItems = _display displayCtrl 83;
private _itemData = _ctrlListItems lnbData [lnbCurSelRow _ctrlListItems, 0];
private _group = ["Cartel"] call AnzusLife_Lib_GetGroup;
private _sellPrice = M_CONFIG(getNumber,"VirtualItems",_itemData,"sellPrice");

if (_itemData isEqualTo "") exitWith {["项目没有数据，请将此发送给开发人员。","false","slow"] call ANZUS_fnc_notificationSystem};

if (!([] call anzus_fnc_antispam)) exitWith {};

// Make sure they cannot buy if the price is nothing
if (_sellPrice isEqualTo -1) exitWith {["你不能卖这个东西","false","slow"] call ANZUS_fnc_notificationSystem;};

private _amount = ctrlText 84;
_amount = parseNumber(_amount);
if (_amount > (ITEM_VALUE(_itemData))) exitWith {[localize "STR_Shop_Virt_NotEnough","false","slow"] call ANZUS_fnc_notificationSystem;};

if (_all) then {_amount = (ITEM_VALUE(_itemData))};

private _successes = 0;
for "_i" from 1 to _amount do
{
    _successes = _successes + 1;
};

if (_successes >= 1) then
{
    private _displayName = localize (ITEM_NAME(_itemData));
    private _totalSellPrice = _sellPrice * _successes;
    private _illegal = ITEM_ILLEGAL(_itemData);

    if ((vehicleVarName life_shop_npc) find 'CartelDealer' > -1) then {
        if (!((missionNamespace getVariable ["AnzusLife_Cartel",0]) > 0) || isNull _group) then {
            ["没有卡特尔这意味着这个供应商不工作，回来时，有一个活跃的卡特尔。","false","slow"] call ANZUS_fnc_notificationSystem;
            closeDialog 0;
        } else {
            private _newamm = ceil(_totalSellPrice / 5);
            private _playerreceived = (_totalSellPrice - _newamm);

            if (_group isEqualTo group player) then {
                [format["您以 %1x %2 美元的价格出售了 $%3 但由于您是卡特尔，因此没有纳税。",_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
                [_totalSellPrice] call cKGySJkJHNXbPgorKa;
                [[format["%1/%2 以 $%5 美元的价格出售了%3x %4",profileName,(getPlayerUID player),_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText]],"sell"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
                [format["%1/%2 以 $%5 美元的价格出售了%3x %4",profileName,(getPlayerUID player),_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText], "sell.log"] remoteExec ["AH_LogInterface",2];
            } else {
                [format["您以 $%3 的价格出售了 %1x %2 ，因为卡特尔因为使用该经销商而削减了 $%4。",_successes,_displayName,[_playerreceived] call ANZUS_fnc_numberText,[_newamm] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
                [_playerreceived] call cKGySJkJHNXbPgorKa;
                AnzusLife_CartelDrugSell = AnzusLife_CartelDrugSell + _newamm;
                [[format["%1/%2 以 $%5美元的价格出售了%3x %4",profileName,(getPlayerUID player),_successes,_displayName,[_playerreceived] call ANZUS_fnc_numberText]],"sell"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
                [format["%1/%2 以 $%5美元的价格出售了 %3x %4 ",profileName,(getPlayerUID player),_successes,_displayName,[_playerreceived] call ANZUS_fnc_numberText], "sell.log"] remoteExec ["AH_LogInterface",2];
            };
        };
    } else {
        [_totalSellPrice] call cKGySJkJHNXbPgorKa;
        [format["你以 $%2 美元卖出了 %1x %3 ",_successes,[_totalSellPrice] call ANZUS_fnc_numberText,_displayName],false,"slow"] call ANZUS_fnc_notificationSystem;
        [[format["%1/%2 以 $%5美元的价格出售了 %3x %4 ",profileName,(getPlayerUID player),_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText]],"sell"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
        [format["%1/%2 以 $%5美元的价格出售了 %3x %4 ",profileName,(getPlayerUID player),_successes,_displayName,[_totalSellPrice] call ANZUS_fnc_numberText], "sell.log"] remoteExec ["AH_LogInterface",2];
    };

    [false,_itemData,_successes] call ANZUS_fnc_handleInv;
    [0] call ANZUS_fnc_updatePartial;
} else {
    ["You failed to sell the item(s)","false","slow"] call ANZUS_fnc_notificationSystem;
};


[] call ANZUS_fnc_virt_update;
[0] call ANZUS_fnc_updatePartial;
[3] call ANZUS_fnc_updatePartial;
