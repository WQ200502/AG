/*

	Filename: 	SunriseClient_system_gateBombPlant.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
closeDialog 0;
if (life_action_inUse) exitWith {["error","","Вы заняты"] call SunriseClient_message};
private _building = param [0,ObjNull,[ObjNull]];
if (isNull _building) exitWith {};
if !("srl_blastingcharge" in (magazines player)) exitWith {["error","","У вас нет взрывчатки в инвентаре!"] call SunriseClient_message};

["Устанавливаем бомбу",5 * 60,"","",true] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};
if !(["srl_blastingcharge"] call SunriseClient_system_removeItem) exitWith {["error","",format["У вас нет взрывчатки в инвентаре!"]] call SunriseClient_message};

["info","","Бомба установлена, взрыв будет через 10 сек"] call SunriseClient_message;
["Ждем взрыв...",10] call SunriseClient_system_progressBarSimple;
"Bo_GBU12_LGB_MI10" createVehicle [getPosATL _building select 0, getPosATL _building select 1, (getPosATL _building select 2)+0.5];
deleteVehicle _building;

["done","","Вы взорвали ворота!"] call SunriseClient_message;