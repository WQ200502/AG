/*

	Filename: 	SunriseClient_system_welcomeNotification.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
uiSleep 5;

hintSilent parseText format[
"<t size='1.2'>欢迎来到Sunrise Life服务器, <t color='#f5be00'>%1</t></t>
<br /><br />别忘了在我们的QQ群上学习规则 <t underline='true' color='#1dae0e'>sunriserp.ru</t>
<br /><br />您可以在我们的网站上获得有关连接、管理和捐赠的所有必要信息。: <t underline='true' color='#1dae0e'>sunriserp.ru</t>
<br /><br />附加信息也可通过地图上的点获得[按钮 M]",
GVAR_RNAME(player)];

private _onScreenTime = 5;

uiSleep 15;

private _role1 = "服务器的当前版本";
private _role1names = ["Sunrise Life v5.0"];//версия
private _role2 = "开发商";
private _role2names = ["LA"];
private _role3 = "管理员";
private _role3names = ["待定", "待定"];
private _role5 = "服主";
private _role5names = ["YuGe"];
private _role6 = "TS3频道";
private _role6names = ["AGLIFE密码：123123"];

private "_finalText";
{
	uiSleep 2;
	_finalText = format ["<t font='PuristaBold' size='1.8'>%1<br /></t>", _x select 0];
	_finalText = _finalText + "<t size='1.4' color='#FFFFFF'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach (_x select 1);
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count (_x select 1)) - 1) * 0.5);
	[parseText _finalText,[0.6,0.6,1,1], nil, 7, 1, 0] spawn BIS_fnc_textTiles;
	uiSleep (_onScreenTime);
} forEach [
	/*[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],*/
	[_role5, _role5names],
	[_role6, _role6names]
];
/*
	_finalText = format ["<t font='PuristaBold' size='1.8'>%1<br /></t>", _x select 0];
	_finalText = _finalText + "<t size='1.4' color='#FFFFFF'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach (_x select 1);
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count (_x select 1)) - 1) * 0.5);
	[parseText _finalText,[0.6,0.6,1,1], nil, 7, 1, 0] spawn BIS_fnc_textTiles;
*/