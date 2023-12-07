#include "..\..\script_macros.hpp"
/*
    File: fn_medBDeffect.sqf
    Author: Fresqo
    Description: sorts out a blood loss effect from too much blood loss
*/

params [
    ["_target",objNull,[objNull]],
    ["_medic",objNull,[objNull]]
];

if (isNull _medic || !alive _medic || isNull _target || !alive _target) exitWith {};

hint "您再也无法处理失血了!";
[1,"现在不能处理这位病人失血了"] remoteExec ["life_fnc_broadcast",_medic];
_target setVariable ["bloodcap",true,true];
        
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [3]; 
"dynamicBlur" ppEffectCommit 3;  
enableCamShake true;  
addCamShake [1, 15, 10];  
_target setFatigue 1;  
5 fadeSound 0.1;
uiSleep 10; 

"dynamicBlur" ppEffectEnable true;  
"dynamicBlur" ppEffectAdjust [0];  
"dynamicBlur" ppEffectCommit 15; 
resetCamShake;  
20 fadeSound 1;
    
_target spawn 
{
    while {true} do 
    {
	uiSleep 180;
	if (isNull _this || !alive _this) exitWith {};
	_b = _this getVariable ["bloodtype",[]];
        _b set[2,((_b select 2) - 1)];
        _this setVariable["bloodtype",_b,true];
        if ((_b param [2,0,[0]]) <= 0) exitWith {_this setVariable ["bloodcap",false,true];};
    };
};
