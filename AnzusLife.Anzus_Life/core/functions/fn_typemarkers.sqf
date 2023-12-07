params [
["_switch",0,[0]],
["_arr",[],[[]]]
];

_arr params [
"_obj",
["_time",120,[120]],
["_type","Mil_dot",["Mil_dot"]],
["_txt","ROBBERY IN PROGRESS",["ROBBERY IN PROGRESS"]],
["_color","ColorRed",["ColorRed"]]
];

private _pos = [];
if (typeName _obj isEqualTo "OBJECT") then {_pos = getPos _obj;} else {_pos = _obj;};

private _marker = createMarkerLocal [format["%1_marker",str(_pos)],_pos];
_marker setMarkerColorLocal _color;
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal format["%1",_txt];

sleep _time;

deleteMarkerLocal _marker;
