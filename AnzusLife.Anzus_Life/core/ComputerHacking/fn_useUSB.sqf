[] spawn
{
	while{true} do
	{
		waitUntil{life_inv_usb1 > 0 && life_inv_usb2 > 0 && life_inv_usb3 > 0 && life_inv_usb4 > 0};

		[true, "USB5", 1] call ANZUS_fnc_handleInv;
		{
			[false,_x, 1] call ANZUS_fnc_handleInv;
		} forEach ["USB1","USB2","USB3","USB4"];
		["你现在拥有进入军事基地所需的所有指挥代码。您已将 4 个代码编译到单个 USB 记忆棒上.",false,"slow"] call ANZUS_fnc_notificationSystem;
		sleep 1;
	};
};
