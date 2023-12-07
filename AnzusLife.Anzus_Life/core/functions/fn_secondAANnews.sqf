#include "..\..\script_macros.hpp"

private ["_header","_line","_sender","_display","_textHeader","_textLine","_textLinePos","_textClock","_robType","_temp"];

params [
	["_cityName","",[""]],
	["_robType","",[""]]
];

if (_robType isEqualTo "") exitWith {};
_header = "";
_line = "";
_sender = "";


switch (_robType) do {
	case "com": {
		_header = format ["英联邦银行 %1", _cityName];
		_line = format ["英联邦银行 %1 被抢劫!. 警方在对此事作出反应时敦促他们保持冷静。, 任何平民都应撤离该地区，因为警察将视为罪犯 将会把你击毙", _cityName];
		_sender = "The AAN, in co-operation with the KSP";
	};
	case "kam": {
		_header = "Kamdan Central Bank Robbery";
		_line = format ["银行 %1 被抢劫!. 警方在对此事作出反应时敦促他们保持冷静, 任何平民都应撤离该地区，因为警察将视为罪犯 将会把你击毙", _cityName];
		_sender = "The AAN, in co-operation with the KSP";
	};
};
disableSerialization;
_temp = profileNamespace getVariable ["life_enableNewsBroadcast",true];

if (!_temp) exitWith {};

30 cutRsc ["rscAAN","plain"];
_display = uiNamespace getVariable "BIS_AAN";
_textHeader = _display displayCtrl 3001;
_textHeader ctrlSetStructuredText parseText format ["<t size='2'>%1</t><br/>Broadcasted by: %2",_header,_sender];
_textHeader ctrlCommit 0;

_textLine = _display displayCtrl 3002;
_textLine ctrlSetStructuredText parseText format ["                         %1                         %1                         %1                         %1",_line];
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
