/*

	Filename: 	SunriseClient_system_shopBoxDestroy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
ShopBoxCamera cameraEffect ["terminate", "back"];
camDestroy ShopBoxCamera;

if (!isNil "ShopBoxTable" && {!isNull ShopBoxTable}) then {deleteVehicle ShopBoxTable};
if (!isNil "ShopBoxVehicle" && {!isNull ShopBoxVehicle}) then {deleteVehicle ShopBoxVehicle};
if (!isNil "ShopBoxBackgroundObject" && {!isNull ShopBoxBackgroundObject}) then {deleteVehicle ShopBoxBackgroundObject};
if (!isNil "ShopBoxLightSource" && {!isNull ShopBoxLightSource}) then {deleteVehicle ShopBoxLightSource};
if (!isNil "ShopBoxLight_1" && {!isNull ShopBoxLight_1}) then {deleteVehicle ShopBoxLight_1};
if (!isNil "ShopBoxLight_2" && {!isNull ShopBoxLight_2}) then {deleteVehicle ShopBoxLight_2};
if (!isNil "ShopBoxLight_3" && {!isNull ShopBoxLight_3}) then {deleteVehicle ShopBoxLight_3};
if (!isNil "ShopBoxLight_4" && {!isNull ShopBoxLight_4}) then {deleteVehicle ShopBoxLight_4};
if (!isNil "ShopBoxWeapHolder" && {!isNull ShopBoxWeapHolder}) then {deleteVehicle ShopBoxWeapHolder};
if (!isNil "ShopBoxWeapTurnItem" && {!isNull ShopBoxWeapTurnItem}) then {deleteVehicle ShopBoxWeapTurnItem};

//showChat true;