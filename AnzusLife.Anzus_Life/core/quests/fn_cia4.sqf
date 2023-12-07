#include "..\..\script_macros.hpp"

if (ITEM_VALUE("cia4") isEqualTo 1) exitWith { ["你不需要每个中情局一个以上的包裹","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"cia4",1] call ANZUS_fnc_handleInv;
["你收集了一个中情局的海洛因包裹。","true","slow"] call ANZUS_fnc_notificationSystem;