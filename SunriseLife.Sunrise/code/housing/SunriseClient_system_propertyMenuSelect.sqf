/*

	Filename: 	SunriseClient_system_propertyMenuSelect.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_houses isEqualTo []) exitWith {};
disableSerialization;
private _addSlotBtn = CONTROL(4370,2705);
private _lightBtn = CONTROL(4370,2704);
private _securityBtn = CONTROL(4370,2706);
private _rentBtn = CONTROL(4370,2708);
private _sellBtn = CONTROL(4370,2709);
private _houseInfo = CONTROL(4370,2703);

private _house = life_houses select (call compile format["%1", CONTROL_DATA(2702)]);
if (_house isEqualTo []) exitWith {
	life_curHouseSel = objNull;
	_houseInfo ctrlSetStructuredText parseText "";
	_addSlotBtn ctrlEnable false;
	_lightBtn ctrlEnable false;
	_securityBtn ctrlEnable false;
	_rentBtn ctrlEnable false;
	_sellBtn ctrlEnable false;
};
life_curHouseSel = nearestObject _house;
_house = life_curHouseSel;

private _expires = _house getVariable ["house_expires",[0,0,0]];
_expires = format ["%1-%2-%3", _expires select 2,_expires select 1,_expires select 0];
private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");
private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
private _sellPrice = round(_price / 3);

_rentBtn ctrlEnable true;
_sellBtn ctrlEnable true;
if !(_numberCrates isEqualTo 0) then {
	_lockedTxt = if (_house getVariable ["locked",false]) then {"закрыто"} else {"открыто"};
	private "_rentPrice";
	_securityTxt = if (_house getVariable ["house_security",false]) then {_rentPrice = round(_price * 0.4);_securityBtn ctrlEnable false;"есть"} else {_rentPrice = round(_price * 0.35);_securityBtn ctrlEnable true;"нет"};
	_lightTxt = if (isNull (_house getVariable ["lightSource",ObjNull])) then {"выключен"} else {"включен"};
	_lightBtn ctrlEnable true;
	_house_box = _house getVariable["house_box",objNull];
	_house_box_slots = _house_box getVariable ["house_box_slots",0];
	if (!isNull _house_box AND {_house_box_slots < _numberCrates}) then {_addSlotBtn ctrlEnable true} else {_addSlotBtn ctrlEnable false};
	_houseInfo ctrlSetStructuredText parseText format [
	"<t color='%1'>Хранилище %2<br/>
	Свет %3<br/>
	Макс. слотов %4<br/>
	Сигнализация: %5 <br/>
	Оплачен до %6<br/>
	Цена ЖКХ за 1 мес. $%7<br/>
	Цена продажи $%8<br/></t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000'],_lockedTxt,_lightTxt,_numberCrates,_securityTxt,_expires,[_rentPrice] call SunriseClient_system_numberText,[_sellPrice] call SunriseClient_system_numberText];

} else {
	_addSlotBtn ctrlEnable false;
	_securityBtn ctrlEnable false;
	_lightBtn ctrlEnable false;
	_houseInfo ctrlSetStructuredText parseText format [
	"<t color='%1'>Оплачен до %2<br/>
	Цена ЖКХ за 1 мес. $%3<br/>
	Цена продажи $%4<br/>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000'],_expires,[round(_price * 0.3)] call SunriseClient_system_numberText,[_sellPrice] call SunriseClient_system_numberText];
};