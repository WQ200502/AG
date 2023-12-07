#include "..\..\script_macros.hpp"
if (ITEM_VALUE("angel2") isEqualTo 1) exitWith { ["你并不需要一个以上的哀悼天使.","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"angel2",1] call ANZUS_fnc_handleInv;

["有人向你展示了哀悼天使的悲伤。","true","slow"] call ANZUS_fnc_notificationSystem;