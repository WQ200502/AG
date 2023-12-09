/*

	Filename: 	SunriseClient_warzones_message.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(life_inwarzone) exitWith {};
params [ ["_messageID","",[""]], ["_comment","",["",0]] ];

private _title = "<t size='2' color='#ff4000'>BattleGround</t><br/><br/>";
private _message = switch (_messageID) do {
	case "vehOpened" : {"<t size='1' color='#ffffff'>Боеприпасы извлечены из обломков техники!</t>"}; 
	case "boxChargePlaced" : {format["<t size='1' color='#ffffff'>На боеприпасы установлен заряд с таймером на %1 минут!</t>",_comment]};
	case "boxOpened" : {"<t size='1' color='#ffffff'>Заряд взорвется через пару секунд! Не стойте рядом!</t>"};
	case "priceTaked" : {format["<t size='1' color='#ffffff'>Группировка %1 захватила содержимое боеприпасов. Поздравляем!</t>",_comment]};
	default {}; 
};

if (EQUAL(_message,"")) exitWith {};
titleText["","PLAIN"];
[_title + _message,0,0.05,5,0,0,1488] spawn BIS_fnc_dynamicText;
playSound "defaultNotification";