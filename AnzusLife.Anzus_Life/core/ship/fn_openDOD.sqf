if !(USAFTerminalOpener getVariable ["TerminalUnlocked", false]) exitWith {["笔记本电脑键盘已锁定，因此无法打开，请先下载海军数据！",true,"slow"] call ANZUS_fnc_notificationSystem;};

_number = _this select 0;

playsound "Hint3";

if (_number isEqualTo "enter") exitWith {
	_numberArray = USAFTerminalOpener getVariable ["virusCode", 0000];
	if (numberArray isEqualTo (USAFTerminalOpener getVariable ["virusCode", 0000])) then {
		ShipDataTransfer setVariable ["TransferUnlocked", true, true];
		["你已经解锁了数据终端，现在可以加载数据了！",true,"slow"] call ANZUS_fnc_notificationSystem;
		["有人打开了美国空军基地的解密工具！",false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem",west];
		numberArray = [];
		closeDialog 0;
	} else {
		["代码不正确，请再试一次！",true,"slow"] call ANZUS_fnc_notificationSystem;
		["有人试图从美国空军基地解密数据失败了！",false,"slow"] remoteExecCall ["ANZUS_fnc_notificationSystem",west];
		numberArray = [];
		closeDialog 0;
	};
};

numberArray pushBack _number;
