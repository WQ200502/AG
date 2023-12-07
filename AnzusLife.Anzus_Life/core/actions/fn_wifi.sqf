/*
	File: fn_wifi.sqf
	Author: Fresqo
	Description:
	King of the hill type game, solo players only.
*/
private ["_playersInBase","_baseRadius","_numPlayersNeeded","_poso","_wifiPrice"];

_baseRadius = 30;
_numPlayersNeeded = 2;
_wifiPrice = 100;
_poso = getMarkerPos "Kothmarker";


if (money_printer_1 getVariable ["inCapture", false]) exitWith { ["系统：当前正在打印货币!","false","slow"] call ANZUS_fnc_notificationSystem; };
money_printer_1 setVariable ["inCapture",true,true];
money_printer_1 setVariable ["printfailed",false,true];

	while {true} do {
		    sleep 5;
			if (missionNamespace getVariable["wifi",false]) exitWith {["此事件现已结束.","false","slow"] call ANZUS_fnc_notificationSystem;};
		    _playersInBase = {isPlayer _x && _x distance (getMarkerPos "Kothmarker") < _baseRadius} count playableUnits < _numPlayersNeeded;
			if(player distance _poso > 30) exitWith { ["你需要在假钞机激活时离它30米以内才能拿到钱","false","slow"] call ANZUS_fnc_notificationSystem;
			money_printer_1 setVariable ["inCapture",false,true];
			};
			if (money_printer_1 getVariable ["printfailed", false]) exitWith {
			["货币打印机出现故障。您必须重新启动打印机!","false","slow"] call ANZUS_fnc_notificationSystem; money_printer_1 setVariable ["printfailed",false,true]; money_printer_1 setVariable ["inCapture",false,true];
		};

		if(playerSide != civilian) exitWith
	  	{
				["You should not be here!","false","slow"] call ANZUS_fnc_notificationSystem;
				money_printer_1 setVariable ["inCapture",false,true];

	    };
		if (isNull player || !alive player) exitWith {money_printer_1 setVariable ["inCapture",false,true];};
		if !(isNil 'player') exitWith {money_printer_1 setVariable ["inCapture",false,true];};

	  if (!_playersInBase) exitWith { ["卡特尔被吓到了！该地区有太多人，除非他们走了，否则您将无法赚钱!","false","slow"] call ANZUS_fnc_notificationSystem;
			money_printer_1 setVariable ["inCapture",false,true];
	  	};

				life_anzuscash1 = life_anzuscash1 + _wifiPrice;
				titleText ["You just printed $100", "PLAIN", 3];
	};

sleep (30 + random(180));
money_printer_1 setVariable ["printfailed",true,true];
money_printer_1 setVariable ["inCapture",false,true];
