/*

	Filename: 	SunriseClient_garage_SellVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 2802),-1)) exitWith {[localize "STR_Global_NoSelection","error"] call SunriseClient_gui_bottomNotification};
private _data = CONTROL_DATA(2802);
_data = call compile format["%1",_data];
private _vehicle = _data select 0;
private _vid = CONTROL_VALUE(2802);

closeDialog 0;

if (life_action_inUse) exitWith {}; // prevent duping
if (isNil "_vehicle") exitWith {[localize "STR_Garage_Selection_Error","error"] call SunriseClient_gui_bottomNotification};
if ((time - life_action_delay) < 5) exitWith {["Слишком часто жмете на кнопку. Подождите","error"] call SunriseClient_gui_bottomNotification;closeDialog 0;};

private _displayName = getText(configFile >> "CfgVehicles" >> (_vehicle) >> "displayName");

private _action = [
	format["Вы уверены, что хотите продать %1?",_displayName],
	"Внимание!",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call SunriseClient_gui_guiMessage;

if (_action) then {
	call SunriseClient_actions_inUse;
	if ((time - life_action_delay) < 5) exitWith {["Слишком часто жмете на кнопку.Подождите","error"] call SunriseClient_gui_bottomNotification;closeDialog 0;life_action_inUse = false;};
	private _basePrice = _data select 5;
	if (EQUAL(_basePrice,0)) exitWith {["У техники нет стоимости покупки!","error"] call SunriseClient_gui_bottomNotification;life_action_inUse = false;};
	private _price = round (_basePrice - (_basePrice * 0.3));

	["Отправлен запрос на продажу техники...", "info"] call SunriseClient_gui_BottomNotification;
	[[_vid,steamid,_price,life_garage_type,_vehicle,player,GVAR_RNAME(player)],"vehicleSell"] call SunriseClient_system_hcExec;
} else {
	["Продажа отменена", "error"] call SunriseClient_gui_BottomNotification;
};

life_action_delay = time;
closeDialog 0;