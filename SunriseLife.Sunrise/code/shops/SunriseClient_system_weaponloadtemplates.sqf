/*

	Filename: 	SunriseClient_system_weaponLoadTemplates.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogWeaponShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogWeaponShop isNull" call SunriseClient_system_log};
private _selection = (lbCurSel 38418);
if (EQUAL(_selection,-1)) exitWith {};
//Определение переменных
private _BasketTitle = _display displayCtrl 38411;
private _BasketTotal = _display displayCtrl 602;
private _basketList =  _display displayCtrl 38412;
private _BasketButtonBuy = _display displayCtrl 38413;
private _BasketCount = _display displayCtrl 38414;
private _BasketButtonDelete = _display displayCtrl 38415;
private _BasketBG = _display displayCtrl 38426;
private _templatesList = _display displayCtrl 38418;
private _lbData = CONTROL_DATAI(_templatesList,_selection);
private _dataName = CONTROL_TEXTI(_templatesList,_selection);
private _indexData = CONTROL_VALUEI(_templatesList,_selection);
if (EQUAL(_indexData,-1)) exitWith {};
private _basketData = (parseSimpleArray _lbData);
private _shop = GVAR_UINS ["Weapon_Shop",""];
private _newCat = [];
private _magazinArray = [];
private _magPriceArray = [];
private _totalPrice = 0;
//Чистим список корзины
lbClear _basketList;
//Запускаем фильтрацию,проверку и перепаковку
{
	_x params ["_className","_count","_isMag"];
	//Чекаем конфиге и аддонах на наличие итема
	if ([_className] call SunriseClient_system_isAddonsConfigCheck) then {
		_itemInfo = [_className] call SunriseClient_system_itemDetails;
	    //Если не обойма то берем кфг оружия
        if !(_isMag) then {
		    {
				_x params ["_class","_del","_conditions","_conditionsMsg","_show"];
			    //подбираем нужный итем
		        if (_class isEqualTo _className) then {
				    //выдергиваем с кфг цену итема
					_price = M_CONFIG(getNumber,"LifeCfgItems",_className,"price");
					//Чекаем наличие доступа к итему
					if (_price > 0 && ([_conditions] call SunriseClient_system_conditionsCheck)) then {
					    //Пересчитываем цену на итем 
					    _price = round (_price / _del);
					    if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
					    _price = (_price * _count);// умнажаем на колво придметов
					    //Добовляем в спсиок корзины
					    private _index = _basketList lbAdd format["[x%1] - %2",_count,_itemInfo select 1];
					    _basketList lbSetData [_index,_class];
					    _basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
					    _BasketList lbSetValue [_index, _price];
					    _basketList lbSetPicture [_index,_itemInfo select 2];
					    //Проталкиваем в массив корзины и подсчитоваем общую сумму
					    _newCat pushBack [_class,_count,_price,_itemInfo select 1,_isMag];
					    _totalPrice = (_totalPrice + _price);
						if (count (_itemInfo select 7) > 0) then {
						    {
								if (isClass(missionConfigFile >> "LifeCfgItems" >> _x)) then {
				                    if !([M_CONFIG(getText,"LifeCfgItems",_x,"conditions")] call SunriseClient_system_conditionsCheck) exitWith {};
				                    _magPrice = round (M_CONFIG(getNumber,"LifeCfgItems",_x,"price") / _del);
				                    if (_magPrice > 0) then {
					                    if (FETCH_CONST(life_donator) > 0) then {_magPrice = [_magPrice] call SunriseClient_system_discount};
										//записоваем патроны с оружия и цены (с учотом делителея) в отдельный массив что бы разабрать по правельной расценке
										_magPriceArray pushBack [_x,_magPrice];
								    };
								};
						    } forEach (_itemInfo select 7);
					    };
			        };
			    };
		    } forEach (M_CONFIG(getArray,"LifeCfgWeaponShops",_shop,"items"));//Данные с кфг магазина
		} else {
		    if (isClass(missionConfigFile >> "LifeCfgItems" >> _className) && {[M_CONFIG(getText,"LifeCfgItems",_className,"conditions")] call SunriseClient_system_conditionsCheck}) then {
			    _magazinArray pushBack _x;
				//это нашы сахраненые обоймы с шаблона
			};
	    };
	};
} forEach _basketData;//Данные с сах. шаблона

//Теперь разбираем цены на обоймы и заполняем спиоск
{
    _x params ["_className","_count","_isMag"];
	_itemInfo = [_className] call SunriseClient_system_itemDetails;
	private _price = 0;
	{
	    _x params ["_class","_magPrice"];
		//вот наша радимая, цена с делителем как в оригинале
		if (_class isEqualTo _className) then {
			_price = (_magPrice * _count);// умнажаем на колво придметов
			private _index = _basketList lbAdd format["[x%1] - %2",_count,_itemInfo select 1];
			_basketList lbSetData [_index,_className];
			_basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
			_basketList lbSetValue [_index, _price];
			_basketList lbSetPicture [_index,_itemInfo select 2];
			_totalPrice = (_totalPrice + _price);
			_newCat pushBack [_className,_count,_price,_itemInfo select 1,_isMag];
		};
    } forEach _magPriceArray;
	//Вслучии если таки не нашли коректную цену на наш патрон то берём стандарт цену + скидка на вип
	if (_price isEqualTo 0) then {
	    _magPrice = M_CONFIG(getNumber,"LifeCfgItems",_className,"price");
		if (FETCH_CONST(life_donator) > 0) then {_magPrice = [_magPrice] call SunriseClient_system_discount};
		_price = (_magPrice * _count);// умнажаем на колво придметов
		private _index = _basketList lbAdd format["[x%1] - %2",_count,_itemInfo select 1];
		_basketList lbSetData [_index,_className];
		_basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
		_basketList lbSetValue [_index, _price];
		_basketList lbSetPicture [_index,_itemInfo select 2];
		_totalPrice = (_totalPrice + _price);
		_newCat pushBack [_className,_count,_price,_itemInfo select 1,_isMag];
	};
} forEach _magazinArray;

SVAR_UINS ["Weapon_Shop_Cat",_newCat];
SVAR_UINS ["Weapon_Shop_Total",_totalPrice];

/* //Выдергиваем данные о шаблонах с магазина для обновления масива шаблона
private _VAR = format["Weapon_Shop_Templates_%1",_shop];
private _templatesData = GVAR_PRNS [_VAR,[]];
//перезаписоваем массив шаблона убрав лишние данные
private _newTemplate = _newCat apply {[_x select 0, _x select 1,_x select 4]};
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
	FADEANIM(_BasketTitle,0.3)
	FADEANIM(_BasketTotal,0.3)
	FADEANIM(_BasketList,0.3)
	FADEANIM(_BasketButtonBuy,0.3)
	FADEANIM(_BasketCount,0.3)
	FADEANIM(_BasketButtonDelete,0.3)
	FADEANIM(_BasketBG,0.3)
};
