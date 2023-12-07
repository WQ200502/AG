#include "..\..\script_macros.hpp"
/*File: fn_drinkvodka.sqf author:[midgetgrimm] drinkypoo
edited by Fresqo
*/
closeDialog 0;
private["_type","_radb","_c","_r","_d","_t"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
switch (_type) do
	{
		case 1:
			{	//VODKA
				_radb = [0.02,0.02,0.15,0.15];
				_c = 95;
				_r = 3;
				_d = 0.04;
				_t = 1;
			};
		case 2:
			{	//JIMBEAM
				_radb = [0.02,0.02,0.15,0.15];
				_c = 97.5;
				_r = 3;
				_d = 0.02;
				_t = 1;
			};
		case 3:
			{	//VBEER
				_radb = [random 1,random 0.12,0.8,0.8];
				_c = 95;
				_r = 2;
				_d = 0.02;
				_t = 1;
			};
			default {};
	};
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
		"dynamicBlur" ppEffectAdjust [random _r];
		"dynamicBlur" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust _radb;
		"radialBlur" ppEffectCommit _t;
		addcamShake[random 4, 2, random 4];
		sleep 3 + random 6;
	} else {sleep 3};
};
if (life_drink > 0.07) then {

			_chance = random(100);
			if(_chance >= _c)
			then
			{
			titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
			player playMoveNow "Incapacitated";
			//titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
			sleep 15;
			player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
			sleep 10;
			life_drink = life_drink - _d;
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
enableCamShake false;
sleep 300;
if(life_drink != 0) then {life_drink = life_drink - _d;};
