/*

	Filename: 	SunriseClient_shops_tradercreatesimple.sqf
	Project: 	Sunrise Altis Life RPG

*/
#include "..\script_macros.hpp"
private _configName = param [0,"",[""]];

private _position = M_CONFIG2(getArray,"LifeCfgTraders",worldName,_configName,"position");
private _direction = M_CONFIG2(getNumber,"LifeCfgTraders",worldName,_configName,"direction");
private _actions = M_CONFIG2(getArray,"LifeCfgTraders",worldName,_configName,"actions");

private _trader = "Land_InfoStand_V2_F" createVehicleLocal [0,0,0];

_trader setPosATL _position;
_trader setDir (_direction - 180);

if (count _actions > 0) then {
	{		
		_trader addAction (call compile _x);
	} forEach _actions;
};

_trader allowDamage false;
_trader enableSimulation false;

_trader