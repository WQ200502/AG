private ["_ChannelName","_ServerName","_isTeamSpeakPluginEnabled","_radios","_channel","_wtflol","_curfreqlr"];
[] spawn {
    while {true} do {
        if(!(getNumber(missionConfigFile >> "DebugMode") isEqualTo 1)) then {
            _ChannelName = call TFAR_fnc_getTeamSpeakChannelName;
            _ServerName = call TFAR_fnc_getTeamSpeakServerName;
            _isTeamSpeakPluginEnabled = call TFAR_fnc_isTeamSpeakPluginEnabled;

            _notOn = false;
            _IsAdmin = ((call life_adminlevel) > 0);
            _WhiteListedChannels = ["RoleplayRadio"];
            _SupportChannels = ["Support Channel 1","Support Channel 2","Support Channel 3","Support Channel 4","Support Channel 5","Requesting Staff"];

            private "_text";

            if(_ServerName != "ANZUS Gaming Official Teamspeak || www.anzus.life") then {
                _notOn = true;
                _text ="Seems like you're not on the correct TS server! ts.anzusgaming.com";
            };
            if(!(_ChannelName in _WhiteListedChannels)) then {
                _notOn = true;
                _text = "Seems like you're not on the correct TS channel! Might need tags on TS!";
            };
            if(!_isTeamSpeakPluginEnabled) then {
                _notOn = true;
                _text = "Seems like your TFR TeamSpeak plugin is not enabled!";
            };

            if(_notOn) then {
                //player setVariable ["inRPR",false,true];
                if !(_IsAdmin) then {
                    cutText[_text,"BLACK FADED"];
                    sleep 1;
                    cutText[_text,"PLAIN"];
                };        
            } else {
                cutText ["","PLAIN"];
                //player setVariable ["inRPR",true,true];
            };

            _radios = player call TFAR_fnc_radiosList;
            if(count _radios > 1) then {
                ["Your radios are interfering with each other, drop one to fix it.","true","slow"] call ANZUS_fnc_notificationSystem;
                {
                    if(_x != "RoleplayRadio") then
                    {
                        player unassignItem _x;
                        player removeItem _x;
                    };
                    _wtfno = call TFAR_fnc_haveSWRadio;
                    if(_Wtfno) then {
                        _channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
                        _channel = _channel + 1;
                        _curfreqsr = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_GetChannelFrequency;
                        if(!isNil "_curfreqsr") then {
                            [(call TFAR_fnc_activeSwRadio), _channel, "40"] call TFAR_fnc_SetChannelFrequency;
                        };
                    };
                } forEach _radios;
            };
        };
        sleep 2;
    };
};
