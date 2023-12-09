/*

	Filename: 	SunriseClient_pmenu_addCallLog.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_name","",[""]],
	["_msg","",[""]],
	["_pos",[],[[]]]
];

if !(player diarySubjectExists "911cals") then {player createDiarySubject ["911cals","Вызовы"]};

player createDiaryRecord ["911cals",
	[
		_name,
		format["<font color='#e20000'>Сообщение: </font>%1<br/><br/><execute expression=""((findDisplay 12) displayCtrl 51) ctrlMapAnimAdd[1,0.05,%2]; ctrlMapAnimCommit ((findDisplay 12) displayCtrl 51);"">[Запеленговать]</execute>",_msg,_pos]
	]
];