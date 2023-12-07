#include "..\..\script_macros.hpp"
/*
    File: fn_updatelistbox.sqf
    Author: Neil Smith / Deadlesszombie

    90% Vanilla file re-adapted and re-used

    https://www.altisliferpg.com/profile/5736-deadlesszombie/
    Description:
    Update the dialog
*/
private ["_deadlessDanceList","_gear_list","_shopItems","_name","_price"];
disableSerialization;
_deadlessDanceList = CONTROL(9990,9992);
lbClear _deadlessDanceList;

DeadlessDanceArray = [
  ["vvv_crazy_dance","Crazy dance"],
  ["vvv_crazydrunkdance","Crazy drunk dance"],
  ["vvv_dance","Dance"],
  ["vvv_dubstepdance","Dubstep dance"],
  ["vvv_dubstepPop","Dubstep pop dance"],
  ["vvv_duolvan","Duolvan dance"],
  ["vvv_duostephan","Duo stephan dance"],
  ["vvv_hiphopdance","Hiphop dance"],
  ["vvv_nightclubdance","Nightclub dance"],
  ["vvv_robotdance","Robot dance"],
  ["vvv_russiandance","Russian dance"],
  ["vvv_stephan","Stephan Dance"],
  ["vvv_anim_lunatic","Lunatic"],
  ["vvv_anim_wank","Fap"],
  ["vvv_Middlefinger","Fuck you"],
  ["vvv_Threaten","You're Dead"],
  ["vvv_Thumbsup","Thumbs up"],
  ["xz_anim_dab","Dab"],
  ["AG_Dance_House1","Lets Boogy"],
  ["AG_Dance_Samba","Lets Boogy 2"],
  ["vvv_anim_Knockout1In","YOU HIT ME!"],
  ["vvv_anim_Punch1","OOFT!"],
  ["vvv_anim_Pee","Pee"],
  ["vvv_anim_Poo","Poop"],
  ["xz_anime_fortnite","Dance like we are"],
  ["","STOP"]
];

{
  _deadlessDanceList lbAdd format ["%1",(_x select 1)];
  _deadlessDanceList lbSetData [(lbSize _deadlessDanceList)-1,(_x select 0)];
} forEach DeadlessDanceArray;
