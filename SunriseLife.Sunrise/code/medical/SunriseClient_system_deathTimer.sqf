/*

	Filename: 	SunriseClient_system_deathTimer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _deathTime = param [0,serverTime + 1200,[0]];

if ((life_copDuty && (count units life_copGroup) <= LIFE_SETTINGS(getNumber,"life_cop_min")) OR (life_medDuty) OR (_deathTime - serverTime < 0)) exitWith {
	life_death_markers = [];
	life_death_endtime = 0;
};
if (life_death_markers isEqualTo []) exitWith {};
disableSerialization;

{
	private _marker = createMarkerLocal [format["death_marker_%1",_x select 0],_x select 1];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerSizeLocal [1500,1500];
	_marker setMarkerBrushLocal "Solid";
	_marker setMarkerColorLocal "ColorBlack";

	private _warn = createMarkerLocal [format["death_warn_%1",_x select 0],_x select 1];
	_warn setMarkerColorLocal "ColorWhite";
	_warn setMarkerTypeLocal "KIA";
	_warn setMarkerTextLocal "Место смерти! Не входить!";
} forEach life_death_markers;

//systemchat format ["Запущен таймер правила новой жизни (%1 минут). Вам запрещено появляться на месте смерти!",round ((_deathTime - serverTime) / 60)];

["info","",format ["Запущен таймер правила новой жизни (%1 минут). Вам запрещено появляться на месте смерти!",round ((_deathTime - serverTime) / 60)],true] call SunriseClient_message;

private _timer = ["death_timer"] call SunriseClient_system_createTimer;
private _effect = ppEffectCreate ["dynamicBlur", 900];
life_death_endtime = _deathTime;
[{
	(_this#0) params ["_timer","_deathTime","_effect"];
	private _timeToEnd = _deathTime - serverTime;
	if (_timeToEnd < 1) exitWith {
		{
			deleteMarkerLocal format["death_marker_%1",_x select 0];
			deleteMarkerLocal format["death_warn_%1",_x select 0];
		} forEach life_death_markers;
	
		life_death_markers = [];
		life_death_endtime = 0;
	
		["death_timer"] call SunriseClient_gui_DestroyRscLayer;
		[_this#1] call CBA_fnc_removePerFrameHandler;
		_effect ppEffectAdjust [0];
		_effect ppEffectCommit 2;
		_effect ppEffectEnable false;
	};
	if (!alive player OR life_death_markers isEqualTo []) exitWith {
		["death_timer"] call SunriseClient_gui_DestroyRscLayer;
		[_this#1] call CBA_fnc_removePerFrameHandler;
		_effect ppEffectAdjust [0];
		_effect ppEffectCommit 2;
		_effect ppEffectEnable false;	
	};
	private _inZone = false;
	{
		if (player distance (_x select 1) < 1500) exitWith {
			_inZone = true;
			life_inDeadZone = true;
		};
	} forEach life_death_markers;

	if (_inZone AND !(ppEffectEnabled _effect)) then {
		_effect ppEffectEnable true;
		_effect ppEffectAdjust [5];
		_effect ppEffectCommit 2;
		player setFatigue 1;
		["Вы приближаетесь к месту смерти. Покиньте этот участок!", "error"] call SunriseClient_gui_BottomNotification;
	} else {
		if (_inZone) exitWith {};
		_effect ppEffectAdjust [0];
		_effect ppEffectCommit 2;
		_effect ppEffectEnable false;
		life_inDeadZone = false;
		player setFatigue 0;
	};

	_timer ctrlSetText format["Новая жизнь: %1",[_timeToEnd,"MM:SS"] call BIS_fnc_secondsToString];

},1,[_timer,_deathTime,_effect]] call CBA_fnc_addPerFrameHandler;