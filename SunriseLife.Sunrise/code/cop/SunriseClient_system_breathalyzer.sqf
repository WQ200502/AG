/*
	
	Filename: 	SunriseClient_system_breathalyzer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private["_cop","_drinky"];
_cop = param [0,ObjNull,[ObjNull]];
if (isNull _cop) exitWith {};
_drinky = life_drink;
if (_drinky > 0.07) then {
	[1,format["Анализ %1 \n\n 血液酒精水平 %2 \n\n 酒精含量超过正常水平",name player,[_drinky] call SunriseClient_system_numberText]] remoteExecCall ["SunriseClient_system_broadcast",_cop];
} else {
	[1,format["Анализ %1 \n\n 血液酒精水平: %2 \n\n 酒精含量超过正常水平",name player,[_drinky] call SunriseClient_system_numberText]] remoteExecCall ["SunriseClient_system_broadcast",_cop];
};