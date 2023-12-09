/*

	Filename: 	fn_surgeryBoxDestroy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
ShopBoxCamera cameraEffect ["terminate", "back"];
deleteVehicle ShopBoxVehicle;
deleteVehicle ShopBoxBackgroundObject;
camDestroy ShopBoxCamera;