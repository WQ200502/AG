#include "..\..\script_macros.hpp"
if(anzus_antispam isEqualTo true) exitWith {
    ["反垃圾邮件：您必须等待几秒钟才能执行此操作","false","slow"] call ANZUS_fnc_notificationSystem;
    false
};

anzus_antispam = true;

[] spawn {
    uiSleep 1.25;
    anzus_antispam = false;
};
true
