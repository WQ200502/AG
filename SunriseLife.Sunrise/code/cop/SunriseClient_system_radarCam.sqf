/*

	Filename: 	SunriseClient_system_radarCam.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_driver","_speed","_limit"];
if (NOTINVEH(_driver)) exitWith {};
if ((objectParent _driver isKindOf "Ship") OR (objectParent _driver isKindOf "Air")) exitWith {};//exit if not a freaking car
if (typeOf (objectParent _driver) in ["O_MRAP_02_F","B_G_Offroad_01_armed_F","I_MRAP_03_F","B_mas_cars_Hilux_M2","I_mas_cars_UAZ_M2"]) exitWith {};
//if (["B_mas_HMMWV",(typeOf (objectParent _driver))] call BIS_fnc_inString) exitWith {};

private _ticket = round ((_speed - _limit) * 10);//variable ticket for licensed driver
if (life_copDuty OR life_medDuty) then {life_speedTicket = 0};
if (_speed > (_limit + 3)) then {
	if !(objectParent _driver GVAR ["siren",false]) then {
		player say3d "PhotoSound";//photosound and ppEffects from prellers radar script
		
		uiSleep 0.05;
		"colorCorrections" ppEffectEnable true;   
		"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
		"colorCorrections" ppEffectCommit 0;  
		uiSleep 0;   
		"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
		"colorCorrections" ppEffectCommit 0.05;   
		uiSleep 0.05;   
		"colorCorrections" ppEffectEnable false;
		uiSleep 0.1;
		"colorCorrections" ppEffectEnable true;   
		"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
		"colorCorrections" ppEffectCommit 0;  
		uiSleep 0;   
		"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
		"colorCorrections" ppEffectCommit 0.05;   
		uiSleep 0.05;   
		"colorCorrections" ppEffectEnable false;
		
		ADD(life_speedTicket,1);
		
		if (life_speedTicket <= 2) then {["police","",format["Это ваш %1-ый штраф за превышение скорости. Соблюдайте ПДД!",life_speedTicket]] call SunriseClient_message};	
		if (EQUAL(life_speedTicket,3)) then {["police","","Это ваш третий штраф! Следующее нарушение скоростного режима внесет вас в список розыска полиции!"] call SunriseClient_message};
		
		if (life_speedTicket isEqualTo 4) exitWith {					
			["police","",format["Это ваш четвертый штраф за превышение скорости. Вы в розыске."],true] call SunriseClient_message;
			hint parseText format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/>За многократное превышение скорости вы попали в розыск!",round _speed,_limit,name _driver];			

			[[getPlayerUID _driver,name _driver,"120S"],"wantedAdd"] call SunriseClient_system_hcExec;
		};
			
		if (life_speedTicket > 4) exitWith {
			//systemChat format["Это ваш %1-ый штраф за превышение скорости. Вы в федеральном розыске.",life_speedTicket];

			["info","",format["Это ваш %1-ый штраф за превышение скорости. Вы в федеральном розыске.",life_speedTicket],true] call SunriseClient_message;
			hint parseText format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/>За многократное превышение скорости вы попали в федеральный розыск и лишаетесь лицензий на управление наземной техникой!",round _speed,_limit,name _driver];			

			[[getPlayerUID _driver,name _driver,"120H"],"wantedAdd"] call SunriseClient_system_hcExec;	
			[1] remoteExecCall ["SunriseClient_system_removeLicenses",_driver];            	
		};
			
		if (CASH <= _ticket) then {
			if (BANK <= _ticket) exitWith {
				hint parseText format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/><t color='#ffde00'>Штраф: $%4</t><br/><br/>Так как вы нищий и не можете оплатить штраф, то вы попадаете в розыск",round _speed,_limit,name _driver,[_ticket] call SunriseClient_system_numberText];								

				[[getPlayerUID _driver,name _driver,"120S"],"wantedAdd"] call SunriseClient_system_hcExec;
			};							
			["atm","take",_ticket] call SunriseClient_system_myCash;				
			hint parseText format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/><t color='#ffde00'>Штраф: $%4</t>",round _speed,_limit,name _driver,[_ticket] call SunriseClient_system_numberText];		
		} else {			
			["cash","take",_ticket] call SunriseClient_system_myCash;
			hint parseText format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/><t color='#ffde00'>Штраф: $%4</t>",round _speed,_limit,name _driver,[_ticket] call SunriseClient_system_numberText];	
		};	
	};
};

uiSleep 5;