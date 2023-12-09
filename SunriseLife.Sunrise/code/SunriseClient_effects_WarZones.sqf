/*

	Filename: 	SunriseClient_effects_WarZones.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_HANDLE_WARZONES = [{
	if (server_warzones isEqualTo []) exitWith {life_inwarzone = false;[_this#1] call CBA_fnc_removePerFrameHandler;LIFE_HANDLE_WARZONES = -1};
	_inZone = false;
	_inBattle = false;
	{
		_marker = format["war_zone_%1",_x select 0];
		if (player distance2D getMarkerPos _marker < (_x select 1)) exitWith {
			if ((_x select 0) isEqualTo 1337) then {_inBattle = true};
				_inZone = true;
		};
	} forEach server_warzones;

	if (_inZone) then {
		life_inwarzone = true;
		if !(cameraView in ["INTERNAL","GUNNER"])  then {
			player switchCamera "INTERNAL";		
		};
		if (_inBattle) then {
			if !(((group player) getVariable ["gang_id",-1]) in ((enabledCaptures select BattleIndex) select 8)) then {
				[format["<t size='2.2' color='#ff0000' align='center'>Внимание!</t><br /><br />Ваша группа не участвует в битве за эту переработку!<br /><br /> Немедленно покиньте поле боя, иначе вы перемещены за границу боевых действий!<br /></t>"],"error"] spawn SunriseClient_system_hint;
				player setPos [((getPos player) select 0)-60*sin(player getDir (getMarkerPos "war_marker_1337")),((getPos player) select 1)-60*cos(player getDir (getMarkerPos "war_marker_1337"))];
			};
		};
	} else {
		life_inwarzone = false;
	};
},2] call CBA_fnc_addPerFrameHandler;