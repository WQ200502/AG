/*

	Filename: 	SunriseClient_system_blastingCharge.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vault = param [0,ObjNull,[ObjNull]];
if (isNull _vault) exitWith {}; //Bad object

private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
if (count units life_copGroup < _minCops) exitWith {hint format[localize "STR_Civ_NotEnoughCops",_minCops]};
if (typeOf _vault != LIFE_SETTINGS(getText,"life_vaultBoxClass")) exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if (_vault GVAR ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if (_vault GVAR ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};

if !(["srl_blastingcharge"] call SunriseClient_system_removeItem) exitWith {hint "В инвентаре нет необходимых предметов"};

_vault SVAR ["chargeplaced",true,true];
[0,"STR_ISTR_Blast_Placed"] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
hint localize "STR_ISTR_Blast_KeepOff";
private _handle = [] spawn SunriseClient_system_demoChargeTimer;
[] remoteExec ["SunriseClient_system_demoChargeTimer",life_copGroup];

waitUntil {scriptDone _handle};
uiSleep 0.9;
if !(fed_bank GVAR ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

private _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
[fed_bank,"chargeplaced"] call SunriseClient_system_clearGlobalVar;
fed_bank SVAR ["safe_open",true,true];

hint localize "STR_ISTR_Blast_Opened";
[] call SunriseClient_fast_hudWeaponUpdate;