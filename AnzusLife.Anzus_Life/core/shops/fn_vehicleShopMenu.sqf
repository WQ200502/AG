#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah
*/

params [
    ["_shop","",[""]],
    ["_shopFlag","",[""]],
    ["_shopTitle","",[""]],
    ["_disableBuy",false,[true]]
];

disableSerialization;

//Long boring series of checks
if (dialog) exitWith {};
if (_shop isEqualTo "") exitWith {};

private _conditions = M_CONFIG(getText,"CarShops",_shop,"conditions");
if !([_conditions] call ANZUS_fnc_levelCheck) exitWith {[localize "STR_Shop_Veh_NotAllowed",true,"slow"] call ANZUS_fnc_notificationSystem;};

createDialog "AnzusLife_VehicleShop";

_gay = [];
switch (_shop) do { 
    case "civ_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_haohua" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_chev" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_jag" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_exotic" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_motorbike" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_dodge" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_ford" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_merc" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_bmw" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_truck" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "civ_ship" : {_gay = LIFE_SETTINGS(getArray,"BoatShopSpawns")};
    case "civ_air" : {_gay = LIFE_SETTINGS(getArray,"AirShopSpawns")};
    case "med_shop" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "med_air_hs" : {_gay = LIFE_SETTINGS(getArray,"AirShopSpawns")};
    case "med_ship" : {_gay = LIFE_SETTINGS(getArray,"BoatShopSpawns")};
    case "cop_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "rebel_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "sheriff_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "uc_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};
    case "swat_car" : {_gay = LIFE_SETTINGS(getArray,"CarShopSpawns")};	
    case "cop_air" : {_gay = LIFE_SETTINGS(getArray,"AirShopSpawns")};
    case "cop_boat" : {_gay = LIFE_SETTINGS(getArray,"BoatShopSpawns")};
};

_markerName = [];
{
    if ((player distance (getMarkerPos _x)) <= 50) then {
        _markerName pushBack _x;
    };
} forEach _gay;

private _new = _markerName;
if (count _new isEqualTo 0) exitWith {["没有可用的生成点，请让开发人员知道此商店没有生成。","true","slow"] call ANZUS_fnc_notificationSystem; closeDialog 0;};

private _spawnPoints = _new;
life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.
ctrlSetText [8000241,_shopTitle + " - (Press H to hide store interface.)"];

if (_disableBuy) then {
    //Disable the buy button and insurance.
    ctrlEnable [8000256,false];
    ctrlEnable [8000254,false];
};
private _display = findDisplay 8000240;
private _ctrlInsuranceCheckbox = _display displayCtrl 8000256;
_ctrlInsuranceCheckbox cbSetChecked false;

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");

private _vehicleTree = CONTROL(8000240,8000243);
tvClear _vehicleTree;

//Loop through
{
    _x params["_className"];

    private _toShow = [_x] call ANZUS_fnc_levelCheck;

    if (_toShow) then {
        _vehicleInfo = [_className] call ANZUS_fnc_fetchVehInfo;
        private _vehicleDisplayPicture = _vehicleInfo select 2;
        private _vehicleDisplayName = _vehicleInfo select 3;

        private _index = _vehicleTree tvAdd [[], _vehicleDisplayName];
        _vehicleTree tvSetPicture [[_index], _vehicleDisplayPicture];

        private _maxSpeed = _vehicleInfo select 8;
        private _armor = _vehicleInfo select 9;
        private _seats = _vehicleInfo select 10;
        private _hp = _vehicleInfo select 11;
        private _fuel = _vehicleInfo select 12;
        private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

        private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
        private _buyMultiplier = 0;

        switch (playerSide) do {
            case civilian: {
                _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_CIVILIAN");
            };
            case west: {
                _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_COP");
            };
            case independent: {
                _buyMultiplier = getNumber(_shopSettings >> "vehicle_purchase_multiplier_MEDIC");
            };
        };



        private _purchasePrice = round(_initalPrice * _buyMultiplier);
        private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

        // Set data
        private _data = format
        [
            "[""%1"",""%2"",%3,%4,%5,%6,%7,%8,%9,""%10""]",
            _vehicleDisplayName,
            _vehicleDisplayPicture,
            _maxSpeed,
            _armor,
            _seats,
            _hp,
            _fuel,
            _purchasePrice,
            _trunkSpace,
            _className
        ];
        _vehicleTree tvSetData [[_index], _data];
    };
} forEach _vehicleList;

