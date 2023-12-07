#include "..\..\script_macros.hpp"	

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};	
if((_unit getVariable ["blindfolded", false])) exitWith {};

if((life_action_inUse) || (player getVariable ["restrained", false])) exitWith { 
	["你不能这样做.","true","slow"] call ANZUS_fnc_notificationSystem;
}; 

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
	
_value = ITEM_VALUE("blindfold");
if(_value isEqualTo 0) exitWith {
	["您需要从市场上购买眼罩才能做到这一点..","true","slow"] call ANZUS_fnc_notificationSystem;
};

[false,"blindfold",1] call ANZUS_fnc_handleInv;

_cme = 1;
_myposy = getPos player;

while {true} do {
life_action_inUse = true;
	if( player distance _myposy > 2.5 ) exitwith { 
		["太远了!","true","slow"] call ANZUS_fnc_notificationSystem;
	};
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	_cme = _cme + 1;
	if(_cme > 3) exitwith {
		cursorTarget setVariable["blindfolded", true, true];
		[player] remoteExecCall ["ANZUS_fnc_tieingb", cursorTarget];
	};
};
life_action_inUse = false;

