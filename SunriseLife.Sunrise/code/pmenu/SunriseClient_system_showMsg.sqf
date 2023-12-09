/*
	
	Filename: 	SunriseClient_system_showMsg.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _index = param [0,0,[0]];

disableSerialization;
private _display = findDisplay 88888;
private _cMessageList = _display displayCtrl 88882;
private _cMessageShow = _display displayCtrl 88887;
private _cMessageHeader = _display displayCtrl 88890;

_data = call compile (_cMessageList lnbData[_index,0]);

_status = "[ОФФЛАЙН]";
{
    if ((getPlayerUID _x) isEqualTo (_data select 0)) then
    {
        _status = "[В СЕТИ]";
        life_smartphoneTarget = _x;
        ctrlEnable[887892,true];
    };
}forEach playableUnits;

_cMessageHeader ctrlSetText format["%1 %2 написал:",_data select 1,_status];
_cMessageShow ctrlSetText format["%1",_data select 2];