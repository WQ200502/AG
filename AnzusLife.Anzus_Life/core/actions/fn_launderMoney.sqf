#include "..\..\script_macros.hpp"
/*
    File Name: fn_launderMoney.sqf
  	Author: Ya Boi Travis Butts
*/
closeDialog 0;
_guy = param [0,objNull,[objNull]];
private _option = false;
private _sit = "";

_value = ITEM_VALUE("bank_bag");
if (life_action_inUse) exitWith {life_action_inUse = false};
if (_value isEqualTo 0) exitWith {["你没有带标记的钞票要洗.","false","slow"] call ANZUS_fnc_notificationSystem};
if (west countSide playableUnits < 3) exitWith {["我必须线上有3个警察才能洗钱.","false","slow"] call ANZUS_fnc_notificationSystem};

life_action_inUse = true;
_exit = false;

if (!((missionNamespace getVariable ["AnzusLife_Mafia",0]) > 0)) then {_exit = true;};
if (!_exit) then {
	private _action = ["Mafia Fee", "这笔洗钱归黑手党所有，这意味着他们要从您的清洁服务中收取20%的费用，您愿意支付吗？如果未支付，可能会导致不良结果，请谨慎选择!", "是", "否", findDisplay 46, true] call ANZUS_fnc_guiPrompt;
	private _group = ["Mafia"] call AnzusLife_Lib_GetGroup;
	if (_group isEqualTo group player) exitWith {_sit = "isMafia"};
	if (!(isNull _group)) then {
	    if (_action) then {
	    	_option = true;
	    } else {
			_sit = "MafiaAvoid";
	    };
	};
};

_title = "Laundering Money";
_icon = "\AnzusLifeCore\images\displays\displayInteractionMenu\purchase.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.015;

for "_i" from 0 to 1 step 0 do {
    sleep 0.3;
    _cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_processMultiplier", 1]));
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
    if (player distance _guy > 10) exitWith {};
};

life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (player getVariable ["inHostage",false]) exitWith {["您被劫为人质,行动被取消.","true","slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_action_inUse = false;};
if (player distance _guy > 10) exitWith {[localize "STR_Process_Stay","true","slow"] call ANZUS_fnc_notificationSystem; "progressBar" cutText ["","PLAIN"]; life_action_inUse = false;};

_amountofbills = ITEM_VALUE("bank_bag");
_billsellprice = ITEM_SELLPRICE("bank_bag");

_cutamm = ceil(_amountofbills / 100 * 20);
_cut = (round(_billsellprice) * _cutamm);

if (_option) then {
	_newammbills = _amountofbills - _cutamm;
	_total = _newammbills * _billsellprice;

	[false,"bank_bag",_amountofbills] call ANZUS_fnc_handleInv;
	[_total] call cKGySJkJHNXbPgorKa;
	[format["您已经洗了标明的账单，并收到了 $%1 现金. 黑手党采取了 $%2 削减，以清理你的钱, enjoy!",[_total] call ANZUS_fnc_numberText,[_cut] call ANZUS_fnc_numberText],"false","slow"] call ANZUS_fnc_notificationSystem;

    [format["有人洗了钱并收到了 $%1 在费用上，享受!",[_cut] call ANZUS_fnc_numberText],"true","slow"] remoteExec ["ANZUS_fnc_notificationSystem", _group];
		[[format["%1/%2 洗钱并收到 %3",profileName,(getPlayerUID player),[_total] call ANZUS_fnc_numberText]],"MoneyLaunder"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
    [_cut,_group,"Launder"] remoteExec ["AnzusLife_ReciveGangProfit",2];
} else {
	_total = _amountofbills * _billsellprice;
	[false,"bank_bag",_amountofbills] call ANZUS_fnc_handleInv;
	[_total] call cKGySJkJHNXbPgorKa;

	switch (_sit) do {
		case "isMafia": {
			[format["由于您是黑手党的一分子，因此您已免费洗了标记后的帐单并收到了 $%1 现金.",[_total] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
			[[format["%1/%2 洗钱并收到 %3",profileName,(getPlayerUID player),[_total] call ANZUS_fnc_numberText]],"MoneyLaunder"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
		};
		case "MafiaAvoid": {
			[format["你已经洗了你标记的钞票，并且收到了 $%1 现金. 黑手党被告知你拒绝收费，享受吧!",[_total] call ANZUS_fnc_numberText],"false","slow"] call ANZUS_fnc_notificationSystem;
			[player,_cut,"Money Launder"] remoteExec ["AnzusLife_DenyFee",_group];
			[[format["%1/%2 洗钱并收到 %3",profileName,(getPlayerUID player),[_total] call ANZUS_fnc_numberText]],"MoneyLaunder"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
		};
		default {
			[format["你已经洗了你标记的钞票，并且收到了 $%1 现金,享受!",[_total] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
			[[format["%1/%2 洗钱并收到 %3",profileName,(getPlayerUID player),[_total] call ANZUS_fnc_numberText]],"MoneyLaunder"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
		};
	};
};
_noATMTime = MAIN_SETTINGS_TYPE(getNumber,"MajorCrimes","noatm_timer");
[_noATMTime] spawn {
	params["_noATMTime"];
	life_use_atm = false;
	sleep 60 * _noATMTime;
	life_use_atm = true;
};
