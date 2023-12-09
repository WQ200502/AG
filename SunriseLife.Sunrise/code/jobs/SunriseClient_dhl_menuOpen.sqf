/*

	Filename: 	SunriseClient_dhl_menuOpen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !("dhl" call SunriseClient_jobs_clothCheck) exitWith {[localize "STR_DHL_CheckError","error"] call SunriseClient_gui_bottomNotification};
if (life_copDuty OR life_medDuty) exitWith {["Работа в DHL доступна только гражданам","error"] call SunriseClient_gui_bottomNotification};
private _spawnPointPos = getMarkerPos (LIFE_SETTINGS(getText,"life_dhl_office_spawn"));
if (life_dhl_vehicle distance _spawnPointPos < 30) exitWith {["Покиньте точку выдачи!","error"] call SunriseClient_gui_bottomNotification};

disableSerialization;
createDialog "SunriseDialogDhl";
waitUntil {!isNull (findDisplay 5800)};

private _dpPoints = LIFE_SETTINGSWORLD(getArray,worldName,"life_dp_points");

private _info = CONTROL(5800,5801);
private _startPoint = CONTROL(5800,5802);
private _finishPoint = CONTROL(5800,5803);

_info ctrlSetStructuredText parseText format ["<t size='0.9' color='%1'>Выберите начальную и конечную точку доставки заказа.<br/>Снизу вам отобразится сумма, которую вы получите за доставку посылки.</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

lbClear _startPoint;
lbClear _finishPoint;

private "_dp";
{
	_dp = [_x,"_"," "] call SunriseClient_kron_Replace;
	_startPoint lbAdd format ["%1",toUpper(_dp)];
	_startPoint lbSetData [(lbSize _startPoint)-1,_x];
	_finishPoint lbAdd format ["%1",toUpper(_dp)];
	_finishPoint lbSetData [(lbSize _finishPoint)-1,_x];
} forEach _dpPoints;

_startPoint lbSetCurSel 0;
_finishPoint lbSetCurSel 1;