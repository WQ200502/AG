class SunriseDialogChopShop {
	idd = 39400;
	name= "SunriseDialogChopShop";
	movingEnable = 0;
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

			colorBackground[] = { 0, 0, 0, 0.25 };
		};
		class Tiles: RscTiles {};
		
		class MainBackground:RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.4088 * safezoneH;
		};
	};
	
	class controls {
		class Title : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "$STR_ChopShop_Title";
			
			x = 0.395 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseButton : Life_V3_CloseButton {
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class vehicleList : Life_V3_RscListBox 
		{
			idc = 39402;
			text = "";
			onLBSelChanged = "_this call SunriseClient_system_chopShopSelection";
			
			x = 0.398934 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.267001 * safezoneH;
		};
		

		class Price : Life_V3_RscStructuredText 
		{
			idc = 39401;
			text = "";	
			
			x = 0.398934 * safezoneW + safezoneX;
			y = 0.603 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.0792 * safezoneH;
		};
		
		class ButtonSell : RscExtremoGui_ButtonRed
		{
			idc = 39405;
			text = "$STR_Global_Sell";			
			onButtonClick = "[] call SunriseClient_system_chopShopSell";
			
			x = 0.398009 * safezoneW + safezoneX;
			y = 0.69008 * safezoneH + safezoneY;
			w = 0.100687 * safezoneW;
			h = 0.0308 * safezoneH;

		};	
		
		class ButtonChop : RscExtremoGui_ButtonGreen
		{
			idc = 39404;
			text = "Перебить";			
			onButtonClick = "[] spawn SunriseClient_system_chopShopOwn";
			
			x = 0.501031 * safezoneW + safezoneX;
			y = 0.69008 * safezoneH + safezoneY;
			w = 0.100687 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};