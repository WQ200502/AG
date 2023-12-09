class SunriseDialogPlayerInteraction
{
	idd = 37400;
	name= "SunriseDialogPlayerInteraction";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_Tiles";

	class controlsBackground
	{
		class Blackout : RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5};
		};
		class Tiles : RscTiles {};
	};
	
	class controls
	{				
		__EXEC(btn_y = 0.20)
		class ButtonOne : RscExtremoGui_ButtonDark
		{
			idc = 37402;
			x = 0.02;
			y = __EVAL(btn_y);
			w = 0.25;
			h = 0.05;
			onMouseEnter = "_ctrl = _this select 0;_ctrlPos = ctrlPosition _ctrl;_ctrl ctrlSetPosition [0.02 + 0.05,_ctrlPos select 1,_ctrlPos select 2,_ctrlPos select 3];_ctrl ctrlCommit 0.1;";
			onMouseExit = "_ctrl = _this select 0;_ctrlPos = ctrlPosition _ctrl;_ctrl ctrlSetPosition [0.02,_ctrlPos select 1,_ctrlPos select 2,_ctrlPos select 3];_ctrl ctrlCommit 0.1;";
			show = false;

			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 28) * 1)";	
			font = "RobotoCondensedBold";
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonTwo : ButtonOne
		{
			idc = 37403;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonThree : ButtonOne
		{
			idc = 37404;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonFour : ButtonOne
		{
			idc = 37405;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonFive : ButtonOne
		{
			idc = 37406;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonSixHalf : ButtonOne
		{
			idc = 37407;
			
			x = 0.12;
			y = __EVAL(btn_y);
			w = 0.15;
			h = 0.05;
			onMouseEnter = "_ctrl = _this select 0;_ctrlPos = ctrlPosition _ctrl;_ctrl ctrlSetPosition [0.12 + 0.05,_ctrlPos select 1,_ctrlPos select 2,_ctrlPos select 3];_ctrl ctrlCommit 0.1;";
			onMouseExit = "_ctrl = _this select 0;_ctrlPos = ctrlPosition _ctrl;_ctrl ctrlSetPosition [0.12,_ctrlPos select 1,_ctrlPos select 2,_ctrlPos select 3];_ctrl ctrlCommit 0.1;";
			show = false;
		};
		class jtimeEdit : RscExtremoGui_Edit 
		{
			idc = 37408;
			text = "1";
			show = false;
			
			x = 0.02;
			y = __EVAL(btn_y);
			w = 0.075;
			h = 0.05;
		};
		class ButtonSix : ButtonOne
		{
			idc = 37409;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonSeven : ButtonOne
		{
			idc = 37410;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonEight : ButtonOne
		{
			idc = 37411;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonNine : ButtonOne
		{
			idc = 37412;
			y = __EVAL(btn_y);
		};	
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonTen : ButtonOne
		{
			idc = 37413;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonEleven : ButtonOne
		{
			idc = 37414;
			y = __EVAL(btn_y);
		};
		__EXEC(btn_y = btn_y + 0.0575)
		class ButtonTwelve : ButtonOne
		{
			idc = 37415;
			y = __EVAL(btn_y);
		};
	};
};