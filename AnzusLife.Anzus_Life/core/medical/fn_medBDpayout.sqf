#include "..\..\script_macros.hpp"
/*
    File: fn_medBDpayout.sqf
    Author: Fresqo
    Description: pays out the patient for giving blood
*/

if (isNull player || !alive player) exitWith {};
CASH = CASH + 1500;
uiNamespace setVariable ["phRzBRcKJaTpqRLHbj",CASH];
titleText ["你刚刚支付 $1500", "PLAIN", 3];
