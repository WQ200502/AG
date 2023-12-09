class SunriseDialogLtdMain {
	idd = 7300;
	name= "SunriseDialogLtdMain";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_Tiles";
	
	class controlsBackground {	
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		class Tiles: RscTiles {};

		class padImage : RscPicture {
			idc = 7301;
			text = "";
			
			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};

		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [] spawn SunriseClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.375001;
			y = 0.86;
			w = 0.0624999;
			h = 0.06;
		};
		
		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.462499;
			y = 0.86;
			w = 0.075;
			h = 0.06;
		};		
	};
	
	class controls {
		class ltdInfo: RscStructuredText
		{
			idc = 7302;
			text = "";

			x = 0.0375;
			y = 0.096;
			w = 0.6;
			h = 0.74;
		};		

		class b_takeMoney: RscButton
		{
			idc = 7303;
			text = "Вывести на счет в банк";
			onButtonClick = "[] call SunriseClient_ltd_takeMoneyAction";
			//onButtonClick = "hint 'Включим сегодня в 20:00'";

			x = 0.65;
			y = 0.0960001;
			w = 0.3125;
			h = 0.06;
		};
	};
};