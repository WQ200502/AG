/*

	Filename: 	SunriseClient_system_questionDealer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _sellers = (_this select 0) GVAR ["sellers",[]];
if (EQUAL(_sellers,[])) exitWith {hint localize "STR_Cop_DealerQuestion"}; //No data.
call SunriseClient_actions_inUse;
private _names = "";
private "_val";
{	
	_val = _x select 2;

	if (_val > 15000) then {
		_val = round(_val / 16);
	};

	[[_x select 0,_x select 1,"483",_val],"wantedAdd"] call SunriseClient_system_hcExec;

	_names = _names + format["%1<br/>",_x select 1];
} foreach _sellers;

hint parseText format[(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
(_this select 0) SVAR ["sellers",[],true];
life_action_inUse = false;