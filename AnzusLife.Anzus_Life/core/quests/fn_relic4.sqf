#include "..\..\script_macros.hpp"

if (ITEM_VALUE("relic4") isEqualTo 1) exitWith { ["你不需要一件以上的遗物","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"relic4",1] call ANZUS_fnc_handleInv;
["你收集了一件莱尼遗物","true","slow"] call ANZUS_fnc_notificationSystem;