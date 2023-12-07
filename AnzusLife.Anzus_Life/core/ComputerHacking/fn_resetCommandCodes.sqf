
if(!isServer) then
{
	if(life_resetMainFrameAccessDeny) exitWith {["代码已重置.","false","slow"] call ANZUS_fnc_notificationSystem;};

	if(!(side player isEqualTo west)) exitWith {["你不是警察，不能重置主机.","false","slow"] call ANZUS_fnc_notificationSystem;};
};
life_computer1CannotBeHacked = false;
life_computer2CannotBeHacked = false;
life_computer3CannotBeHacked = false;
life_computer4CannotBeHacked = false;
publicVariable "life_computer1CannotBeHacked";
publicVariable "life_computer2CannotBeHacked";
publicVariable "life_computer3CannotBeHacked";
publicVariable "life_computer4CannotBeHacked";

[] remoteExec ["ANZUS_fnc_removeUSBKeys",0];

[] spawn
{
	life_resetMainFrameAccessDeny = true;
	publicVariable "life_resetMainFrameAccessDeny";
	uiSleep 200;
	life_resetMainFrameAccessDeny = false;
	publicVariable "life_resetMainFrameAccessDeny";
};
