class SunriseDialogFactoryOrder
{
	idd = 7900;
	name = "SunriseDialogFactoryOrder";
	movingEnabled = 0;
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

	
		class MainBackground: RscExtremoGui_DialogBG {
			idc = -1;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.14 * safezoneH;			
		};
	};
	
	class controls 
	{
		class Title : Life_V3_Title {			
			idc = 7901;
			text = "";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.606308 * safezoneW + safezoneX;
			y = 0.2984 * safezoneH + safezoneY;
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
					
			x = 0.606308 * safezoneW + safezoneX;
			y = 0.2984 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class t_cost: Life_V3_RscText {
			idc = -1;
			text = "Количество:";
			x = 0.351685 * safezoneW + safezoneX;
			y = 0.3376 * safezoneH + safezoneY;
			w = 0.0616875 * safezoneW;
			h = 0.042 * safezoneH;			
		};
		class e_cost: RscExtremoGui_Edit {
			idc = 7902;
			text = "100";
			x = 0.418631 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.028 * safezoneH;			
		};
		class cost_message: Life_V3_RscText	{
			idc = -1;
			text = "Максимум - 500 штук";
			x = 0.49475 * safezoneW + safezoneX;
			y = 0.3376 * safezoneH + safezoneY;
			w = 0.123375 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class t_message: Life_V3_RscText {
			idc = 7903;
			text = "Сообщение какое-нибудь";
			x = 0.351685 * safezoneW + safezoneX;
			y = 0.3796 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.042 * safezoneH;			
		};

		class b_send: Life_V3_ButtonMenu {
			idc = -1;
			text = "Оставить заказ";
			onButtonClick = "[] call SunriseClient_factory_order";
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};
class SunriseDialogFactoryShop {
	idd = 2400;
	name= "SunriseDialogFactoryShop";
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
		class Title : Life_V3_Title {			
			idc = 2401;
			text = "";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.395 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.585312 * safezoneW + safezoneX;
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
					
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class pItemlist : Life_V3_RscListBox 
		{
			idc = 2402;
			text = "";	
			
			x = 0.398934 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.322 * safezoneH;
		};	

		class sellEdit : RscExtremoGui_Edit 
		{
			idc = 2403;			
			text = "1";
			x = 0.398938 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class ButtonSell : Life_V3_ButtonMenu
		{
			idc = -1;
			text = "$STR_VS_SellItem";			
			onButtonClick = "[] call SunriseClient_factory_vehicleSell";
			
			x = 0.454057 * safezoneW + safezoneX;
			y = 0.6512 * safezoneH + safezoneY;
			w = 0.148309 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		
		class ButtonSellAll : Life_V3_ButtonMenu
		{
			idc = -1;
			text = "Продать всё";			
			onButtonClick = "[true] call SunriseClient_factory_vehicleSell";
			
			x = 0.397997 * safezoneW + safezoneX;
			y = 0.690178 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};