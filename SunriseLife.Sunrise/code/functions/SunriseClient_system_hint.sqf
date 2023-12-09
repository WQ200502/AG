/*

	Filename: 	SunriseClient_system_hint.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
params [
	["_message","",[""]],
	["_type","info",[""]]
];

private _img = switch (_type) do {
	case "info": {"info.paa"};
	case "warning": {"warning.paa"};
	case "news": {"news.paa"};
	case "done": {"done.paa"};
	case "error": {"error.paa"};
	case "money": {"money.paa"};
	case "police": {"police.paa"};
};

private _send = "";

if !(EQUAL(_img,"")) then {
	_send = _send + format["<br/><img size='7' shadow='0' image='\sunrise_pack\icons\messages\%1'/><br/><br/>",_img];
};

_send = _send + format["<t align='left' size='1.2' shadow='2'>%1</t>",_message];

hint parseText _send;
playSound "defaultNotification";