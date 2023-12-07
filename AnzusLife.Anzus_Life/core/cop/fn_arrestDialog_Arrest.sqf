#include "..\..\script_macros.hpp"

private ["_time"];

if (isNil "life_ArrestedPlayer") exitWith {};
if (!isPlayer life_ArrestedPlayer || isNull life_ArrestedPlayer) exitWith {};
if(playerSide != west) exitWith {};

_time = ctrlText 23;
_officerName = lbText[22, (lbCurSel 22)];

if (_officerName isEqualTo "") exitWith {
	["您必须选择逮捕嫌疑犯的人员","true","slow"] call ANZUS_fnc_notificationSystem;
};

if(! ([_time] call ANZUS_fnc_isNumber)) exitWith {
	[localize "STR_ATM_notnumeric","true","slow"] call ANZUS_fnc_notificationSystem;
};

_time = parseNumber _time;
_time = round _time;

_jailSettings = MAIN_SETTINGS("Jail","Settings");
_minTime = getNumber(_jailSettings >> "minTime");
_maxTime = getNumber(_jailSettings >> "maxTime");

if(_time < _minTime || _time > _maxTime) exitWith {[format["你只能设置 %1-%2 月!",_minTime,_maxTime],true,"slow"] call ANZUS_fnc_notificationSystem;};
closeDialog 0;

if (!([] call anzus_fnc_antispam)) exitWith {};
[life_ArrestedPlayer, _time] call ANZUS_fnc_arrestAction;

_officer = allPlayers select {name _x == _officerName && side _x == west};
if (_officer isEqualTo []) exitWith {};

_officer = _officer select 0;
_reward = _time * 100;

[format["您被捕的玩家已被判入狱 %1 月. 请注意，暂时禁用监狱奖励.", _time, ([_reward] call ANZUS_fnc_numberText)],true,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_officer];
[_reward] remoteExec ["xiyECYLNxrKhXypAac",_officer];
