#include "..\..\script_macros.hpp"
if (ITEM_VALUE("cia3") isEqualTo 1) exitWith { ["你不需要每个中情局一个以上的包裹","true","slow"] call ANZUS_fnc_notificationSystem; };
[true,"cia3",1] call ANZUS_fnc_handleInv;

["你收集了一个冰毒中情局的包裹。","true","slow"] call ANZUS_fnc_notificationSystem;