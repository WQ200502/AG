/*

	Filename: 	SunriseClient_hazard_makeFog.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _obj = player; //lets go for clientside
private _pos = getPosATL _obj; //makes fog stick to ground
private _windarray = [1,1,0];  //let wind effect ground fog
private _transperency = 0.2; //transparency of fog
private _distance = 0.2; //distance the fog spawns to payer
private _height = random [-3, -1, -0.1]; //makes the height random
private _radius = 200;

private _fog1 = "#particlesource" createVehicleLocal _pos;
_fog1 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
	[0, 0, _height], _windarray, 1, 1.275, 1, 0,
	[21,6], [[0.467, 0.729, 0.506, 0], [0.467, 0.729, 0.506, _transperency], [0.467, 0.729, 0.506, 0]], [1000], 1, 0, "", "", _obj
];
_fog1 setParticleRandom [3, [_radius, _radius, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog1 setParticleCircle [_distance, [0, 0, -0.12]];
_fog1 setDropInterval 0.005;

private _fog2 = "#particlesource" createVehicleLocal _pos;
_fog2 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
	[0, 0, _height], _windarray, 1, 1.275, 1, 0,
	[15,6], [[0.467, 0.729, 0.506, 0], [0.467, 0.729, 0.506, _transperency], [0.467, 0.729, 0.506, 0]], [1000], 1, 0, "", "", _obj
];
_fog2 setParticleRandom [3, [_radius, _radius, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog2 setParticleCircle [_distance, [0, 0, -0.12]];
_fog2 setDropInterval 0.01;

private _fog3 = "#particlesource" createVehicleLocal _pos;
_fog3 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
	[0, 0, _height], _windarray, 1, 1.275, 1, 0,
	[10,6], [[0.467, 0.729, 0.506, 0], [0.467, 0.729, 0.506, _transperency], [0.467, 0.729, 0.506, 0]], [1000], 1, 0, "", "", _obj
];
_fog3 setParticleRandom [3, [_radius, _radius, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog3 setParticleCircle [_distance, [0, 0, -0.12]];
_fog3 setDropInterval 0.01;

private _fog4 = "#particlesource" createVehicleLocal _pos;
_fog4 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
	[0, 0, _height], _windarray, 1, 1.275, 1, 0,
	[8,6], [[0.467, 0.729, 0.506, 0], [0.467, 0.729, 0.506, _transperency], [0.467, 0.729, 0.506, 0]], [1000], 1, 0, "", "", _obj
];
_fog4 setParticleRandom [3, [_radius, _radius, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog4 setParticleCircle [_distance, [0, 0, -0.12]];
_fog4 setDropInterval 0.005;

private _fog5 = "#particlesource" createVehicleLocal _pos;
_fog5 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
	[0, 0, _height], _windarray, 1, 1.275, 1, 0,
	[4,6], [[0.467, 0.729, 0.506, 0], [0.467, 0.729, 0.506, _transperency], [0.467, 0.729, 0.506, 0]], [1000], 1, 0, "", "", _obj
];
_fog5 setParticleRandom [3, [_radius, _radius, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog5 setParticleCircle [_distance, [0, 0, -0.12]];
_fog5 setDropInterval 0.005;

life_hazard_fogTime = time + 120;

sleep 120;

deleteVehicle _fog1;
deleteVehicle _fog2;
deleteVehicle _fog3;
deleteVehicle _fog4;
deleteVehicle _fog5;