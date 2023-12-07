#include "..\..\script_macros.hpp"

private["_unit"];
_unit = cursorTarget;

_value = ITEM_VALUE("zipties");
if(_value isEqualTo 0) exitWith {["您需要从市场购买拉链才能做到这一点..","true","slow"] call ANZUS_fnc_notificationSystem;};
if((life_action_inUse) || (player getVariable ["restrained", false])) exitWith {["你不能这样做.","true","slow"] call ANZUS_fnc_notificationSystem;};
if(isNull _unit) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

[false,"zipties",1] call ANZUS_fnc_handleInv;

life_action_inUse = true;
[_unit,"zipties"] remoteexeccall ["say3D",-2];

_randycunt = 3;
_num = 1;
_myposy = getPos player;
while {_randycunt > _num} do {
	_randycunt = _randycunt - 1;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 1;
};

[player] remoteExec ["ANZUS_fnc_restrainclientforcop", _unit];

life_action_inUse = false;
