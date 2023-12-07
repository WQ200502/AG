if (vehicle player == player) exitWith {["你不在车里",false,"slow"] call ANZUS_fnc_notificationSystem;}; // yeah your not retexturing your clothes sneaky shit
if !(dialog) exitWith {}; //no menu?...?...?
if !((vehicle player) in life_vehicles) exitWith {["您没有这辆车的钥匙.",false,"slow"] call ANZUS_fnc_notificationSystem;};

_string5 = ctrlText 1400;

if (vehicle player == player) exitWith {};
if (count _string5 > 7) exitWith {["请输入7个字符或更少的字符.",false,"slow"] call ANZUS_fnc_notificationSystem;};

{
    vehicle player	 setObjectTextureGlobal [20+_forEachIndex,format["d3s_cars_core\license\%1.paa",_x]];
} foreach (_string5 splitstring "");

(vehicle player) setVariable ["VehiclePlate", _string5, true];

closeDialog 0;