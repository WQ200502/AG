#include "..\..\script_macros.hpp"
if (ITEM_VALUE("unknown") >= 22) exitWith { ["你不可能再收集这些。。。倒霉。试着找出谁需要它并把它带给他们","true","slow"] call ANZUS_fnc_notificationSystem; };
if ((missionNameSpace getVariable ["mav_ttm_var_relicReward",0]) isEqualTo 0) exitwith {["在完成这个任务之前你需要完成第一个任务！","true","slow"] call ANZUS_fnc_notificationSystem;}; 
if ((missionNameSpace getVariable ["mav_ttm_var_relicReward2",0]) isEqualTo 0) exitwith {["在完成这个任务之前你需要完成第二个任务！","true","slow"] call ANZUS_fnc_notificationSystem;}; 
if ((missionNameSpace getVariable ["mav_ttm_var_satellite",0]) isEqualTo 0) exitwith {["在完成这个任务之前你需要完成第三个任务！","true","slow"] call ANZUS_fnc_notificationSystem;}; 

[true,"unknown",1] call ANZUS_fnc_handleInv;
["你收集了一些奇怪的东西。。。","true","slow"] call ANZUS_fnc_notificationSystem;