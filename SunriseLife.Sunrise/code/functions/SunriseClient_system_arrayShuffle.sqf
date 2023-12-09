/*
	
	Filename: 	SunriseClient_system_arrayShuffle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _cnt = count _this;
for "_i" from 1 to _cnt do {
	_this pushBack (_this deleteAt random _cnt); 
};
_this