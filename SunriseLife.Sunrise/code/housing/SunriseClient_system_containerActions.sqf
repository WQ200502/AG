/*

	Filename: 	SunriseClient_system_containerActions.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _box = param [0,objNull,[objNull]];
if (isNull _box) exitWith {};

_box addAction ["<img image='\sunrise_pack\icons\ui\s_icon_box.paa' /> Хранилище снаряжения",SunriseClient_system_containerMenu,"",0,false,false,"",'isNull objectParent _this', 4];
_box addAction ["<img image='\sunrise_pack\icons\ui\s_icon_box.paa' /> Хранилище ресурсов",SunriseClient_system_openInventory,"",0,false,false,"",'isNull objectParent _this', 4];