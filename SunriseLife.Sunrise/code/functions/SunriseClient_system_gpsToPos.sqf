/*

	Filename: 	SunriseClient_system_gpsToPos.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _grid = param [0,"",[""]];
private _gridRefSize = (count _grid) / 2;  
private _multi = 10 ^ ( 5 - _gridRefSize);   
private _gridX = ((parseNumber (_grid select [0, _gridRefSize ])) * _multi);   
private _gridY = ((parseNumber (_grid select [_gridRefSize, _gridRefSize ])) * _multi);   

[_gridX + (_multi/2),_gridY+(_multi/2),0]