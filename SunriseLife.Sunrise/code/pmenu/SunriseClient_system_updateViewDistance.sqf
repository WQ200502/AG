/*

	Filename: 	SunriseClient_system_updateViewDistance.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _viewDistance = switch (true) do {
	case (NOTINVEH(player)): {life_viewDistanceFoot};
	case ((objectParent player) isKindOf "LandVehicle"): {life_viewDistanceCar};
	case ((objectParent player) isKindOf "Ship"): {life_viewDistanceCar};
	case ((objectParent player) isKindOf "Air"): {life_viewDistanceAir};
	default {life_viewDistanceFoot};
};

setViewDistance _viewDistance;