/*

    Filename:   SunriseClient_martiallaw_getWarPointCoord.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\script_macros.hpp"
setpointcoord = {
	private _xc = format["%1",round(_this select 0)];
	private _yc = format["%1",round(_this select 1)];
	onMapSingleClick "";
	openMap [false, false];
	createDialog "SunriseDialogAddWarpoint";
	waitUntil {!isNull (findDisplay 4400)};
	ctrlSetText [4404, format["%1",_xc]];
	ctrlSetText [4405, format["%1",_yc]];
	hint "Точка выбрана";
};

openMap [true, false];
onMapSingleClick "_pos call setpointcoord";
hint "Кликните на карте место, где будет создана точка военного положения";