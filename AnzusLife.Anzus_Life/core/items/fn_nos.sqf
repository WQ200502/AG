#include "..\..\script_macros.hpp"
private ["_veh","_vehVel","_vehDir","_vehAddSpeed"];
_veh = vehicle player;	
if(_veh == player) exitWith {};
if(driver _veh !=player) exitWith {};
if((_veh getVariable ["vehnos",0]) < 1) exitWith {};
if((speed _veh) <= 5) exitWith {["开始移动笨蛋。你需要移动超过5公里",false,"slow"] call anzus_fnc_notificationSystem;};
_veh setVariable ["vehnos",((_veh getVariable ["vehnos",0]) - 1),true];
_veh setVariable ["time",time, false];
_vehVel = velocity _veh;
_vehDir = direction _veh;
_vehAddSpeed = 12;
_veh setVelocity [(_vehVel select 0) +(sin _vehDir*_vehAddSpeed), (_vehVel select 1)+(cos _vehDir*_vehAddSpeed),(_vehVel select 2)];
