/*

	Filename: 	SunriseClient_system_bountyReceive.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _amount = param [0,0,[0]];
private _tax = round(_amount * (server_tax/100));		
ADD(life_tmp_tax,_amount);
SUB(_amount,_tax);

_amount = _amount call SunriseClient_system_increase;
//titleText[format[localize "STR_Cop_BountyRecieve",[_amount] call SunriseClient_system_numberText,[_tax] call SunriseClient_system_numberText],"PLAIN"];
["atm","add",_amount,"bountyReceive"] call SunriseClient_system_myCash;
["CrimeKilled"] spawn SunriseClient_experience_addExp;