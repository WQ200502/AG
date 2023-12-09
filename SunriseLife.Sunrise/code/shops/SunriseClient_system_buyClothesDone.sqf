/*
	
	Filename: 	SunriseClient_system_buyClothesDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
(_this select 0) params ["_uniform","_hat","_glasses","_vest","_backpack"]; //Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)

_price = 0;

//Check uniform purchase.
if (count _uniform > 0) then {
	if ([(_uniform select 0)] call SunriseClient_system_addItem) then {
		_price = _price + (_uniform select 1);
	};
};

//Check hat
if (count _hat > 0) then {
	if ([(_hat select 0)] call SunriseClient_system_addItem) then {
		_price = _price + (_hat select 1);
	};
};

//Check glasses
if (count _glasses > 0) then {
	if ([(_glasses select 0)] call SunriseClient_system_addItem) then {
		_price = _price + (_glasses select 1);
	};
};

//Check Vest
if (count _vest > 0) then {
	if ([(_vest select 0)] call SunriseClient_system_addItem) then {
		_price = _price + (_vest select 1);
	};
};

//Check Backpack
if (count _backpack > 0) then {
	if ([(_backpack select 0)] call SunriseClient_system_addItem) then {
		_price = _price + (_backpack select 1);
	};
};

life_clothing_purchase = [[],[],[],[],[]];

["cash","take",_price] call SunriseClient_system_myCash;
player say3D "caching";
[format["Вы купили снаряжения на $%1",[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_system_hint;
[] call SunriseClient_system_saveGear;
closeDialog 0;