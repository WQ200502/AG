/*
	
	Filename: 	SunriseClient_session_banned.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_datatime","_reason","_adminName"];
disableSerialization;
(findDisplay 46) displaySetEventHandler ["KeyDown","if ((_this select 1) == 1) then {true}"]; //Block the ESC menu

0 cutText ["","BLACK FADED"];
0 cutFadeOut 9999999;
player hideObjectGlobal true;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";
0 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;
closeDialog 0;

hintSilent parseText format["
<t size='1.1'><t size='2.5'><t color='#f5be00'>Внимание!!!</t></t><br /><br />
<t size='1.2'>Вас депортировали с острова Sunrise за нарушение правил острова!<br/><br/>
Вас депортровал:<t size='1.3'><t color='#1dae0e'> %1 </t></t><br/>
Причина:<t size='1.3'><t color='#1dae0e'> %2 </t></t><br/>
Сроком до:<t size='1.3'><t color='#1dae0e'> %3 </t></t><br/><br/>
Если у вас возникнут вопросы - обратитесь на форум <t size='1.3'><t color='#665bff'>sunriserp.ru</t></t><br/>
Или группу ВК <br/><t size='1.3'><t color='#665bff'>vk.com/sunrise_altislife</t></t>",_adminName,_reason,_datatime];

uiSleep 15;
endMission "Banned";
