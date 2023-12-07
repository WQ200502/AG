// 游戏内初始化GUI
300 cutRsc ["playerHUD","PLAIN"];
disableSerialization;

//开始创建GUI

while {true} do
{

	_hud = uiNameSpace getVariable ["playerHUD",displayNull]; //获取布局
	_HUD_currentAmmo = _hud displayCtrl 100; //获取布局内IDC
	_HUD_reserveAmmo = _hud displayCtrl 101;
	_HUD_firemode = _hud displayCtrl 102;
	_HUD_healthPlus = _hud displayCtrl 103;
	_HUD_healthPoints = _hud displayCtrl 104;
	_HUD_grenades = _hud displayCtrl 105;
	_HUD_slashBetweenAmmo = _hud displayCtrl 106;
	_bearingDisplayCtrl = _hud displayCtrl 15023;
	_speedDisplayCtrl = _hud displayCtrl 1000;
	_fuelDisplayCtrl = _hud displayCtrl 1001;
	_fuelBar = _hud displayCtrl 1605;

	if !((vehicle player) isEqualTo player) then {
      _speedDisplayCtrl ctrlShow true;
      _fuelDisplayCtrl ctrlShow true;
      _fuelBar ctrlShow true;
    } else {
      _speedDisplayCtrl ctrlShow false;
      _fuelDisplayCtrl ctrlShow false;
      _fuelBar ctrlShow false;
    };

	_bearingValue = getdir player;

	_vehSpeed = round(speed player);

	_fuel = (fuel vehicle player);

	_currentAmmo = 0;
	_reserveAmmo = 0;
	_grenades    = 0;
	_fireMode = "";
    _fuelnumber = 0;

	_mode = currentWeaponMode gunner vehicle player;
	if (typeName _mode == "STRING") then {
		if (_mode == "Single") then {_fireMode = "单发"};
		if (_mode in ["Burst","Burst2rnd"]) then {_fireMode = "三连发"};
		if (_mode == "FullAuto" OR _mode == "manual") then {_fireMode = "全自动"};
	} else {_fireMode = "---"};

	if (vehicle player == player || ((driver vehicle player != player) && (gunner vehicle player != player) && (commander vehicle player != player))) then {
		{
			if ((_x select 0) == (currentMagazine player) AND (_x select 2)) then
			{
				_currentAmmo = (_x select 1);
			};
			if ((_x select 0) == (currentMagazine player) AND !(_x select 2)) then
			{
				_reserveAmmo = _reserveAmmo + (_x select 1);
			};
			if ((_x select 0) == "HandGrenade") then
			{
				_grenades = _grenades + 1;
			};
		} forEach (magazinesAmmoFull player);
	} else {
		if (driver (vehicle player) == player) then {
			_currentAmmo = (vehicle player) ammo (currentWeapon (vehicle player));
			_reserveAmmo = 0;
		} else {
			_currentAmmo = 0; // TODO
			_reserveAmmo = 0;
		};
	};

    _bearing = round (_bearingValue);

    _prevBearing = _bearing - 5;
    _nextBearing = _bearing + 5;

    switch (_bearing) do {
      case 346: {
        _prevBearing = 341;
        _nextBearing = "北";
      };
      case 0: {
        _bearing = "北";
        _nextBearing = 5;
        _prevBearing = 346;
      };
      case 5: {
        _prevBearing = "北";
        _nextBearing = 10;
      };
      case 85: {
        _prevBearing = 80;
        _nextBearing = "东";
      };
      case 90: {
        _bearing = "东";
        _nextBearing = 95;
        _prevBearing = 85;
      };
      case 95: {
        _nextBearing = 100;
        _prevBearing = "东";
      };
      case 175: {
        _prevBearing = 170;
        _nextBearing = "南";
      };
      case 180: {
        _bearing = "南";
        _nextBearing = 185;
        _prevBearing = 175;
      };
      case 185: {
        _prevBearing = "南";
        _nextBearing = "190";
      };
      case 245:{
        _prevBearing = 240;
        _nextBearing = "西";
      };
      case 250: {
        _bearing = "西";
        _nextBearing = 255;
        _prevBearing = 245;
      };
      case 255: {
        _prevBearing = "西";
        _nextBearing = 260;
      };
      default {};
    };


    _fuelnum = round((fuel vehicle player)*100);

    /*switch(_fuelnum)do{

        case 99: {
            _fuelnumber = 10;
        };
    	case 0.9: {
    	    _fuelnumber = 9;
    	};
        case 0.8: {
            _fuelnumber = 8;
        };
        case 0.7: {
            _fuelnumber = 7;
        };
        case 0.6: {
            _fuelnumber = 6;
        };
        case 0.5: {
            _fuelnumber = 5;
        };
        case 0.4: {
            _fuelnumber = 4;
        };
        case 0.3: {
            _fuelnumber = 3;
        };
        case 0.2: {
            _fuelnumber = 2;
        };
        case 0.2: {
            _fuelnumber = 1;
        };
        case 0.0: {
            _fuelnumber = 0;
        };
    	default {};
    };*/
	
	_size = if (_currentAmmo < 1000) then {3.8} else {2.7};


	_HUD_currentAmmo  ctrlSetText format ["%1",_currentAmmo];
	_HUD_reserveAmmo  ctrlSetText format ["%1",_reserveAmmo];
	_HUD_firemode     ctrlSetStructuredText parseText format ["<t align='left' size='1'>[</t><t align='center' size='1'>%1</t><t align='right' size='1'>]</t>",_fireMode];
	_HUD_healthPoints ctrlSetText format ["%1",floor((1-(damage player))*100)];
	_HUD_grenades     ctrlSetText format ["%1m", currentZeroing player];
	_bearingDisplayCtrl ctrlSetStructuredText parseText format["<t size='1' font='PuristaMedium' color='#FFFFFF' align='center' shadow='true'>%1  |  |  |  |  %2  |  |  |  |  %3</t>",_prevBearing,_bearing,_nextBearing];
	_speedDisplayCtrl ctrlSetStructuredText parseText format["<t size='2' align='center'>%1<t size='0.8' align='center'>  KM/H</t></t>",_vehSpeed];
	_fuelDisplayCtrl ctrlSetStructuredText parseText format["<t size='2' align='center'>%1<t size='0.8' align='center'>  %%升</t></t>",_fuelnum];
	_fuelBar progressSetPosition _fuel;
	//[_currentAmmo] call client_fnc_draw;
};



