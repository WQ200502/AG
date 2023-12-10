/*

	Filename: 	SunriseServer_ltd_initshops.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"
private _shops = [format["ltdInitShops:%1",worldName],2,true] call SunriseServer_database_asyncCall;
if (EQUAL(_shops,[])) exitWith {};

private ["_object","_marker","_pointX","_pointY"];
{	
	if (!isNil {GVAR_MNS (_x select 1)}) then {
		_object = call compile (_x select 1);
		_object SVAR ["shopId",_x select 0,true];
		_object SVAR ["shopTitle",_x select 2,true];
		_object SVAR ["ltdId",_x select 3,true];
		_object SVAR ["ltdOwner",_x select 4,true];
		
		[_object, [format["Управление %1",_x select 2],SunriseClient_ltd_shopMenuOwner,"",0,false,false,"","vehicle _this == _this && _target getVariable ['ltdOwner',''] isEqualTo getPlayerUID _this",5]] remoteExec ["addAction", RCLIENT, format["%1_1",_x select 0]];
		[_object, [_x select 2,SunriseClient_ltd_shopMenu,"",0,false,false,"","vehicle _this == _this",5]] remoteExec ["addAction", RCLIENT, format["%1_2",_x select 0]];

		[_object] spawn SunriseServer_ltd_addItemsToShop;

		_pointX = (getPos _object) select 0;
		_pointY = (getPos _object) select 1;
		_marker = createMarker [format["ltd_shop_%1",_x select 0],[_pointX,_pointY]];
		_marker setMarkerColor "ColorOrange";	
		_marker setMarkerType "plp_mark_shop_1";
		_marker setMarkerText format["%1",_x select 2];

	} else {
		format["shop object %1 is not at map",_object] call SunriseServer_system_log;
	};
} forEach _shops;