#include "..\..\script_macros.hpp"
/*
    File: fn_doAnimation.sqf
    Author: Neil Smith / Deadlesszombie

    https://www.altisliferpg.com/profile/5736-deadlesszombie/
    Description:
    Do the dancing animation
*/

_deadlessDanceList = CONTROL(9990,9992);
_DeadlessIndex = lbCurSel 9992;
_animationData = _deadlessDanceList lbData _DeadlessIndex;

[player,_animationData,true] remoteExecCall ["ANZUS_fnc_animSync",RCLIENT];
player switchMove _animationData;
player playMoveNow _animationData;