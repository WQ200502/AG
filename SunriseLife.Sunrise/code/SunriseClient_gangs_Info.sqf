/*
	
	Filename: 	SunriseClient_gangs_Info.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _gangInfo = grpPlayer GVAR ["gang_info",[]];
private _gangInfoText = if (count _gangInfo > 1) then {
	format["Средние волны: %1<br />Длинные волны: %2<br /><br />Информация: %3",_gangInfo select 0,_gangInfo select 1, _gangInfo select 2];
} else {
	"Данные не указаны";
};

[format["<t size='1.6' color='#f5be00'>%1</t><br /><br />%2",GANG_NAME,_gangInfoText],"info"] spawn SunriseClient_system_hint;