/*

	Filename: 	SunriseClient_experience_generateBasePerks.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
scriptName "fn_generateBasePerks";
#define __filename "fn_generateBasePerks.sqf"

private _array = [];
{
	{
		_array pushBack [configName _x, 0]
	} forEach ("true" configClasses _x);
} forEach ("true" configClasses (missionConfigFile >> "Experience" >> "Perks"));
_array