_vehicleTree ctrlAddEventHandler ["TreeSelChanged", {
    params [["_ctrl",controlNull,[controlNull]], ["_selectionPath", [], [[]]]];
    private _display = ctrlParent _ctrl;

    private _tvData = _ctrl tvData _selectionPath;
    if (_tvData isEqualTo "") exitWith {};

    private _vehicleData = parseSimpleArray _tvData;
    _vehicleData params
    [
        ["_vehicleDisplayName", "", [""]],
        ["_vehiclePreview", "", [""]],
        ["_maxSpeed", 0, [0]],
        ["_armor", 0, [0]],
        ["_seats", 0, [0]],
        ["_hp", 0, [0]],
        ["_fuel", 0, [0]],
        ["_purchasePrice", 0, [0]],
        ["_trunkSpace", 0, [0]],
        ["_className", "", [""]]
    ];

    private _ctrlTextName = _display displayCtrl 8000245;
    private _ctrlTextNameSecond = _display displayCtrl 8000242;
    private _ctrlTextPrice = _display displayCtrl 8000246;
    private _ctrlTextMaxSpeed = _display displayCtrl 8000247;
    private _ctrlTextHorsePower = _display displayCtrl 8000248;
    private _ctrlTextPassengerSeats = _display displayCtrl 8000249;
    private _ctrlTextTrunkSpace = _display displayCtrl 8000250;
    private _ctrlTextFuel = _display displayCtrl 8000251;
    private _ctrlTextArmor = _display displayCtrl 8000252;
    private _ctrlStructuredTextPreview = _display displayCtrl 8000244;
    private _ctrlInsuranceCheckbox = _display displayCtrl 8000256;
    private _insured = [0,1] select (cbChecked _ctrlInsuranceCheckbox);
    private _insureMultiplier = (getNumber((MAIN_SETTINGS("Shops","Vehicle")) >> "vehicle_insurnace_price_l1")) + 1;

    if(_insured isEqualTo 1) then {
        _purchasePrice = round(_purchasePrice * _insureMultiplier);
    };

    private _formattedPricePurchase = [_purchasePrice] call ANZUS_fnc_numberText;

    _ctrlTextName ctrlSetText _vehicleDisplayName;
    _ctrlTextNameSecond ctrlSetText _vehicleDisplayName;
    _ctrlTextPrice ctrlSetText ("$" + _formattedPricePurchase);
    _ctrlTextMaxSpeed ctrlSetText (str _maxSpeed + " km/h");
    _ctrlTextHorsePower ctrlSetText str _hp;
    _ctrlTextPassengerSeats ctrlSetText str _seats;
    _ctrlTextTrunkSpace ctrlSetText str _trunkSpace;
    _ctrlTextFuel ctrlSetText (str _fuel + " litres");
    _ctrlTextArmor ctrlSetText str _armor;
    _ctrlStructuredTextPreview ctrlSetStructuredText parseText format ["<br/><img image='%1' size='%2' align='center' />", _vehiclePreview, 2.5 * safezoneH];


    if !(isNil "life_3dPreview_camera" || {isNull life_3dPreview_camera}) then {
    private _isInCfg = (isClass (configFile >> "CfgVehicles" >> _className));
    if (_isInCfg) then {
        if (isNull life_3dPreview_object || {!(_className isEqualTo typeOf life_3dPreview_object)}) then {
            if (!isNull life_3dPreview_object) then {deleteVehicle life_3dPreview_object;};
            _object = createSimpleObject [_className, [0,0,0], true];
            if (isNull _object) exitWith {diag_log format ["3dPreview - problem creating object: %1", _className]};
            life_3dPreview_object = _object;
            life_3dPreview_object enableSimulation false;
            life_3dPreview_object setPos [0,0,9998];
            life_3dPreview_object setVectorUp [0, 0, 1];
            private _bodyDiagonal = [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2] distance [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2];
            private _distance = _bodyDiagonal * 2;
            life_3dPreview_camera_target = getPos _object;
            life_3dPreview_camera camSetTarget life_3dPreview_camera_target;
            life_3dPreview_camera camSetPos (_object modelToWorld [0, _distance, 1.9]);
            life_3dPreview_camera setVectorUp [0, 0, 1.2];
            life_3dPreview_camera camCommit 0;
            life_3dPreview_camera_mag = vectorMagnitude (life_3dPreview_object worldToModel (getPos life_3dpreview_camera));
            life_3dPreview_camera_zoom = life_3dPreview_camera_mag;
            life_3dPreview_object setPos [(getPos life_3dpreview_object) select 0,(getPos life_3dpreview_object) select 1,((getPos life_3dpreview_object) select 2) + 1.3];
        };
    };
};

    private _shopSettings = MAIN_SETTINGS("Shops","Vehicle");
    if (_className in (getArray(_shopSettings >> "vehicleShop_rentalOnly"))) then {
        ctrlEnable [8000254,false];
        ctrlEnable [8000253,true];
        
    } else {
        if (!(life_veh_shop select 3)) then {
            ctrlEnable [8000254,true];
        };
    };
}];

_vehicleTree tvSetCurSel [0];
tvExpandAll _vehicleTree;


