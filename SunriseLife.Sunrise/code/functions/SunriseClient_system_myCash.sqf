/*

	Filename: 	SunriseClient_system_myCash.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_type","",[""]],
	["_modifier","",[""]],
	["_amount",0,[0]],
	["_from","NoData",[""]],
	["_extInfo","",[""]]
];

if (call SunriseClient_system_myCashCheck) exitWith {
	[steamid,0,"Money Hack Detect",format["Money Hack Detect! Amount= %1",_amount]] remoteExecCall ["SunriseServer_system_rcon",RSERV];
	[["dupe",[format["Money Hack Detect! Amount= %1 || %2 (%3)",_amount,GVAR_RNAME(player),steamid]]],"customLog"] call SunriseClient_system_hcExec;
	false
};

switch (_type) do {
	case "cash": {
		switch (_modifier) do {
			case "add": {ADD(CASH,_amount)};
			case "take": {
				SUB(CASH,_amount);
				if (CASH < 0) then {CASH = 0};
			};
			case "swap": {
				SUB(CASH,_amount);
				if (CASH < 0) then {CASH = 0};
				ADD(BANK,_amount);
				BANK = round BANK;
			};
			case "set": {CASH = _amount};
			case "drop": {CASH = 0};
		};

		CASH = round CASH;
	};
	case "atm": {
		switch (_modifier) do {
			case "add": {ADD(BANK,_amount)};
			case "take": {
				SUB(BANK,_amount);
				if (BANK < 0) then {BANK = 0};
			};
			case "swap": {
				SUB(BANK,_amount);
				if (BANK < 0) then {BANK = 0};
				ADD(CASH,_amount);
				CASH = round CASH;
			};
			case "set": {BANK = _amount};
			case "drop": {BANK = 0};
		};

		BANK = round BANK;
	};
	case "dcash": {
		switch (_modifier) do {
			case "add": {ADD(DCASH,_amount)};
			case "take": {
				SUB(DCASH,_amount);
				if (DCASH < 0) then {DCASH = 0};
			};
			case "set": {DCASH = _amount};
			case "drop": {DCASH = 0};
		};

		DCASH = round DCASH;

	};
};

life_moneyCache = (CASH / 2) + life_cashX;
life_dmoneyCache = (DCASH / 2) + life_dcashX;
life_atmmoneyCache = (BANK / 2) + life_atmX;

if !(EQUAL(_modifier,"set")) then {
	[["money",CASH, DCASH, BANK, steamid, GVAR_RNAME(player), _amount, _type, _modifier, _from, _extInfo, random(9999)],"updateMoney","DB"] call SunriseClient_system_hcExec;
};

true