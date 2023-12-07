
_list = allPlayers select {_x distance player < 50};
uiSleep 1;
[[0,2],format["你在50米内向你发送了打劫警告请5 秒后进行反抗! 收到的:%1人!",count _list]] spawn ANZUS_fnc_broadcast;
[[player, "djs",50],"ANZUS_fnc_playsound",true,false] spawn ANZUS_fnc_MP;
uiSleep 1;
[[0,2],"4...!"] spawn ANZUS_fnc_broadcast;
uiSleep 1;
[[0,2],"3...!"] spawn ANZUS_fnc_broadcast;
uiSleep 1;
[[0,2],"2...!"] spawn ANZUS_fnc_broadcast;
uiSleep 1;
[[0,2],"1...可以进行射击此次警告有效期为1分钟!"] spawn ANZUS_fnc_broadcast;
[[player, "jchh",50],"ANZUS_fnc_playsound",true,false] spawn ANZUS_fnc_MP;
uiSleep 60;
[[0,2],"战斗已解除如果还在交战可继续进行射击"] spawn ANZUS_fnc_broadcast;


