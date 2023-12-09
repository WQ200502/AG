/*

    Filename:   SunriseClient_admin_teleport.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

[] spawn {
    while {dialog} do {
        closeDialog 0;
        uiSleep 0.01;
    };
};

tele={
    _pos = [_this select 0, _this select 1, _this select 2];
    (vehicle player) setpos [_pos select 0, _pos select 1, 0];
    onMapSingleClick "";
    openMap [false, false];
    ["Вы телепортировались в указанную точку", "done"] call SunriseClient_gui_BottomNotification;
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";