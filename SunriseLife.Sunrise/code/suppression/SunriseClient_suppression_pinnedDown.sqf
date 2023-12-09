/*

	Filename: 	SunriseClient_suppression_pinnedDown.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if (life_suppr_Threshold >= 8) then {	
	if (alive player) then {
		if !life_suppr_Suppressed then {
			life_suppr_Suppressed = true;
		};
		private _workValue = (life_suppr_intensity * ((life_suppr_Threshold - 8) / (30 - 8)));
		addCamShake 
		[
			(_workValue * 1),		// Power
			2 + (_workValue * 23),	// Frequency
			1.5						// Duration
		];
			
		life_suppr_blur ppEffectAdjust [(_workValue * 1.28)];
		life_suppr_blur ppEffectCommit 0.5;
			
		life_suppr_cc ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,(1 - (_workValue * 0.40))],[1,1,1,0]];
		life_suppr_cc ppEffectCommit 0.5;
			
		life_suppr_rBlur ppEffectAdjust [(_workValue * 0.011), (_workValue * 0.011), 0.2, 0.2];
		life_suppr_rBlur ppEffectCommit 0.05;
	};
} else {
	if life_suppr_Suppressed then {
		life_suppr_Suppressed = false;
		life_suppr_cc ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
		life_suppr_cc ppEffectCommit 0;
			
		// Blur
		life_suppr_blur ppEffectAdjust [0];
		life_suppr_blur ppEffectCommit 0.3;
			
		// RBlur
		life_suppr_rBlur ppEffectAdjust [0, 0, 0, 0];
		life_suppr_rBlur ppEffectCommit 1;
	};
};