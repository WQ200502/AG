#include "..\..\script_macros.hpp"
if (ITEM_VALUE("artifact4") isEqualTo 1) exitWith { ["您不需要这些工件中的多个。","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"artifact4",1] call ANZUS_fnc_handleInv;

["你收集了一件神器。。","true","slow"] call ANZUS_fnc_notificationSystem;