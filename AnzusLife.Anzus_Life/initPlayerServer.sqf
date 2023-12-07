if (((player getVariable["donorLevel", 0]) isEqualTo 3)) then {
	[format["欢迎尊贵的VIP3 %1进入服务器", name player], "true", "slow"] call ANZUS_fnc_notificationSystem;
};