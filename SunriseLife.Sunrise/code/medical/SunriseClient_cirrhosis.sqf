/*

	Filename: 	SunriseClient_cirrhosis.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
private _visualEffects = {
    if !(alive player) exitWith {};
    _blinded_effects = ppEffectCreate["ColorCorrections", 2200];
    _blinded_effects ppEffectEnable true;
    _blinded_effects ppEffectAdjust[0.65, 0.9, 0, [0, 0, 0, 0.965], [1, 1, 1, 1], [1, 1, 1, 0]];
    _blinded_effects ppEffectCommit 0.3;

    waitUntil {
        ppEffectCommitted _blinded_effects
    };

    _blinded_effects ppEffectAdjust[1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]];
    _blinded_effects ppEffectCommit 0.3;
    waitUntil {
        ppEffectCommitted _blinded_effects
    };
    ppEffectDestroy _blinded_effects;
};

while { alive player } do {

    uiSleep 300;

    if !("cirrhosis" in life_array_problem) exitWith {};

    _scr = [] spawn _visualEffects;

    [5000] call BIS_fnc_bloodEffect;
    [5, "damage"] call SunriseClient_setDamage;

    if (life_pain_shock) then {
        ["Болевой шок", "life_pain_shock", 180] spawn SunriseClient_editBuff;
    } else {
        ["Болевой шок", "life_pain_shock", 180, 0] call SunriseClient_addBuff;
    };

    waitUntil {
        scriptDone _scr
    };

    for "_i"
    from 0 to 5 do {
        uiSleep 0.5;
        _scr = [] spawn _visualEffects;
        waitUntil {
            scriptDone _scr
        };
    };
};