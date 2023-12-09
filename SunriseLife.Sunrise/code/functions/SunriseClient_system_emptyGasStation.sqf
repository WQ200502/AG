/*

	Filename: 	SunriseClient_system_emptyGasStation.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

private _pumps = [[3757.27,13477.9,0.284326],[3757.68,13485.9,0.17697],[4001.14,12592.1,0.29137],[5019.57,14436.7,0.284588],[5023.17,14429.5,0.286886],[6198.84,15081.4,0.289261],[6798.12,15561.6,0.303074],[9025.77,15729.5,0.280479],[9023.86,15729.1,0.286369],[9021.94,15728.8,0.299515],[8481.83,18260.7,0.287231],[9205.86,12112.2,0.28462],[14173.3,16541.9,0.284382],[15297.1,17565.9,0.283983],[15780.9,17453.2,0.285763],[14136.9,18691.6,0.385155],[16875.2,15469.4,0.198438],[16871.7,15476.6,0.225411],[17417.2,13936.8,0.35062],[16750.9,12513.1,0.286047],[14351.9,12934.8,0.233295],[14357.7,12930.9,0.233295],[19965.2,11447.5,0.285095],[19961.3,11454.5,0.170815],[21230.5,7116.65,0.280348],[20784.9,16666,0.294933],[20789.6,16672.4,0.284454],[23379.4,19798.9,0.283937],[25701.2,21372.6,0.284824]];
{
	_pump = nearestObject [_x, "Land_fs_feed_F"];
	_pump setFuelCargo 0;
	_pump addAction ["<t color=""#d6ff33"">Заправить технику</t>",SunriseClient_system_refuelVehicleMenu,_forEachIndex,0,false,false,"","!life_action_inUse",5];
	_pump addAction [format["<t color=""#d6ff33"">Доставка бензина (Заправка #%1)</t>",_forEachIndex],SunriseClient_gas_fillGas,_forEachIndex,0,false,false,"","!life_action_inUse",5];
	_pump addAction [localize "STR_MF_24hShop",SunriseClient_system_weaponShopMenu,"shop24",0,false,false,"","",5];
} forEach _pumps;