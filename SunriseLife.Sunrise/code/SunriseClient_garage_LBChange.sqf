/*

	Filename: 	SunriseClient_garage_LBChange.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
params ["_control","_index"];
private _dataArr = _control lbData _index;
_dataArr = call compile format["%1",_dataArr];

_dataArr params ["_className","_vehicleColorId","_vehicleMaterialId","_spName","_insurance","_basePrice","_serverMap","_parking"];

_spName = LIFE_GTITLE(worldName,_spName);
private _vehicleColor = if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _vehicleColorId)) then {M_CONFIG(getText,"LifeCfgVehTextures",_vehicleColorId,"displayName")} else {"Стандарт"};
private _vehicleMaterial = if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _vehicleMaterialId)) then {M_CONFIG(getText,"LifeCfgVehMaterials",_vehicleMaterialId,"displayName")} else {"Стандарт"};
private _vehicleInfo = [_className] call SunriseClient_system_fetchVehInfo;
private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

private ["_sellPrice","_retrievePrice"];
if (EQUAL(_basePrice,0)) then {
	_sellPrice = 0;
	_retrievePrice = 0;
} else {
	_sellPrice = round (_basePrice - (_basePrice*0.3));
	_retrievePrice = round (_basePrice * 0.02);
};

if (life_copDuty OR life_medDuty OR life_garage_isHouse OR (_retrievePrice <= 0)) then {_retrievePrice = 500};
if (_sellPrice <= 0) then {ctrlEnable[2813,false]} else {ctrlEnable[2813,true]};

if (EQUAL(_parking,[])) then {
	(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
	"<br/><t color='#ffffff'>
		Название: <t color='#ff9a03'>%3</t><br />
		<br />
		Максимальная скорость: <t color='#ff9a03'>%8</t> км/ч<br/>
		Мощность: <t color='#ff9a03'>%9</t><br/>
		Пассажирских мест: <t color='#ff9a03'>%11</t><br/>
		Вместимость (Ресурсов): <t color='#ff9a03'>%10</t><br/>
		<br />
		Цвет: <t color='#ff9a03'>%4</t><br/>
		Материал: <t color='#ff9a03'>%5</t><br/>
		<br/>
		Гараж: <t color='#ff9a03'>%7</t><br/>
		Остров: <t color='#ff9a03'>%6</t><br/>
		<br/>
		Цена выдачи: <t color='#ff9a03'>%1 $</t><br/>
		Цена продажи: <t color='#ff9a03'>%2 $</t><br/>
		</t>",
		[_retrievePrice] call SunriseClient_system_numberText,
		[_sellPrice] call SunriseClient_system_numberText,
		_vehicleInfo select 3,
		_vehicleColor,
		_vehicleMaterial,
		_serverMap,
		_spName,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_trunkSpace,
		_vehicleInfo select 10
	];
	if (_insurance isEqualTo 1) then {
		ctrlShow[2812,false];
		ctrlShow[2813,false];
		ctrlShow[2814,true];
	} else {
		ctrlShow[2812,true];
		ctrlShow[2813,true];
		ctrlShow[2814,false];

		if !(EQUAL(_serverMap,worldName)) then {
			ctrlEnable[2812,false];
		} else {
			ctrlEnable[2812,true];
		};
	};
} else {
	(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
		"<t size='0.95' color='%3'>Техника на штрафстоянке!<br/><br/>Сумма штрафа: $%1<br/>Примечание: %2</t>",
		[_parking select 0] call SunriseClient_system_numberText,
		_parking select 1,
		GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
	];
	ctrlShow[2812,false];
	ctrlShow[2813,false];
	ctrlShow[2814,false];
};

ctrlShow [2803,true];