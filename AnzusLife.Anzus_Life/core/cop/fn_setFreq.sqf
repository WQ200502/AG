private _freq = switch (playerSide) do {
	case west : {[[1,"33.1"],[2,"33.2"],[3,"33.3"],[4,"33.4"],[5,"33.5"],[6,"33.6"],[7,"33.7"]]};
	case independent : {[[1,"33.9"],[2,"33.8"]]};
	default {[]};
};

{[(call TFAR_fnc_activeSwRadio), _x select 0, _x select 1] call TFAR_fnc_setChannelFrequency;} forEach _freq;

["您的频率已设定!","true","slow"] call ANZUS_fnc_notificationSystem;
