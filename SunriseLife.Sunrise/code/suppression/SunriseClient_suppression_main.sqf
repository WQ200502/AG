/*

	Filename: 	SunriseClient_suppression_main.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if (life_suppr_Threshold > 0) then {
	private _subtract = call {
		if (((time - life_suppr_lastShotAt) <= 1.75) && life_suppr_haltRecovery) exitWith {0};
		if (life_suppr_Suppressed) exitWith {1.2 * life_suppr_recoverFactor};
		2 * life_suppr_recoverFactor;
	};
	life_suppr_Threshold = (life_suppr_Threshold - _subtract) max 0;
};
