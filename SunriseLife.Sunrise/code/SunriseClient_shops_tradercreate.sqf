/*

	Filename: 	SunriseClient_shops_tradercreate.sqf
	Project: 	Sunrise Altis Life RPG

*/
#include "..\script_macros.hpp"
private _configName = param [0,"",[""]];

private _traderClassName = M_CONFIG2(getText,"LifeCfgTraders",worldName,_configName,"className");
private _traderFace = M_CONFIG2(getText,"LifeCfgTraders",worldName,_configName,"face");
private _animations = M_CONFIG2(getArray,"LifeCfgTraders",worldName,_configName,"animations");
private _position = M_CONFIG2(getArray,"LifeCfgTraders",worldName,_configName,"position");
private _direction = M_CONFIG2(getNumber,"LifeCfgTraders",worldName,_configName,"direction");
private _actions = M_CONFIG2(getArray,"LifeCfgTraders",worldName,_configName,"actions");

private _trader = _traderClassName createVehicleLocal [0,0,0];

_trader SVAR ["BIS_enableRandomization",false];
_trader SVAR ["BIS_fnc_animalBehaviour_disable",true];

_trader disableAI "ANIM";
_trader disableAI "MOVE";
_trader disableAI "FSM";
_trader disableAI "AUTOTARGET";
_trader disableAI "TARGET";
_trader disableAI "CHECKVISIBLE";

_trader allowDamage false;
_trader removeAllEventHandlers "HandleDamage";
if (EQUAL(_traderFace,"")) then {
	_traderFace = selectRandom (getArray(missionConfigFile >> "LifeCfgTraders" >> "faces"));
};
_trader setFace _traderFace;

private _attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosATL _position;
_position = [0, 0, 0];	

_trader reveal _attachToObject;
_attachToObject disableCollisionWith _trader;
_trader disableCollisionWith _attachToObject;
_trader attachTo [_attachToObject, _position];
_trader setDir _direction;
_trader switchMove (_animations select 0);

private _animationCount = count _animations;
if (_animationCount > 1) then {
	_trader SVAR ["TraderAnimations", _animations];
	_trader addEventHandler	["AnimDone", {_this call SunriseClient_shops_traderAnimDone}];
};

if (count _actions > 0) then {
	{		
		_trader addAction (call compile _x);
	} forEach _actions;
};

_trader