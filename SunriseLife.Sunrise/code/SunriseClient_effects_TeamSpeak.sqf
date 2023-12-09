/*

	Filename: 	SunriseClient_effects_TeamSpeak.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_HANDLE_TEAMSPEAK = [{
	if (server_ddos_ts) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler;LIFE_HANDLE_TEAMSPEAK = -1};
	if (life_tfWarn > 2 && !(call life_isAdmin)) exitWith {
		[0,format["%1 был исключен с сервера из-за нарушения правила нахождения в TeamSpeak",name player]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
		endMission "TaskForce";
	};
	_error = "";
	_channelError = false;
	_server = [] call TFAR_fnc_getTeamSpeakServerName;
	_channel = [] call TFAR_fnc_getTeamSpeakChannelName;
	_pluginEnabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;

	switch(true) do {
		case (!_pluginEnabled): {_error = "У вас не включен плагин Task Force Arma 3 Radio! Зайдите в плагины TeamSpeak (Ctrl+Shift+P) и проверьте активен ли он. После этого нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>"}; //маловероятная ошибка, но важная
		case (!(EQUAL(_server,tf_radio_server_name))): {_error = format["Вы не подключены к TS-серверу Sunrise! Наш сервер: <t color='#ffcc00'>ts.sunriserp.ru</t><br/>Если вас автоматически не перекинет в канал <t color='#ffcc00'>%1</t>, то зайдите в плагины TeamSpeak (Ctrl+Shift+P) и нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>.",tf_radio_channel_name]}; //один идиот на 100 человек
		case (!(EQUAL(_channel,tf_radio_channel_name))): {
			_error = format["Вы должны быть в специальном канале TeamSpeak для игры на сервере! Плагин будет перезагружен и вас перекинет в канал <t color='#ffcc00'>%1</t>. Если это не сработает, то зайдите в плагины (Ctrl+Shift+P) и нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>.",tf_radio_channel_name];
			_channelError = true;
		}; //самая частая проблема
	};

	if (!(EQUAL(_error,""))) then {
		ADD(life_tfWarn,1);
		[format[" <t size='2.2' color='#ff0000' align='center'>Внимание!</t><br /><br />%1<br /><br />Это предупреждение номер %2 из 3.<br /><br />Следующая проверка через 5 минут! Исправьте ошибку или будете исключены из игры!</t>",_error,life_tfWarn],"error"] spawn SunriseClient_system_hint;
		if (_channelError) then {
			["processPlayerPositionsHandler", "onEachFrame"] call BIS_fnc_removestackedEventHandler;
			[{["processPlayerPositionsHandler", "onEachFrame", "TFAR_fnc_processPlayerPositions"] call BIS_fnc_addStackedEventHandler}, nil, 5] call CBA_fnc_waitAndExecute;			
		};
	} else {
		life_tfWarn = 0;
	};
},5 * 60] call CBA_fnc_addPerFrameHandler;