#include "..\..\script_macros.hpp"
/*
 Created by repentz
*/

params [
    ["_vehicle",objNull,[objNull]]
];

private ["_payCheck"];

_payCheck = selectRandom [4500,2000,2500,3000,3500,4000,1500,2000,2500,3000,3500,4000,1500,2000,2000,3000,3500,4000,9000];

[_payCheck] call cKGySJkJHNXbPgorKa;
player removeAction life_collectMoneys;
player setVariable ["taskStartMedic",false,true];
playSound "testcomplete";
[format["恭喜，您完成了器官运输任务，并获得了 $%1. 享受!",[_payCheck] call anzus_fnc_numberText,false,"slow"]] call anzus_fnc_notificationSystem;
