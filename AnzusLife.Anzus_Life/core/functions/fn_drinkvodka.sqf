#include "..\..\script_macros.hpp"
/*File: fn_drinkvodka.sqf author:[midgetgrimm] drinkypoo*/
closeDialog 0;
[format["Your BAC is now<br/> <t size='1.4'><t color='#FF0000'>%1</t></t>",[life_drink] call life_fnc_numberText,false,"slow"]] call ANZUS_fnc_notificationSystem;
sleep 4;
"radialBlur" ppEffectEnable true;
"dynamicBlur" ppEffectEnable true;
enableCamShake true;
player setVariable["inDrink",true,true];
for "_i" from 0 to 20 do
{
    if(life_drink > 0.07) then {
		"radialBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [random 3];
		"dynamicBlur" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust [0.02,0.02,0.15,0.15];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		sleep 3 + random 6;
	} else {sleep 3};
};
if (life_drink > 0.07) then {

			_chance = random(100);
			if(_chance >= 95) 
			then 
			{	
			titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
			player playMoveNow "Incapacitated";
			//titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
			sleep 15;
			player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
			sleep 10;
			life_drink = life_drink - 0.02;
			titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
			player playMoveNow "amovppnemstpsraswrfldnon";
			[0,format[localize "STR_MISC_StPubIntox",profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];
			[getPlayerUID player,profileName,"16",player] remoteExec ["life_fnc_wantedAdd",RSERV];				
			};
};
//Stop effects
player setVariable["inDrink",false,true];

"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"radialBlur" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;
resetCamShake;
sleep 300;
if(life_drink != 0) then {life_drink = life_drink - 0.04;};