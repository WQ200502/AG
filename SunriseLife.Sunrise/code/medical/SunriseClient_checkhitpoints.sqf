/*

	Filename: 	SunriseClient_checkhitpoints.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
[format["<t size='2' color='#ff8000' align='center'>健康状况:</t><br /><br /><t size='1.2' align='center'>Голова: %1%5<br />Тело: %2%5<br />Руки: %3%5<br />Ноги: %4%5<br /></t>",(((player getVariable ["player_stats",[1,1,1,1]]) select 0) * 100),(((player getVariable ["player_stats",[1,1,1,1]]) select 1) * 100),(((player getVariable ["player_stats",[1,1,1,1]]) select 2) * 100),(((player getVariable ["player_stats",[1,1,1,1]]) select 3) * 100),"%"],"info"] spawn SunriseClient_system_hint;
