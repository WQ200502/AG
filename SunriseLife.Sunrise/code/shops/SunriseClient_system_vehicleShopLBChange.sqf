/*
	
	Filename: 	SunriseClient_system_vehicleShopLBChange.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		

*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]	
];
if (isNull _control OR EQUAL(_index,-1)) exitWith {}; //Bad data
private _className = CONTROL_DATAI(_control,_index);

private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price") * M_CONFIG(getNumber,"LifeCfgVehShops",(life_veh_shop select 0),"multiplier");
if (FETCH_CONST(life_donator) > 0) then {_basePrice = [_basePrice] call SunriseClient_system_discount};

private _vehicleInfo = [_className] call SunriseClient_system_fetchVehInfo;
private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");
private _available = (["<t color='#3f6b00'>Есть</t>", format["<t color='#ff0000'>%1</t>",_conditionsMsg]] select !([_conditions] call SunriseClient_system_conditionsCheck));

(CONTROL(2300,2303)) ctrlSetStructuredText parseText format["<t size='0.9' color='%10'>" + 
	(localize "STR_Shop_Veh_UI_Ownership") + " <t color='#3f6b00'>$%1</t><br/>" +
	(localize "STR_Shop_Veh_UI_Rental") + " <t color='#3f6b00'>$%2</t><br/>" +
	"Доступ:" + " %3<br/>" +
	(localize "STR_Shop_Veh_UI_MaxSpeed") + " %4 km/h<br/>" +
	(localize "STR_Shop_Veh_UI_HPower") + " %5<br/>" +
	(localize "STR_Shop_Veh_UI_PSeats") + " %6<br/>" +
	(localize "STR_Shop_Veh_UI_Trunk") + " %7<br/>" +
	(localize "STR_Shop_Veh_UI_Fuel") + " %8<br/>" +
	(localize "STR_Shop_Veh_UI_Armor") + " %9</t>",
	[_basePrice] call SunriseClient_system_numberText,
	[round(_basePrice * 0.5)] call SunriseClient_system_numberText,
	_available,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	_trunkSpace,
	_vehicleInfo select 12,
	_vehicleInfo select 9,
	GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
];

private _colorCtrl = CONTROL(2300,2304);
lbClear _colorCtrl;
/*_colorCtrl lbAdd "Стандартный";
_colorCtrl lbSetData [(lbSize _colorCtrl)-1,""];*/
{
	if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _x select 0)) then {
		if ((life_veh_shop select 2) in (_x select 1)) then {
			_colorCtrl lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehTextures",_x select 0,"displayName")];
			_colorCtrl lbSetData [(lbSize _colorCtrl)-1,_x select 0];
			_colorCtrl lbSetPicture [(lbSize _colorCtrl)-1,(M_CONFIG(getArray,"LifeCfgVehTextures",_x select 0,"texture")) select 0];
			if !([_x select 2] call SunriseClient_system_conditionsCheck) then {
				_colorCtrl lbSetPictureRight [(lbSize _colorCtrl)-1, "\sunrise_pack\icons\messages\error.paa"];
				_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,0];
			} else {
				_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,1];
			};
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehicles",_className,"textures"));

private _materialCtrl = CONTROL(2300,2305);
lbClear _materialCtrl;
/*_materialCtrl lbAdd "Стандартный";
_materialCtrl lbSetData [(lbSize _materialCtrl)-1,""];*/
{
	if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _x)) then {
		_materialCtrl lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehMaterials",_x,"displayName")];
		_materialCtrl lbSetData [(lbSize _materialCtrl)-1,_x];
		if !([M_CONFIG(getText,"LifeCfgVehMaterials",_x,"conditions")] call SunriseClient_system_conditionsCheck) then {
			_materialCtrl lbSetPictureRight [(lbSize _materialCtrl)-1, "\sunrise_pack\icons\messages\error.paa"];
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,0];
		} else {
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,1];
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehicles",_className,"materials"));

/*private _boxCtrl = CONTROL(2300,2317);
lbClear _boxCtrl;
_boxCtrl lbAdd "Не добавлять контейнеры";
_boxCtrl lbSetValue [(lbSize _boxCtrl)-1,0];
for "_i" from 1 to (M_CONFIG(getNumber,"LifeCfgVehicles",_className,"maxContainers")) do {
	_boxCtrl lbAdd format["Добавить %1 контейнеров (+%2 к багажнику)",_i,(_i * 100)];
	_boxCtrl lbSetValue [(lbSize _boxCtrl)-1,_i];
};*/

lbSetCurSel[2304,0];
lbSetCurSel[2305,0];
//lbSetCurSel[2317,0];

ctrlEnable [2304,lbSize _colorCtrl != 1];  
ctrlEnable [2305,lbSize _materialCtrl != 1];  
//ctrlEnable [2317,lbSize _boxCtrl != 1];

[_className,CONTROL_DATA(2304),CONTROL_DATA(2305)] call SunriseClient_system_shopBoxUpdate;

if (_className in (LIFE_SETTINGS(getArray,"life_vShop_rentalOnly"))) then {
	private _conditions = LIFE_SETTINGS(getText,"life_vShop_rentalCondition");
	if !([_conditions] call SunriseClient_system_conditionsCheck) then {
		ctrlEnable [2309,false];
	};
} else {
	if !(life_veh_shop select 3) then {
		ctrlEnable [2309,true];
	};
};

true;