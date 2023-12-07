#include "..\..\script_macros.hpp"

private ["_header","_line","_sender","_display","_textHeader","_textLine","_textLinePos","_textClock","_robType","_temp"];

params [
	["_robType","",[""]]
];

if (_robType isEqualTo "") exitWith {};
_header = "";
_line = "";
_sender = "";


switch (_robType) do {
	case "Fed": {
		_header = "美联储抢劫案";
		_line = "美联储被抢！警方已敦促所有平民撤离该地区，否则将被拘留!";
		_sender = "AAN与KSP合作";
	};
	case "Bank": {
		_header = "银行劫案";
		_line = "银行被抢了！警方在回应此事时敦促大家保持冷静，任何平民都必须撤离该地区，因为警方将设置一个警戒线，并拘留任何靠近的人";
		_sender = "The AAN, in co-operation with the KSP";
	};
	case "Doc": {
		_header = "金丹监狱被攻击了!";
		_line = "证据储物柜被抢！ 警方在回应此事时一直敦促保持冷静，任何平民都应撤离该地区，因为警方将设置一个警戒线，并拘留任何靠近的人.";
		_sender = "The AAN, in co-operation with the KSP";
	};
	case "Casino": {
		_header = "赌场被抢劫!";
		_line = "警方在回应此事时敦促保持冷静，任何平民都应撤离赌场区域，因为警方将设置一个警戒线，并拘留任何靠近的人.";
		_sender = "The AAN, in co-operation with the KSP";
	};
	case "Ship": {
		_header = "军事数据泄露";
		_line = "军舰被围困，警方正在紧急处理此事.当警察逮捕船上的海盗时，所有平民都应保持镇定";
		_sender = "The AAN, in co-operation with the KSP";
	};
	case "DoD": {
		_header = "国防部数据泄露";
		_line = "国防部的雷达站遭到黑客攻击，警察正在紧急处理此事。 任何平民都应撤离该地区，因为警察将设置一个警戒线，并拘留任何靠近的人.";
		_sender = "The AAN, in co-operation with the KSP";
	};
	case "DoDHacked": {
		_header = "美联储被突破";
		_line = "国防部的雷达站被黑客入侵，美联储大门上的锁被打开。任何平民都要撤离这一地区，因为警察将设置一个警戒线并拘留任何靠近的人.";
		_sender = "The AAN, in co-operation with the KSP";
	};
	case "Milship": {
		_header = "美国海军被入侵/攻击";
		_line = "自由号航空母舰受到攻击，犯罪网络恐怖分子正在破坏物理数据库.";
		_sender = "The AAN, in co-operation with the KSP and the US Navy";
	};
	case "ArtGallery": {
		_header = "哈德斯维尔美术馆";
		_line = "美术馆被犯罪分子抢劫了，请离远一点，让KSP保护美术作品.";
		_sender = "The AAN, in co-operation with the KSP and the Kamdan Art Corporation";
	};
};
disableSerialization;
_temp = profileNamespace getVariable ["life_enableNewsBroadcast",true];

if (!_temp) exitWith {};

30 cutRsc ["rscAAN","plain"];
_display = uiNamespace getVariable "BIS_AAN";
_textHeader = _display displayCtrl 3001;
_textHeader ctrlSetStructuredText parseText format ["<t size='2'>%1</t><br/>广播者: %2",_header,_sender];
_textHeader ctrlCommit 0;

_textLine = _display displayCtrl 3002;
_textLine ctrlSetStructuredText parseText format ["                             %1                             %1                             %1                             %1",_line];
_textLine ctrlCommit 0;
_textLinePos = ctrlPosition _textLine;
_textLinePos set [0,-100];
_textLine ctrlSetPosition _textLinePos;
_textLine ctrlCommit 1500;

_textClock = _display displayctrl 3003;
_textClock ctrlSetText ([daytime,"HH:MM"] call bis_fnc_timetostring);
_textClock ctrlCommit 0;

sleep 30;
30 cutText ["","plain"];
