	
private["_unit"];
_unit = param [0];
if((life_action_inUse) || (player getVariable ["restrained", false])) exitWith {["你不能这样做.","true","slow"] call ANZUS_fnc_notificationSystem;};

if(isNull _unit) exitWith {};

_unit setVariable ["Escorting",false,true];
[_unit,"zipties"] remoteexeccall ["say3D",-2];
