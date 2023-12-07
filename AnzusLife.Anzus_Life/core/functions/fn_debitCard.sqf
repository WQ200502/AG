/*
	By:lhc
*/
#include "..\..\script_macros.hpp"
private ["_amount","_success"];

_amount = [_this,0,0,[0]] call BIS_fnc_param;
_success = false;
if (CASH >= _amount) then
{
	[_amount,true] call cKGySJkJHNXbPgorKa;
	systemChat format["你用现金支付了%1$.", [_amount] call ANZUS_fnc_numberText];
	_success = true;
}
else
{
	if (life_inv_yhk > 0) then
	{
		if (BANK < _amount) then {[format ["在你的银行账户中没有%1$完成这个交易.", [_amount] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;}
		else
		{
			[_amount,true] call xiyECYLNxrKhXypAac;
			systemChat format["你用网银支付了%1$.", [_amount] call ANZUS_fnc_numberText];
			_success = true;
		};
	}
	else
	{
		[format ["你没有现金的%1$，也没有网银.", [_amount] call ANZUS_fnc_numberText],true,"slow"] call ANZUS_fnc_notificationSystem;
	};
};
[0] call ANZUS_fnc_updatePartial;
_success