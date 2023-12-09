/*
	
	Filename: 	SunriseClient_atm_updateMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
CONTROL(2700,2701) ctrlSetStructuredText parseText format["<t size='1.5' color='%1'><img size='1.7' image='\sunrise_pack\icons\bank.paa'/> $%2<br/><img size='1.7' image='\sunrise_pack\icons\cash.paa'/> $%3</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000'],[BANK] call SunriseClient_system_numberText,[CASH] call SunriseClient_system_numberText];