#include "..\..\script_macros.hpp"
private["_vault","_dir","_location","_attachTo","_drilltype"];
params [
	["_vault",objNull,[objNull]]
];

if(isNull _vault) exitWith {}; //Bad object
switch (typeOf _vault) do {
		case ("Land_CommonwealthBank"): {_location = [0.1,2.2,3]; _attachTo = [0.1,2.48,4.48]; _drilltype = "UB_Drill"; _dir = getDir _vault;};
		case ("Land_ANZUS_bank"): {_location = [-1.8,8.4,0];  _attachTo = [-1.68,9.1,0.9]; _drilltype = "Drill"; _dir = getDir _vault - 270;};
		case ("Land_buildingsCasino2"): {_attachTo = [10.2539,-15.45,-16.7]; _drilltype = "Drill"; _dir = getDir _vault;};
		case ("Land_bludsatcombunker_v"): {_attachTo = [-12,0,-0.9]; _drilltype = "Drill"; _dir = getDir _vault - 90;};
};

bankdrill = createVehicle [_drilltype,[0,0,999],[], 0, "NONE"];
bankdrill setPosATL (_vault modelToWorld _attachTo);
bankdrill setDir _dir;

while {(alive bankdrill)} do
	{
		playSound3D ["AnzusLifecore\sounds\pdrill.ogg", bankdrill, false, getPosASL bankdrill, 10, 1, 20];
		sleep 2;
	};
