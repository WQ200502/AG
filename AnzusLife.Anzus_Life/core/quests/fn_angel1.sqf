#include "..\..\script_macros.hpp"
if (ITEM_VALUE("angel1") isEqualTo 1) exitWith { ["你并不需要一个以上的争论不休的天使.","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"angel1",1] call ANZUS_fnc_handleInv;

["你已经从烦恼的天使身上看到了黑暗的一面。","true","slow"] call ANZUS_fnc_notificationSystem;