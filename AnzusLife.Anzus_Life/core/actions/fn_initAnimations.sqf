#include "..\..\script_macros.hpp"
/*
    File: fn_initAnimations.sqf
    Author: Neil Smith / Deadlesszombie

    https://www.altisliferpg.com/profile/5736-deadlesszombie/
    Description:
    Create the dialog
*/
private ["_car"];
_car = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if (vehicle player != player) exitWith {["你不能在车内这样做","false","slow"] call ANZUS_fnc_notificationSystem;};

createdialog "deadlessAnim";
call ANZUS_fnc_updateListbox;
