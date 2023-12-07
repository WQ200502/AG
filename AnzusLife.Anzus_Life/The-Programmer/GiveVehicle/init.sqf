/*
_null=this execVM "The-Programmer\GiveVehicle\init.sqf";
*/
_this allowDamage false; 
_this enableSimulation false;
_this addAction[(["STR_ADDACTION_MENU"] call max_giveVeh_fnc_localize), {createDialog "Vehicle_Give";},"",0,false,false,"",'playerSide == civilian'];
