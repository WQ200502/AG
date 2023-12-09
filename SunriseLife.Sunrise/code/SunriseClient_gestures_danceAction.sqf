/*
	
	Filename: 	SunriseClient_gestures_danceAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _dance = param [0,"",[""]];
if (vehicle player != player) exitWith {["error","Ошибка","Нельзя это делать в транспорте"] call SunriseClient_message};
if !(isNull life_DraggedBody) exitWith {["error","Ошибка","Вы чем-то уже заняты"] call SunriseClient_message};
if (life_dance) exitWith {};
//if (life_action_inUse) exitWith {};
//if (life_switchWeapon_handler) exitWith {};
//if ((time - life_action_delay) < 1) exitWith {["error","Ошибка","Вы делаете это слишком быстро"] call SunriseClient_message};

//life_action_delay = time;

life_dance = true;
//life_action_inUse = true;
[_dance] call SunriseClient_system_animDo;

["<t color='#ffffff' shadow='1' size = '.6'>Чтобы закончить танец нажмите - <t color='#ffa600'>A</t> | <t color='#ffa600'>D</t>.</t>",0,1,8,0,0,789] spawn BIS_fnc_dynamicText;

uiSleep 2;
waitUntil {uiSleep 0.03; !(ISANIMSTATE(_dance)) OR (LSNOTALIVE(player))};
if (LSINCAP(player)) then {
	["unconsciousrevivedefault"] call SunriseClient_system_animDo;
} else {[] call SunriseClient_system_animDo};

life_dance = false;
//life_action_inUse = false;
//["",0,1,8,0,0,789] spawn BIS_fnc_dynamicText;