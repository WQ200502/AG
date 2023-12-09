/*

	Filename: 	SunriseClient_system_weaponLoadTemplates.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogClothingShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogClothingShop isNull" call SunriseClient_system_log};
private _selection = (lbCurSel 3114);
if (EQUAL(_selection,-1)) exitWith {};
//Определение переменных
private _BasketTitle = _display displayCtrl 3107;
private _BasketTotal = _display displayCtrl 602;
private _basketList =  _display displayCtrl 3108;
private _BasketButtonBuy = _display displayCtrl 3109;
private _BasketCount = _display displayCtrl 3110;
private _BasketButtonDelete = _display displayCtrl 3111;
private _BasketBG = _display displayCtrl 3123;
private _templatesList = _display displayCtrl 3114;
private _data = CONTROL_DATAI(_templatesList,_selection);
private _indexData = CONTROL_VALUEI(_templatesList,_selection);
private _dataName = CONTROL_TEXTI(_templatesList,_selection);
private _basketData = (parseSimpleArray _data);
private _shop = VAR(ClothingStore);
private _newCat = [];
private _config = [];
private _dont = false;
private _totalPrice = 0;
//Чистим список корзины
lbClear _basketList;
//Запускаем фильтрацию,проверку и перепаковку
{
    _x params ["_className","_count"];
    {
	    _x params ["_config","_uniformType"];
		{
			_x params [
		        ["_class","",[""]],
		        ["_display","",[""]],
		        ["_price",0,[0]],
		        ["_conditions","",[""]],
		        ["_conditionsMsg","",[""]],
		        ["_show","",[""]]
	        ];
		    //подбираем нужный итем
			private _itemInfo = [_class] call SunriseClient_system_itemDetails;
	        if !(EQUAL(_itemInfo,[])) then {
    		    if (_class isEqualTo _className) exitWith {
				    //Чекаем наличие доступа к итему
	    		    if ([_conditions] call SunriseClient_system_conditionsCheck) then {
			            private _itemName = [_display, _itemInfo select 1] select (_display isEqualTo "");
			            if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
			            _price = (_price * _count);// умнажаем на колво придметов
			            //Добовляем в спсиок корзины
			            private _index = _basketList lbAdd format["[x%1] - %2",_count,_itemName];
			            _basketList lbSetData [_index,_class];
			            _basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
			            _basketList lbSetValue [_index, _price];
			            _basketList lbSetPicture [_index,_itemInfo select 2];
			            //Проталкиваем в массив корзины
			            _newCat pushBack [_class,_count,_price,_itemName];
			            _totalPrice = (_totalPrice + _price);
			            switch (_uniformType) do {
                            case 0: {removeUniform ShopBoxVehicle; ShopBoxVehicle forceAddUniform _class};
                            case 1: {removeHeadGear ShopBoxVehicle; ShopBoxVehicle addHeadgear _class};
                            case 2: {removeGoggles ShopBoxVehicle; ShopBoxVehicle addGoggles _class};
                            case 3: {removeVest ShopBoxVehicle; ShopBoxVehicle addVest _class};
                            case 4: {removeBackpack ShopBoxVehicle; ShopBoxVehicle addBackpack _class; VAR(ClothingBackPackCount) = true};
                        };
				    } else {
				        _dont = true;
			        }; 
			    };
			} else {
			    format["Нету в аддонах [LifeCfgClothShops select %2] [classname %1]",_class,_uniformType] call SunriseClient_system_log;
			};
	    } forEach _config
	} forEach [
		[M_CONFIG(getArray,"LifeCfgClothShops",_shop,"uniforms"),0],
        [M_CONFIG(getArray,"LifeCfgClothShops",_shop,"headgear"),1],
        [M_CONFIG(getArray,"LifeCfgClothShops",_shop,"goggles"),2],
        [M_CONFIG(getArray,"LifeCfgClothShops",_shop,"vests"),3],
        [M_CONFIG(getArray,"LifeCfgClothShops",_shop,"backpacks"),4]
    ];
} forEach _basketData;//Данные с сах. шаблона

VAR(ClothingCat) = _newCat;
VAR(ClothingTotal) = _totalPrice;

 if (EQUAL(_newCat,[]) OR _dont) then {
    titleText ["Доступ к этим вешам больше нету!","PLAIN"];
 };

/* //Выдергиваем данные о шаблонах с магазина для обновления масива шаблона
private _VAR = format["Clothing_Shop_Templates_%1",_shop];
private _templatesData = GVAR_PRNS [_VAR,[]];
//перезаписоваем массив шаблона убрав лишние данные
private _newTemplate = _newCat apply {[_x select 0, _x select 1]};
//перезаписоваем данные в дисплее
_templatesList lbSetData [_selection,str(_newTemplate)];
//Перезаписоваем данные в масиве шаблонов
_templatesData set [_indexData,[_dataName,_newTemplate]];
SVAR_PRNS [_VAR,_templatesData];//Сейвим профиль */

if !(ctrlShown _BasketTitle) then {
    _BasketTitle ctrlShow true;
	_BasketTotal ctrlShow true;
    _BasketList ctrlShow true;
    _BasketButtonBuy ctrlShow true;
    _BasketCount ctrlShow true;
    _BasketButtonDelete ctrlShow true;
    _BasketBG ctrlShow true;
	FADEANIM(_BasketTitle,0.4)
	FADEANIM(_BasketTotal,0.4)
	FADEANIM(_BasketList,0.4)
	FADEANIM(_BasketButtonBuy,0.4)
	FADEANIM(_BasketCount,0.4)
	FADEANIM(_BasketButtonDelete,0.4)
	FADEANIM(_BasketBG,0.4)
};
