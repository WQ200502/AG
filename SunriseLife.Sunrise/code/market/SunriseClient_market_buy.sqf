/*

	Filename:	SunriseClient_market_buy.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!market_loaded) exitWith {hint "Торговая площадка в данный момент недоступна. Пожалуйста, попробуйте еще раз!"};
if (life_market_wait) exitWith {hint "Торговая площадка обрабатывает ваш запроос"};

disableSerialization;
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
if (lbCurSel _myListbox < 0) exitWith {hint "Вы не выбрали предмет";};
_selectedOffer = call compile (_myListbox lbData (lbCurSel _myListbox));
if (count _selectedOffer == 1) exitWith {};

_selectedOffer params ["_id","_seller","_item","_value","_amount","_sellerName"];

_e = missionNamespace getVariable [format["ahItem_%1",_id],false];
if (player getVariable["ahID",0] != _id && !_e) exitWith {hint "Кто-то покупает эту вещь!";};
if (_seller isEqualTo (getPlayerUID player)) exitWith {hint "Вы не можете купить свою вещь. Верните ее, если хотите получить обратно.";};
if (BANK < _value) exitWith {hint "У вас не хватает денег на банковском счете!";};
if !([_item] call SunriseClient_system_canUseItem) exitWith {["Вы не можете использовать этот предмет","error"] call SunriseClient_gui_bottomNotification};

_iCheck = true;
if (_amount > 1) then {
	_iCheck = [_item,_amount] call SunriseClient_market_checkItem;
};

if (!_iCheck) exitWith {[localize "STR_NOTF_InvFull","error"] call SunriseClient_gui_bottomNotification;};

life_market_wait = true;
[_id,_item,_value,_amount,_seller,player] remoteExec ["SunriseServer_market_buy",RSERV];