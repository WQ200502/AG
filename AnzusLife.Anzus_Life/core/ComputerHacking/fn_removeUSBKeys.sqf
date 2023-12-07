
["<t size='2.0' color='#0000FF' align='center'>访问代码重置</t> <br/> <br/>警察已重置所有军事进入密码。 如果您正在入侵大型机，那么您的代码现在将完全无用，您将不得不重新开始.","true","slow"] call ANZUS_fnc_notificationSystem;
if(life_inv_usb1 > 0) then {[false, "USB1", life_inv_usb1] call ANZUS_fnc_handleInv;};
if(life_inv_usb2 > 0) then {[false, "USB2", life_inv_usb2] call ANZUS_fnc_handleInv;};
if(life_inv_usb3 > 0) then {[false, "USB3", life_inv_usb3] call ANZUS_fnc_handleInv;};
if(life_inv_usb4 > 0) then {[false, "USB4", life_inv_usb4] call ANZUS_fnc_handleInv;};
if(life_inv_usb5 > 0) then {[false, "USB5", life_inv_usb5] call ANZUS_fnc_handleInv;};
