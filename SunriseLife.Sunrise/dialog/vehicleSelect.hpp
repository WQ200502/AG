class SunriseDialogVehicleSelect
{
	idd = 58000;
	name="SunriseDialogVehicleSelect";
	movingEnabled = 0;
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
			
			x = 0.368722 * safezoneW + safezoneX;
			y = 0.31586 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.0876 * safezoneH;
		};
	};
	
	class controls
	{
		class Title : RscExtremoGui_HeaderBG
		{
			idc = -1;
			text = "Выберите транспорт";
			
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.594498 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
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
					
			x = 0.594498 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class Vehicles : Life_V3_RscCombo	{
			idc = 5802;
			//onLBSelChanged = "_this call SunriseClient_Fac_menuUpdate";
			
			x = 0.375322 * safezoneW + safezoneX;
			y = 0.32598 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class FacMoney : Life_V3_RscStructuredText
		{
			idc = 5803;
			text = "";
			
			x = 0.375322 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class Button : Life_V3_ButtonMenu
		{
			idc = 5804;
			text = "";
			onButtonClick = "";
			
			x = 0.4934 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};