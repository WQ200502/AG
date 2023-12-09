/*

	Filename:	SunriseClient_market_loadInventory.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (isNull (findDisplay 15600)) then {
	createDialog "Market_vsell";
	waitUntil {!isNull (findDisplay 15600)};
};

disableSerialization;
_dialog = findDisplay 15600;
_myInvListbox = _dialog displayCtrl 15601;

lbClear _myInvListbox;
private _playerInvArr = [] call SunriseClient_system_getPlayerItems;
_playerInvArr pushback ["yolo"];

_uid = getPlayerUID player;
{
	if (_x select 5 == _uid AND (_x select 7 != 2)) then {
		_playerInvArr pushBack [_x select 2,_x select 1,_x select 7,_x select 8,_x select 4,_x select 0]
	};
} forEach all_ah_items; //GET I MENU AND THEIR STATUS

_index = -1;
if (_playerInvArr isEqualTo [["yolo"]]) then {
	_myInvListbox lbAdd format ["У вас нет вещей в инвентаре и на торговой площадке"];
} else {
	{
		_x params [
			["_item","",[""]],
			["_itemQuantity",1,[0]],
			["_status",3,[3]],
			["_time",0,[0]],
			["_price",0,[0]],
			["_id",0,[0]]
		];
		_index = _index + 1;
		if (_item == "yolo") then {
			_myInvListbox lbAdd format ["-------------------- АКТИВНЫЕ ЛОТЫ -----------------------"];
			_myInvListbox lbSetTextRight [(lbSize _myInvListbox)-1,"Срок [Состояние]"];
			_myInvListbox lbSetData [(lbSize _myInvListbox)-1,format ["%1",[_x select 0]]];
		} else {
			_details = [_item] call SunriseClient_system_itemDetails;
			_details params ["_item","_itemDisplayName","_pic"];
			
			_timeDisplay = "";
			_priceDisplay = "";
			if (_time > 0) then {
				_timeDisplay = format ["| Истечет через %1 ч.",_time];
				_priceDisplay = format["| Цена $%1",[_price] call SunriseClient_system_numberText];
			};
			
			_stat = switch (_status) do {
				case 0: {" [Продается]"};
				case 1: {" [Срок истек]"};
				case 3: {" [В инвентаре]"};
			};
			
			_myInvListbox lbAdd format ["(%2) %1 %3",_itemDisplayName,_itemQuantity,_priceDisplay];
			_myInvListbox lbSetPicture [_index, _pic];
			_myInvListbox lbSetPictureColor [_index, [1, 1, 1, 1]];
			_myInvListbox lbSetTextRight [(lbSize _myInvListbox)-1,format ["%1%2",_timeDisplay,_stat]];
			_myInvListbox lbSetData [(lbSize _myInvListbox)-1,format ["%1",[_x select 0,_status,_itemQuantity,_id]]];
		};
	} forEach _playerInvArr;
};

