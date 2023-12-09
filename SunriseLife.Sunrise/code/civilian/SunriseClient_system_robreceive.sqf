/*

    Filename:   SunriseClient_system_robreceive.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
params [
    ["_cash",0,[0]],
    ["_dcash",0,[0]]
];
if (_cash isEqualTo 0 && _dcash isEqualTo 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

["cash","add",_cash,"robReceive"] call SunriseClient_system_myCash;
["dcash","add",_dcash,"robReceive"] call SunriseClient_system_myCash;
titleText[format[localize "STR_Civ_Robbed",[_cash+_dcash] call SunriseClient_system_numberText],"PLAIN"];
life_rob_time = time + 900;
hint "Вы ограбили человека и не сможете 15 минут пользоваться банкоматом";