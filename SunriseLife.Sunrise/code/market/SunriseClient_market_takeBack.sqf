/*

	Filename:	SunriseClient_market_takeBack.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!market_loaded) exitWith {hint "Торговая площадка в данный момент недоступна. Пожалуйста, попробуйте еще раз!"};
if (life_market_wait) exitWith {hint "Торговая площадка обрабатывает ваш запроос"};

disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;

if (lbCurSel _myListbox < 0) exitWith {hint "Вы не выбрали вещь!";};
_data = call compile (_myListbox lbData (lbCurSel _myListbox));

_data params [
	["_item","",[""]],
	["_status",3,[3]],
	["_amount",0,[0]],
	["_id",0,[0]]
]; 
if (_item == "yolo") exitWith {};
if (_status == 3) exitWith {hint "Вы не можете вернуть то, что у вас в инвентаре!";};

_e = missionNamespace getVariable [format["ahItem_%1",_id],false];
if (player getVariable["ahID",0] != _id && !_e) exitWith {hint "Кто-то покупает эту вещь!";};

_iCheck = true;
if (_amount > 1) then {
	_iCheck = [_item,_amount] call SunriseClient_market_checkItem;
};
if (!_iCheck) exitWith {[localize "STR_NOTF_InvFull","error"] call SunriseClient_gui_bottomNotification;};

life_market_wait = true;
[_id,_item,_amount,player] remoteExecCall ["SunriseServer_market_takeBack",RSERV];