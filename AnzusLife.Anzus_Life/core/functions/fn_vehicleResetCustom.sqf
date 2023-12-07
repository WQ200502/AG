if (vehicle player == player) exitWith {["You are not in a vehicle",false,"slow"] call ANZUS_fnc_notificationSystem;}; // yeah your not retexturing your clothes sneaky shit
if !(dialog) exitWith {}; //no menu?...?...?
if !((vehicle player) in life_vehicles) exitWith {["您没有这辆车的钥匙.",false,"slow"] call ANZUS_fnc_notificationSystem;};

(vehicle player) setVariable ['VehicleColour', [1,1,1,1], true]; 
(vehicle player) setVariable ['VehiclePlate', '0000000', true]; 

["置车辆自定义，存储并取回车辆以使其生效.",false,"slow"] call ANZUS_fnc_notificationSystem;