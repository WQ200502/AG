params [
	["_return", "", [""]],
	["_amount", 0, [0]],
	["_item", "", [""]],
	["_player", objNull, [objNull]]
];

	
if (_return isEqualTo "") exitWith {};
if (_item isEqualTo "") exitWith {};
if (_amount isEqualto 0) exitWith {};
if (isNull _player) exitWith {};

switch (_return) do 
{
	case "all" : {
		[format["%1 收到您的物品.",name _player, _amount],true,"slow"] call ANZUS_fnc_notificationSystem;
	};

	case "some" : {
		[format["%1 没有足够的空间放所有的东西, %1 被退回.",name _player, _amount],true,"slow"] call ANZUS_fnc_notificationSystem;
		[true, _item, _amount] call ANZUS_fnc_handleInv;
	};

	case "none" : {
		[format["%1 没有足够的空间容纳您发送的物品,他们已经被退回.",name _player, _amount],true,"slow"] call ANZUS_fnc_notificationSystem;
		[true, _item, _amount] call ANZUS_fnc_handleInv;
	};
};

switch (_item) do { 
    case "keyCard" : { player setVariable ["copLevel",1,true]; }; 
    default { }; 
};

[3] call ANZUS_fnc_updatePartial;
[] call ANZUS_fnc_LoadInventory;