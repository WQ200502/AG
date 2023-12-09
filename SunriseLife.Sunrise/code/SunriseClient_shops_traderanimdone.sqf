/*

	Filename: 	SunriseClient_shops_traderanimdone.sqf
	Project: 	Sunrise Altis Life RPG

*/
#include "..\script_macros.hpp" 
private _trader = param [0,objNull,[objNull]];
private _animations = _trader GVAR ["TraderAnimations", []];
_trader switchMove (_animations select floor(random (count _animations)));
true