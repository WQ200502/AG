/*

	Filename: 	SunriseClient_hazard_spawnArtifacts.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _artifacts = [];
for "_i" from 1 to 3 do {  
	_pos = hazard_zone getPos [3000 * sqrt random 1, random 360];
	if (!(surfaceIsWater _pos)) then {_artifacts pushBack [_pos,ceil random 4]} else {_i=_i-1};
};
