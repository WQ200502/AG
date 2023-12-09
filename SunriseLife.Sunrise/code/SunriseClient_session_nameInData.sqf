/*

	Filename: 	SunriseClient_session_nameInData.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_session_completed) exitWith {};
closeDialog 0;
hint parseText hint parseText "<t size='1.1'><t size='2'><t color='#f5be00'>Внимание!!!</t></t><br /><br />В вашем профиле указан ник, уже используемый на сервере!<br/><br/>Измените ваш ник в профиле!</t></t></t>";
0 cutText ["","BLACK FADED"];
0 cutFadeOut 9999999;
uiSleep 10;
endMission "NameAlreadyInBasa";