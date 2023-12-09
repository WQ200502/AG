/*

	Filename: 	SunriseClient_ltd_mainmenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
if (EQUAL(life_ltdData,[])) exitWith {hint "У вас нет фирмы"};
disableSerialization;
createDialog "SunriseDialogLtdMain";
waitUntil {!isNull (findDisplay 7300)};
ctrlSetText [7301, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

private _status = CONTROL(7300,7302);

life_ltdData params ["_id","_owner","_name","_bank","_info","_licenses","_shopsCount"];

_status ctrlSetStructuredText parseText format ["<t color='%1'><t size='2'>%2</t><br/><br/><br/><t size='1.1'>Баланс: $%3<br/>Магазинов: %4</t>
</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000'],_name,[_bank] call SunriseClient_system_numberText,_shopsCount];