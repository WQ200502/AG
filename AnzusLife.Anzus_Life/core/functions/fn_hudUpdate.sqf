#include "..\..\script_macros.hpp"

//---------------------------------
//By Repentz 
//---------------------------------

disableSerialization;
if(isNull LIFEdisplay) then {[] call ANZUS_fnc_hudSetup;};

if(!isNil "life_thirst") then
{
	if (life_thirst <= 100) then
	{
		LIFEctrl(15022) ctrlSetText "ui\progressBar\thirst\thirst_100.paa";
	};

	if (life_thirst <= 90) then
	{
		LIFEctrl(15022) ctrlSetText "ui\progressBar\thirst\thirst_90.paa";
	};

	if (life_thirst <= 70) then
	{
		LIFEctrl(15022) ctrlSetText "ui\progressBar\thirst\thirst_70.paa";
	};

	if (life_thirst <= 50) then
	{
		LIFEctrl(15022) ctrlSetText "ui\progressBar\thirst\thirst_50.paa";
	};

	if (life_thirst <= 30) then
	{
		LIFEctrl(15022) ctrlSetText "ui\progressBar\thirst\thirst_30.paa";
	};

	if (life_thirst <= 0) then
	{
		LIFEctrl(15022) ctrlSetText "ui\progressBar\thirst\thirst_0.paa";
	};
};

if (damage player >= 0) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_100.paa";
};

if (damage player >= 0.1) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_90.paa";
};

if (damage player >= 0.2) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_80.paa";
};

if (damage player >= 0.3) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_70.paa";
};

if (damage player >= 0.4) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_60.paa";
};
if (damage player >= 0.5) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_50.paa";
};

if (damage player >= 0.6) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_40.paa";
};
if (damage player >= 0.7) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_30.paa";
};

if (damage player >= 0.8) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_20.paa";
};
if (damage player >= 0.9) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_10.paa";
};

if (damage player >= 1) then
{
	LIFEctrl(15020) ctrlSetText "ui\progressBar\health\health_0.paa";
};

if(!isNil "life_hunger") then
{
	if (life_hunger <= 100) then
	{
		LIFEctrl(15021) ctrlSetText "ui\progressBar\hunger\hunger_100.paa";
	};

	if (life_hunger <= 90) then
	{
		LIFEctrl(15021) ctrlSetText "ui\progressBar\hunger\hunger_90.paa";
	};

	if (life_hunger <= 70) then
	{
		LIFEctrl(15021) ctrlSetText "ui\progressBar\hunger\hunger_70.paa";
	};

	if (life_hunger <= 50) then
	{
		LIFEctrl(15021) ctrlSetText "ui\progressBar\hunger\hunger_50.paa";
	};

	if (life_hunger <= 30) then
	{
		LIFEctrl(15021) ctrlSetText "ui\progressBar\hunger\hunger_30.paa";
	};

	if (life_hunger <= 20) then
	{
		LIFEctrl(15021) ctrlSetText "ui\progressBar\hunger\hunger_20.paa";
	};

	if (life_hunger <= 0) then
	{
		LIFEctrl(15021) ctrlSetText "ui\progressBar\hunger\hunger_0.paa";
	};
};

_text = "";
_color = [];
switch (missionNameSpace getVariable ["AnzusLife_ThreatLevel",0]) do {
	case 0: {
		_text = "CODE GREEN";
		_color = [0.063,0.776,0,1];
	};
	case 1: {
		_text = "CODE AMBER";
		_color = [0.776,0.424,0,1];
	};
	case 2: {
		_text = "CODE RED";
		_color = [0.776,0,0,1];
	};
	case 3: {
		_text = "MARTIAL LAW";
		_color = [0.569,0,0,1];
	};
};

LIFEctrl(1251) ctrlSetText _text;
LIFEctrl(1251) ctrlSetTextColor _color;