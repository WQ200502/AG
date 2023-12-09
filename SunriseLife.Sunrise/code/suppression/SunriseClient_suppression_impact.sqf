/*

	Filename: 	SunriseClient_suppression_impact.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(alive player) exitWith {};

params [
	"_factor"
];
_factor = _factor * life_suppr_flybyIntensity;
if (((vehicle player) isEqualTo player) || (isTurnedOut player)) then {

    life_suppr_impactBlur ppEffectAdjust [(0.023 * _factor), (0.023 * _factor), (0.28 * _factor), (0.28 * _factor)];
    life_suppr_impactBlur ppEffectCommit 0;
	life_suppr_impactCC ppEffectAdjust [1, 1, 0, [0,0,0,(0.6 * _factor)], [1,1,1,1],[1,1,1,0]];
	life_suppr_impactCC ppEffectCommit 0;

	life_suppr_impactBlur ppEffectAdjust [0, 0, 0, 0];
	life_suppr_impactBlur ppEffectCommit (0.3 + (0.5 * _factor));
	life_suppr_impactCC ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
	life_suppr_impactCC ppEffectCommit (0.25 + (0.4 * _factor));

	// Makes the player twitch if it's been a while since he was getting shot at
	if ((time - life_suppr_lastShotAt) >= 60) then {
		addCamShake [3,0.4, 80];
	};
};