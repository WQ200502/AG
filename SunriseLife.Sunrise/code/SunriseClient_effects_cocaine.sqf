/*

    Filename:   SunriseClient_effects_Cocaine.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\script_macros.hpp"
private _duration = param [0,10,[0]];
private _effect1 = ppEffectCreate ["chromAberration",200];
_effect1 ppEffectEnable true;

playMusic ["BackgroundTrack03_F", 0];

private _timeout = time + _duration;
private ["_force"];
waitUntil {
  _force = random 10;
  _effect1 ppEffectAdjust [_force / 24,_force / 24,false];
  _effect1 ppEffectCommit (0.3 + random 0.1);
  waituntil {ppEffectCommitted _effect1};
  (time > _timeout)
};

playMusic "";
ppEffectDestroy _effect1;