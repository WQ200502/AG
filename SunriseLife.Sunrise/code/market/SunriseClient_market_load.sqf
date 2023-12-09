/*

	Filename:	SunriseClient_market_load.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 15100)) then {
	createDialog "Market_buy";
	waitUntil {!isNull (findDisplay 15100)};
};
private ["_pic","_itemName","_search","_allAH","_found"];
_search = param [0,"",[""]];

_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
_allAH = all_ah_items;

if (_search != "") then {
	_allAH = [];
	{
		_found = (_x select 3) find _search;
		if (_found != -1) then {_allAH pushBack _x};
	} forEach all_ah_items;
};
if (all_ah_items isEqualTo []) then {
	_myListbox lbAdd format ["На данный момент торговая площадка пуста. Вы можете быть первым, кто выставит свою вещь на продажу!"];
	_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",["none"]]];
} else {
	{	
		if (_x select 7 == 0) then {//status
			_x params ["_id","_amount","_item","_itemName","_price","_seller","_sellerName","_status","_time"];
	
			_itemName = ([_item] call SunriseClient_system_itemDetails) select 1;
			_pic = [_item] call SunriseClient_system_itemDetails select 2;
			
			_myListbox lbAdd format ["(%3 шт.) %2 за $%1",[_price] call SunriseClient_system_numberText,_itemName,_amount];
			_myListbox lbSetTextRight [(lbSize _myListbox)-1,format ["| Истечет через %1 ч. [%2]",_time,_sellerName]];
			_myListbox lbSetPicture [(lbSize _myListbox)-1, _pic];
			_myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
			_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_id,_seller,_item,_price,_amount,_sellerName]]];
		};
	} forEach _allAH;
};
hint "Торговая площадка успешно загружена";


