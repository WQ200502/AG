/*
	File: fn_lockVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks the vehicle (used through the network when the person calling it isn't local).
*/
params [
    ["_vehicle",Objnull,[Objnull]],
    ["_state",2,[0,false]]
];
if (isNull _vehicle) exitWith {};

_astate = switch (_state) do {
	case 0: {1};
	case 2: {0};
};

_vehicle lock _state;

switch (getModelInfo _vehicle select 0) do {
	case "mrap_02_unarmed_f.p3d": {		
		_vehicle animateDoor ["Door_LF", _astate];  
		_vehicle animateDoor ["Door_RF", _astate];
		_vehicle animateDoor ["Door_LM", _astate];
		_vehicle animateDoor ["Door_RM", _astate];
		_vehicle animateDoor ["Door_rear", _astate]; 
	};
	
	case "mrap_01_unarmed_f.p3d": {
		_vehicle animateDoor ["Door_LF", _astate];
		_vehicle animateDoor ["Door_RF", _astate];
		_vehicle animateDoor ["Door_LB", _astate];
		_vehicle animateDoor ["Door_RB", _astate];
	};
	
	case "mrap_03_unarmed_f.p3d": {
		_vehicle animateDoor ["Door_LF", _astate];
		_vehicle animateDoor ["Door_RF", _astate];
	};
	
	case "heli_transport_02_f.p3d": {
		_vehicle animateDoor ["Door_Back_L", _astate];
		_vehicle animateDoor ["Door_Back_R", _astate];
	};
};