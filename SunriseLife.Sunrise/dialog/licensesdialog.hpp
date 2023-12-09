class SunriseDialogLicenseShop {
	idd = 5546;
	name= "SunriseDialogLicenseShop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_Tiles";	

	class controlsBackground
	{
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.25 };
		};
		class Tiles: RscTiles {};
		
		class MainBackground : RscExtremoGui_DialogBG {			
			idc = -1;
			
			x = 0.309687 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.380625 * safezoneW;
			h = 0.448 * safezoneH;
		};
	};

	class controls { 
		class Title: Life_V3_Title {
			idc = -1;
			text = "Магазин лицензий"; //--- ToDo: Localize;
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.309687 * safezoneW + safezoneX;
			y = 0.1948 * safezoneH + safezoneY;
			w = 0.380625 * safezoneW;
			h = 0.042 * safezoneH;			
		};

		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.673249 * safezoneW + safezoneX;
			y = 0.2032 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.673249 * safezoneW + safezoneX;
			y = 0.2032 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
 
		class ShopLic: Life_V3_RscListBox {
			idc = 55126;
			x = 0.313626 * safezoneW + safezoneX;
			y = 0.2396 * safezoneH + safezoneY;
			w = 0.186375 * safezoneW;
			h = 0.4032 * safezoneH;
		};

		class MyLic: Life_V3_RscListBox {
			idc = 55131;
			x = 0.502623 * safezoneW + safezoneX;
			y = 0.2396 * safezoneH + safezoneY;
			w = 0.185061 * safezoneW;
			h = 0.4368 * safezoneH;
		};

		class buybutton: RscExtremoGui_ButtonGreen {
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call SunriseClient_system_buyLicense";

			x = 0.313626 * safezoneW + safezoneX;
			y = 0.6484 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.028 * safezoneH;			
		};
	};
};