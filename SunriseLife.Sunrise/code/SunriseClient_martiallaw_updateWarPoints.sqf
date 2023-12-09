/*

	Filename: 	SunriseClient_martiallaw_updateWarPoints.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_mode","",[""]],
	["_pointName","",[""]],
	["_unitName","",[""]]
];

switch (_mode) do {
	case "add": {
		[format["
		<t size='2.2' color='#ff0000' align='center'>Военное положение</t><br /><br />
		<t size='1.8' color='#ffb700' align='center'>%1</t><br /><br />
		<t size='1.4'>Всем покинуть данный район! Будет вестись огонь на поражение.</t><br /><br />
		<t size='1'>(Установил %2)</t>",_pointName,_unitName],"police"] spawn SunriseClient_system_hint;
	};
	case "remove": {
		[format["
		<t size='2.2' color='#ff0000' align='center'>Военное положение снято</t><br /><br />
		<t size='1.8' color='#ffb700' align='center'>%1</t><br /><br />
		<t size='1.4'>В данный район можно вернуться, боевые действия закончились.</t><br /><br />
		<t size='1'>(Снял %2)</t>",_pointName,_unitName],"police"] spawn SunriseClient_system_hint;
	};
	case "circle": {
		[format[" 
		<t size='2.2' color='#ff0000' align='center'>Битва за переработку</t><br /><br /> 
		<t size='1.8' color='#ffb700' align='center'>%1</t><br /><br /> 
		<t size='1.4'>Радиус военного положения уменьшится на 100 метров через %2 минут!</t><br /> ",_pointName,_unitName],"warning"] spawn SunriseClient_system_hint;
	};
};