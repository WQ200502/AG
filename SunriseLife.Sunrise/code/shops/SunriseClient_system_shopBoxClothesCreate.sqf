/*

	Filename: 	SunriseClient_system_shopBoxClothesCreate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
ShopBoxPosition = [0,0,300];
ShopBoxVehiclePosition = [0,0,300.1];

ShopBoxBackgroundObject = "Land_Hangar_F" createVehicleLocal ShopBoxPosition;
ShopBoxBackgroundObject enableSimulation false;
ShopBoxBackgroundObject allowDamage false;
ShopBoxBackgroundObject setPosASL ShopBoxPosition;
ShopBoxBackgroundObject setDir (getDir player);

ShopBoxLight_1 = "#lightpoint" createvehiclelocal (ShopBoxBackgroundObject modelToWorld [6,6,0]);
ShopBoxLight_2 = "#lightpoint" createvehiclelocal (ShopBoxBackgroundObject modelToWorld [-6,-6,0]);
ShopBoxLight_3 = "#lightpoint" createvehiclelocal (ShopBoxBackgroundObject modelToWorld [6,-6,0]);
ShopBoxLight_4 = "#lightpoint" createvehiclelocal (ShopBoxBackgroundObject modelToWorld [-6,6,0]);

ShopBoxLight_1 setlightBrightness 1;
ShopBoxLight_1 setLightColor [1,1,1];
ShopBoxLight_1 setLightAmbient [1,1,1];

ShopBoxLight_2 setlightbrightness 1;
ShopBoxLight_2 setlightcolor [1,1,1];
ShopBoxLight_2 setlightambient [1,1,1];

ShopBoxLight_3 setlightbrightness 1;
ShopBoxLight_3 setlightcolor [1,1,1];
ShopBoxLight_3 setlightambient [1,1,1];

ShopBoxLight_4 setlightbrightness 1;
ShopBoxLight_4 setlightcolor [1,1,1];
ShopBoxLight_4 setlightambient [1,1,1];

ShopBoxVehicle = "b_survivor_F" createVehicleLocal ShopBoxVehiclePosition;
ShopBoxVehicle setPosASL ShopBoxVehiclePosition;
ShopBoxVehicle setDir (getDir player);
ShopBoxVehicle enableSimulation false;
ShopBoxVehicle switchMove "amovpercmstpsnonwnondnon";

removeUniform ShopBoxVehicle;
removeVest ShopBoxVehicle;
removeBackpack ShopBoxVehicle;
removeGoggles ShopBoxVehicle;
removeHeadGear ShopBoxVehicle;

ShopBoxVehicle forceAddUniform life_oldClothes;
ShopBoxVehicle addBackpack life_oldBackpack;
ShopBoxVehicle addVest life_oldVest;
ShopBoxVehicle addGoggles life_oldGlasses;
ShopBoxVehicle addHeadgear life_oldHat;

ShopBoxRadius = 3;
ShopBoxRadiusMax = 12;
ShopBoxAngle = 0;
ShopBoxAltitude = 302;
ShopBoxSpeed = 0.2; 
ShopBoxAngleStep = 1.5;
ShopBoxRadStep = 0.5;
ShopBoxAltitudeStep = 0.03;

ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
ShopBoxCameraCord set [2, ShopBoxAltitude];

ShopBoxCamera = "camera" camCreate ShopBoxCameraCord;
ShopBoxCamera cameraEffect ["INTERNAL","BACK"];
ShopBoxCamera camPrepareFOV 0.700;
ShopBoxCamera camPrepareTarget ShopBoxVehicle;

ShopBoxCameraCord = ShopBoxVehicle getPos [ShopBoxRadius,ShopBoxAngle];
ShopBoxCameraCord set [2, ShopBoxAltitude];
ShopBoxCamera camPreparePos ShopBoxCameraCord;
ShopBoxCamera camCommitPrepared ShopBoxSpeed;

showCinemaBorder false;
//showChat false;