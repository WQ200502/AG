	
private["_gagger"];
_gagger = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
[format["你被堵嘴了 %1.", name _gagger],true,"slow"] call ANZUS_fnc_notificationSystem;

titleText ["你的嘴上有堵嘴，你再也不能说话!", "PLAIN"];
player setVariable ["tf_globalVolume", 0];
waitUntil{!(player getVariable ["gagged",false])};
["你被堵嘴东西移除了 可以尝试说话!","true","slow"] call ANZUS_fnc_notificationSystem;

titleText ["你没有被堵嘴", "PLAIN"];
player setVariable ["tf_globalVolume", 1];