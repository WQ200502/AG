/*

	Filename: 	SunriseClient_system_OpenPhone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _mode = param [0,0,[0]];
closeDialog 0;
if (LSNOTALIVE(player)) exitWith {}; //Prevent them from opening this for exploits while dead.

switch (_mode) do
{
	case 0 : {createDialog "SunriseDialogSmartphone";};
	case 1 : {createDialog "SunriseDialogSmartphoneNotruf";};
};