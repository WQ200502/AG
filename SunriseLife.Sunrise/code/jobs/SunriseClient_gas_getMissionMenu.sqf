/*
	
	Filename: 	SunriseClient_gas_getMissionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
_object = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};

if (player distance life_gas_vehicle > 25) exitWith {["Проверьте, чтобы ваш грузовик был рядом и повторите попытку","error"] call SunriseClient_gui_bottomNotification};
if (life_gas_vehicle GVAR ["gasDelivery",false]) exitWith {hint "Вы уже взяли топливо для доставки на бензоколонку";};

disableSerialization;
if (isNull (findDisplay 8200)) then {
	if !(createDialog "SunriseDialogGasDeliver") exitWith {};
};

private _control = CONTROL(8200,8202);
lbclear _control;

private _litrePrice = LIFE_SETTINGS(getNumber,"life_gas_litrePrice");
private _maxLitres = LIFE_SETTINGS(getNumber,"life_gas_maxLitres");
private _pumps = [[3757.27,13477.9,0.284326],[3757.68,13485.9,0.17697],[4001.14,12592.1,0.29137],[5019.57,14436.7,0.284588],[5023.17,14429.5,0.286886],[6198.84,15081.4,0.289261],[6798.12,15561.6,0.303074],[9025.77,15729.5,0.280479],[9023.86,15729.1,0.286369],[9021.94,15728.8,0.299515],[8481.83,18260.7,0.287231],[9205.86,12112.2,0.28462],[14173.3,16541.9,0.284382],[15297.1,17565.9,0.283983],[15780.9,17453.2,0.285763],[14136.9,18691.6,0.385155],[16875.2,15469.4,0.198438],[16871.7,15476.6,0.225411],[17417.2,13936.8,0.35062],[16750.9,12513.1,0.286047],[14351.9,12934.8,0.233295],[14357.7,12930.9,0.233295],[19965.2,11447.5,0.285095],[19961.3,11454.5,0.170815],[21230.5,7116.65,0.280348],[20784.9,16666,0.294933],[20789.6,16672.4,0.284454],[23379.4,19798.9,0.283937],[25701.2,21372.6,0.284824]];

private ["_idx","_price"];
{	
	if !(_x # 0 isEqualTo _maxLitres) then {
		_idx = _control lbAdd format["[Заправка #%1] %2 л. (%3 м.)",_forEachIndex,_maxLitres - (_x#0),[(round (player distance _pumps#_forEachIndex))] call SunriseClient_system_numberText];
		_control lbSetValue [_idx,_forEachIndex];
		_neededGas = _maxLitres - (_x#0);
		_price = _neededGas * _litrePrice;//price for liter
		_control lbSetTextRight [_idx, format["Оплата: $%1",[_price] call SunriseClient_system_numberText]];		
	};			
} foreach gas_array;