_ctrlInsuranceCheckbox ctrlAddEventHandler ["CheckedChanged",{
    params ["_control", "_checked"];
    _display = ctrlParent _control;
    _tree = _display displayCtrl 8000243;

    _selectionPath = tvCurSel _tree;

    private _tvData = _tree tvData _selectionPath;
    if (_tvData isEqualTo "") exitWith {};

    private _vehicleData = parseSimpleArray _tvData;
    _vehicleData params
    [
        ["_vehicleDisplayName", "", [""]],
        ["_vehiclePreview", "", [""]],
        ["_maxSpeed", 0, [0]],
        ["_armor", 0, [0]],
        ["_seats", 0, [0]],
        ["_hp", 0, [0]],
        ["_fuel", 0, [0]],
        ["_purchasePrice", 0, [0]],
        ["_trunkSpace", 0, [0]],
        ["_className", "", [""]]
    ];
    private _insureMultiplier = (getNumber((MAIN_SETTINGS("Shops","Vehicle")) >> "vehicle_insurnace_price_l1")) + 1;

    if(_checked isEqualTo 1) then {
        _purchasePrice = round(_purchasePrice * _insureMultiplier);
    };
    
    private _ctrlTextPrice = _display displayCtrl 8000246;
    private _formattedPricePurchase = [_purchasePrice] call ANZUS_fnc_numberText;

    _ctrlTextPrice ctrlSetText ("$" + _formattedPricePurchase);

}];

private _ctrlButtonRentVehicle = _display displayCtrl 8000253;
_ctrlButtonRentVehicle ctrlEnable false;
_ctrlButtonRentVehicle ctrlAddEventHandler ["ButtonClick", {[false] spawn ANZUS_fnc_vehicleShopBuy;}];

private _ctrlButtonPurchaseVehicle = _display displayCtrl 8000254;
_ctrlButtonPurchaseVehicle ctrlAddEventHandler ["ButtonClick", {[true] spawn ANZUS_fnc_vehicleShopBuy;}];
    
life_3dPreview_position = [0, 0, 10000];
// create camera
life_3dPreview_camera = "camera" camCreate [0, 0, 9998];
life_3dPreview_camera cameraEffect ["Internal", "BACK"];
life_3dPreview_camera camSetFocus [-1, -1];
showCinemaBorder false;
life_3dPreview_camera camCommit 0;
// create light
life_3dPreview_light = "#lightpoint" createVehicleLocal life_3dPreview_position;
life_3dPreview_light setLightBrightness 0.5;
life_3dPreview_light setLightColor [1, 1, 1];
life_3dPreview_light setLightAmbient [1, 1, 1];
// set initial values for global vars
life_3dPreview_camera_mag = 0;
life_3dPreview_camera_zoom = 0;
life_3dPreview_camera_target = [];
life_3dPreview_object = objNull;
life_3dPreview_dragging = false;

life_3dPreview_evh_down = _display displayAddEventHandler ["MouseButtonDown", {life_3dPreview_dragging = true}];
life_3dPreview_evh_up = _display displayAddEventHandler ["MouseButtonUp", {life_3dPreview_dragging = false}];


life_3dPreview_evh_move = _display displayAddEventHandler ["MouseMoving", {
    params ["", "_dx", "_dy"];
    if (life_3dPreview_dragging) then {
        private _dir = vectorDir life_3dPreview_object;
        private _newdir = [(_dir select 0) * cos _dx - (_dir select 1) * sin _dx, (_dir select 0) * sin _dx + (_dir select 1) * cos _dx, 0];
        life_3dPreview_object setVectorDir vectorNormalized _newdir;
    };
}];

life_3dPreview_evh_zoom = _display displayAddEventHandler ["MouseZChanged", {
    params ["", "_scroll"];
    private _max = life_3dPreview_camera_mag;
    private _object = life_3dPreview_object;
    private _bodyDiagonal = [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2] distance [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2];
    private _min = _bodyDiagonal + 1;
    private _step = (_max - _min) / 10;
    private _oldPos = getPos life_3dPreview_camera;
    life_3dPreview_camera_zoom = _min max (life_3dPreview_camera_zoom - (_step * (abs (_scroll) / _scroll)));
    life_3dPreview_camera_zoom = _max min life_3dPreview_camera_zoom;
    if (life_3dPreview_camera_zoom >= _max || {life_3dPreview_camera_zoom <= _min}) exitWith {};
    private _newPos = life_3dPreview_camera_target vectorAdd ((vectorNormalized ((getPos life_3dPreview_camera) vectorDiff life_3dPreview_camera_target)) vectorMultiply life_3dPreview_camera_zoom);
    life_3dPreview_camera camSetPos _newPos;
    life_3dPreview_camera camCommit 0.15;
}];