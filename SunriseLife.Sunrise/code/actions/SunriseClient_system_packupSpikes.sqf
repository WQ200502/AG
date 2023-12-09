/*

	Filename: 	SunriseClient_system_packupSpikes.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if (isNil "_spikes") exitWith {};

if (["srl_MetalWire"] call SunriseClient_system_addItem) then {
	titleText[localize "STR_NOTF_SpikeStrip","PLAIN"];
	player removeAction life_action_spikeStripPickup;
	life_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
} else {
	["error","",format[localize "STR_NOTF_InvFull"]] call SunriseClient_message;
};