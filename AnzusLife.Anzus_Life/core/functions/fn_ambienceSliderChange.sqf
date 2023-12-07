if (vehicle player == player) exitWith {}; // yeah your not retexturing your clothes sneaky shit
if !(dialog) exitWith {}; //no menu?...?...?

// get slider values and make them not extreme colours that look shti and make server look like clown fest even though it already is
_redValue = ((sliderPosition 1900) / 25); // Blocking NEON RED
_greenValue = ((sliderPosition 1901) / 25); // Blocking NEON GREEN
_blueValue = ((sliderPosition 1902) / 35); // Blcoking ANY SUPER DARK BLUE IT ALL LOOKS SHIT

_texture = format ["#(rgb,1,1,1)color(%1,%2,%3,1)", _redValue, _greenValue, _blueValue];
ctrlSetText [2209, _texture];