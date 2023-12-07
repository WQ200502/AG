#include "..\..\script_macros.hpp"
if (ITEM_VALUE("angel3") isEqualTo 1) exitWith { ["你并不需要一个以上的指点天使","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"angel3",1] call ANZUS_fnc_handleInv;

["你已经被指点的天使指示了方向。","true","slow"] call ANZUS_fnc_notificationSystem;