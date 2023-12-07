if !(ShipDataStorage getVariable ["DataUnlocked", false]) exitWith {["笔记本电脑键盘已锁定，因此无法打开，请先破解主机！",true,"slow"] call ANZUS_fnc_notificationSystem;};

_number = _this select 0;

playsound "Hint3";

if (_number isEqualTo "enter") exitWith {
	_numberArray = ShipDataStorage getVariable ["virusCode", 0000];
	if (numberArray isEqualTo (ShipDataStorage getVariable ["virusCode", 0000])) then {
		ShipDataTerminal setVariable ["TerminalUnlocked", true, true];
		["你已经解锁了数据终端，现在可以加载数据了！",true,"slow"] call ANZUS_fnc_notificationSystem;
		["有人在自由号上输入了代码，可以下载数据！",false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem",west];
		numberArray = [];
		ShipDataStorage setVariable ["DataUnlocked", false, true];
		closeDialog 0;
	} else {
		["代码不正确，请再试一次！",true,"slow"] call ANZUS_fnc_notificationSystem;
		["有人企图从自由号上窃取数据，但失败了！",false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem",west];
		numberArray = [];
		closeDialog 0;
	};
};

numberArray pushBack _number;
