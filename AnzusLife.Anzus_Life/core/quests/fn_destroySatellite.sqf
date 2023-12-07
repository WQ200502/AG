#include "..\..\script_macros.hpp"

if ((missionNamespace getVariable ['mav_ttm_var_satellite',0]) isEqualTo 1) exitwith {["你已经开始或完成了任务！","true","slow"] call ANZUS_fnc_notificationSystem;}; 
if (ITEM_VALUE("satellite") isEqualTo 1) exitWith { ["你已经把卫星上需要的部分取出来了！","true","slow"] call ANZUS_fnc_notificationSystem; };

[true,"satellite",1] call ANZUS_fnc_handleInv;
[player,"satelliteOff"] remoteexeccall ["say3D",-2];

["你已经收集了合适的卫星部分，把它交给考古学家。","true","slow"] call ANZUS_fnc_notificationSystem;