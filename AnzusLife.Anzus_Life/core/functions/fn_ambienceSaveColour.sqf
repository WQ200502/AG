if (vehicle player == player) exitWith {["You are not in a vehicle",false,"slow"] call ANZUS_fnc_notificationSystem;}; // yeah your not retexturing your clothes sneaky shit
if !(dialog) exitWith {}; //no menu?...?...?
if !((vehicle player) in life_vehicles) exitWith {["您没有这辆车的钥匙.",false,"slow"] call ANZUS_fnc_notificationSystem;};

// get slider values and make them not extreme colours that look shti and make server look like clown fest even though it already is
_redValue = ((sliderPosition 1900) / 25); // Blocking NEON RED
_greenValue = ((sliderPosition 1901) / 25); // Blocking NEON GREEN
_blueValue = ((sliderPosition 1902) / 35); // Blcoking ANY SUPER DARK BLUE IT ALL LOOKS SHIT

_texture = format ["#(rgb,1,1,1)color(%1,%2,%3,1)", _redValue, _greenValue, _blueValue];
vehicle player setObjectTextureGlobal [0,_texture];

_texture2 = [_redValue, _greenValue, _blueValue, 1];

(vehicle player) setVariable ['VehicleColour', _texture2, true]; 

closeDialog 0;

["You have changed the colour of your vehicle.",false,"slow"] call ANZUS_fnc_notificationSystem;