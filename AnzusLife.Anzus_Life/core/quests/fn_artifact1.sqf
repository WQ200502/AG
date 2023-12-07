#include "..\..\script_macros.hpp"
if (ITEM_VALUE("artifact1") isEqualTo 1) exitWith { ["您不需要这些工件一个以上.","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"artifact1",1] call ANZUS_fnc_handleInv;

["你收集了一件神器。。","true","slow"] call ANZUS_fnc_notificationSystem;