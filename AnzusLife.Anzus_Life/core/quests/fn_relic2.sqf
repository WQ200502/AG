#include "..\..\script_macros.hpp"
if (ITEM_VALUE("relic2") isEqualTo 1) exitWith { ["你不需要一件以上的遗物","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"relic2",1] call ANZUS_fnc_handleInv;

["你收集了一个阿尔坎遗迹","true","slow"] call ANZUS_fnc_notificationSystem;