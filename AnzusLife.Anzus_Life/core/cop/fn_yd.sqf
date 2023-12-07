_curWep = currentWeapon player;
_curAmmo = player ammo _curWep;

player setAmmo [_curWep, 0];
//player switchMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon";
sleep 0.5;
player setAmmo [_curWep,_curAmmo];

player removeItem "acc_pointer_IR";
player addPrimaryWeaponItem "acc_pointer_IR";