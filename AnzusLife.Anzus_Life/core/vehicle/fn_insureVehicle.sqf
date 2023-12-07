#include "..\..\script_macros.hpp"

params ["_control"];



closeDialog 0;
private _display = ctrlParent _control;
private _ctrlList = _display displayCtrl 26;
private _selRow = lnbCurSelRow _ctrlList;
private _data = _ctrlList lnbData [_selRow, 0];
private _vid = _ctrlList lnbValue [_selRow, 0];

_data params [["_className", "", [""]], ["_color", "", [""]]];
if (_selRow isEqualTo -1) exitWith {[localize "STR_Global_NoSelection","true","slow"] call ANZUS_fnc_notificationSystem;};

if (isNil "_className") exitWith {[localize "STR_Garage_Selection_Error","true","slow"] call ANZUS_fnc_notificationSystem;};

private "_buyMultiplier";
private "_rentMultiplier";
private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");
private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
switch (playerSide) do {
    case civilian: {
        _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_CIVILIAN");
    };
    case west: {
        _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_COP");
    };
    case independent: {
        _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_MEDIC");
    };
};

_insureMultiplier = getNumber(missionConfigFile >> "CfgMaster" >> "Shops" >> "Vehicle" >> "vehicle_insurnace_price_l1"); // This does not need to be +1 


_hasCheated = call AnzusLife_AC_CheckMoney;
if (_hasCheated) exitWith {};
_purchasePrice = round(_initalPrice * _buyMultiplier);
_purchasePrice = round (_purchasePrice * (_insureMultiplier ));

private _conditions = M_CONFIG(getText,"LifeCfgVehicles",_className,"conditions");
if !([_conditions] call ANZUS_fnc_levelCheck) exitWith {[localize "STR_Shop_Veh_NoLicense","true","slow"] call ANZUS_fnc_notificationSystem;};

if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if (BANK < _purchasePrice) exitWith {[format[localize "STR_Shop_Veh_NotEnough",[_purchasePrice - BANK] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};

private _action = ["Insure Vehicle", format ["要给这辆车投保，要花 $%1! 如果你的车爆炸了，它会把你的车放回车库。",[_purchasePrice] call ANZUS_fnc_numberText], "YES", "NO", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
if (!_action) exitWith {};

[_purchasePrice,true] call xiyECYLNxrKhXypAac;
[1] call ANZUS_fnc_updatePartial;


[_vid] remoteExecCall ['TON_fnc_insureVehicle',2];