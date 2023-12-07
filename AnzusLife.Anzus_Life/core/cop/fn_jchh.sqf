
private["_nearplayers","_logplayers"];
_nearplayers = player nearEntities ["Man", 50];
_logplayers = [];

{
	if (isPlayer _x && _x != player) then
	{
		_logplayers pushBack (name _x);
		_list = allPlayers select {_x distance player < 50};
		uiSleep 1;
		[[0,2],format["%1 警官在50米内向你发送了警告请5 秒后进行反抗! 或 3 秒内按下 shift+V 来表示投降! %2人收到信号!",name player,count _list]] remoteExec ["ANZUS_fnc_broadcast",_x];
		[[player, "djs",50],"ANZUS_fnc_playsound",true,false] spawn ANZUS_fnc_MP;
		uiSleep 1;
		[[0,2],format["4...!"]] remoteExec ["ANZUS_fnc_broadcast",_x];
		uiSleep 1;
		[[0,2],format["3...!"]] remoteExec ["ANZUS_fnc_broadcast",_x];
		uiSleep 1;
		[[0,2],format["2...!"]] remoteExec ["ANZUS_fnc_broadcast",_x];
		uiSleep 1;
		[[player, "jchh",50],"ANZUS_fnc_playsound",true,false] spawn ANZUS_fnc_MP;
		[[0,2],format["1...可以进行反抗此次警告有效期为1分钟!"]] remoteExec ["ANZUS_fnc_broadcast",_x];
		uiSleep 60;
		[[0,2],format["战斗已解除如果还在交战可继续进行射击!"]] remoteExec ["ANZUS_fnc_broadcast",_x];
	};
} forEach _nearplayers;

uiSleep 4.5;
player,format["%1 向 %2 发送了警察警告并进入战斗区域", name player, _logplayers];
uiSleep 60;
player,format["%1 警官 向 %2 的战斗已解除不能再射击", name player, _logplayers];