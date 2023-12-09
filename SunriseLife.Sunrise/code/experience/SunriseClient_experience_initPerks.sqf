/*

	Filename: 	SunriseClient_experience_initPerks.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
{
	{
		_perk = configName _x;
		_lvl = [_perk] call SunriseClient_experience_getPerkLevel;

		_factor = getArray(_x >> "factor")#_lvl;
		switch (_perk) do { 
			case "perk_stamina" : {player setAnimSpeedCoef _factor};
			case "perk_recoil" : {player setUnitRecoilCoefficient _factor};
			case "perk_stabilization" : {player setCustomAimCoef _factor};
			default {};
		};
		
		missionNamespace setVariable [_perk,_factor];
	} forEach ("true" configClasses _x);
} forEach ("true" configClasses (missionConfigFile >> "Experience" >> "Perks"));