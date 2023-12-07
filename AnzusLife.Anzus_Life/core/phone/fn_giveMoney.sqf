#include "..\..\script_macros.hpp"

if(life_antispamactive isEqualTo true) exitWith {closeDialog 0; ["您必须在传输之间等待 3 秒.",true,"slow"] call ANZUS_fnc_notificationSystem};
life_antispamactive = true;

private _display = uiNamespace getVariable ["AnzusLife_Phone",displayNull];


if (isNull _display) exitWith {};

if !(life_use_atm) exitWith {["你不能做你刚刚犯了罪!","false","slow"] call ANZUS_fnc_notificationSystem;};

private _plist = _display displayCtrl 120002;
private _amountCtrl = _display displayCtrl 120003;

private _amountStr = ctrlText _amountCtrl;

private _isNumber = [_amountStr] call ANZUS_fnc_isNumber;

if !(_isNumber) exitWith {
	["您必须输入一个数字才能使用!","true","slow"] call ANZUS_fnc_notificationSystem;
};

if (CASH < (parseNumber _amountStr)) exitWith {
	["您没有足够的现金来完成此交易!","false","slow"] call ANZUS_fnc_notificationSystem;
};

private _plistSelection = lbCurSel _plist;
private _plistData = _plist lbData _plistSelection;

if (_plistData isEqualTo "") exitWith {};

private _unit = call (compile _plistData);

if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

_value = (parseNumber _amountStr);
[_value,true] call cKGySJkJHNXbPgorKa;

[format["你给了 $%1 至 %2",([(parseNumber _amountStr)] call ANZUS_fnc_numberText), name _unit],"true","slow"] call ANZUS_fnc_notificationSystem;
[player, (parseNumber _amountStr)] remoteExec ["ANZUS_fnc_ReceiveMoney", _unit];

[[format["%1/%2 给了 $%3 至 %4/%5",(name player),(getPlayerUID player),_value,(name _unit), (getPlayerUID _unit)]],"money"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
[format["%1/%2 给了 $%3 至 %4/%5",(name player),(getPlayerUID player),_value,(name _unit), (getPlayerUID _unit)], "money.log"] remoteExec ["AH_LogInterface",2];

[6] call ANZUS_fnc_updatePartial;
closeDialog 0;
[] spawn {
	sleep 3;
	life_antispamactive = false;
};
