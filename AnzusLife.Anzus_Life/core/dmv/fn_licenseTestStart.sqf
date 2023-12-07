#include "..\..\script_macros.hpp"
if (!(playerSide isEqualTo civilian)) exitWith {["您需要成为平民才能参加此测试.","false","slow"] call ANZUS_fnc_notificationSystem;};
if (missionNamespace getVariable LICENSE_VARNAME("driver","civ")) exitwith {["您已经有驾驶执照","false","slow"] call ANZUS_fnc_notificationSystem;};

createDialog "Life_yesnoMenu";