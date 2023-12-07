#include "..\..\script_macros.hpp"
if (life_inv_yhk > 0) exitWith {[ format ["你已经有银行卡了！"],true,"slow"] call ANZUS_fnc_notificationSystem;};
private _action = ["银行卡", format["您确定要花费2500元购买银行卡吗?"], "是", "否", findDisplay 46, true] call ANZUS_fnc_guiPrompt;

if (_action) then {
    if (BANK < 2500) exitWith {[ format ["您的银行没有2500元！"],true,"slow"] call ANZUS_fnc_notificationSystem;};
	[2500,true] call xiyECYLNxrKhXypAac;
    [ format ["注册成功"],true,"slow"] call ANZUS_fnc_notificationSystem;
    [true,"yhk",1] call ANZUS_fnc_handleInv;
    if (!((player getVariable ["donorLevel",0]) isEqualTo 0)) then {
	["您是尊贵的VIP,此银行卡将可以永远使用！",false,"slow"] call ANZUS_fnc_notificationSystem;
	} else {
	[ format ["您不是VIP,银行卡死亡将掉落！"],true,"slow"] call ANZUS_fnc_notificationSystem;
	};

} else {
    [ format ["取消注册"],true,"slow"] call ANZUS_fnc_notificationSystem;
};
