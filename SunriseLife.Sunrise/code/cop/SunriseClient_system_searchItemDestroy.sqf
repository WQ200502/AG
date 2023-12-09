/*

	Filename: 	SunriseClient_system_searchItemDestroy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 8002),-1)) exitWith {};

call SunriseClient_actions_inUse;

private _data = call (compile CONTROL_DATA(8002));
_data params ["_item","_amount"];
private _type = CONTROL_VALUE(8002);

switch (_type) do { 
	case 1 : {[false,_item,_amount] remoteExecCall ["SunriseClient_system_handleInv",life_pInact_curTarget]};//virt
	case 2 : {[_item,_amount] remoteExecCall ["SunriseClient_system_removeItems",life_pInact_curTarget]};//in
	case 3 : {["dcash","drop",_amount,"searchIllegalbyCop"] remoteExecCall ["SunriseClient_system_myCash",life_pInact_curTarget]};
	default {["error","",format["Ошибка SunriseClient_system_searchItemDestroy %1",_data]] call SunriseClient_message};
};
[player] remoteExecCall ["SunriseClient_system_searchClient",life_pInact_curTarget];
[player,life_pInact_curTarget,_item,_amount] remoteExecCall ["SunriseServer_system_logSearch",2];
life_action_inUse = false;