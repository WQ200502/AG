_curWep = currentWeapon player;
_curAmmo = player ammo _curWep;

player setAmmo [_curWep, 0];
//player switchMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon";
sleep 0.5;
player setAmmo [_curWep,_curAmmo];

if (player canAdd "acc_pointer_IR") then { 
player removePrimaryWeaponItem "acc_pointer_IR"; 
player addItem "acc_pointer_IR"; 
} else {
[[0,2], "你没有足够的空间装下激光指示器！"] call ZBKClient_system_broadcast;
};