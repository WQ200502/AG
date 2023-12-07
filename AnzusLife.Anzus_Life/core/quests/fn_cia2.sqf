#include "..\..\script_macros.hpp"
if (ITEM_VALUE("cia2") isEqualTo 1) exitWith { ["你不需要每个中情局一个以上的包裹","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"cia2",1] call ANZUS_fnc_handleInv;

["你收集了一个中情局的大麻包。","true","slow"] call ANZUS_fnc_notificationSystem;