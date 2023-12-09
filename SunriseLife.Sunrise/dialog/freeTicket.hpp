class SunriseDialogFreeTicketGive
{
	idd = 5200;
	name = "SunriseDialogFreeTicketGive";
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

		class MainBackground:RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.112 * safezoneH;
		};
	};
	
	class controls 
	{
		class Title : Life_V3_Title {			
			idc = 5201;
			text = "";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.591875 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
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
					
			x = 0.591875 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class t_cost: Life_V3_RscText {
			idc = -1;
			text = "$STR_Ticket_Total"; //--- ToDo: Localize;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0459375 * safezoneW;
			h = 0.028 * safezoneH;			
		};
		
		class moneyEdit : RscExtremoGui_Edit {
			idc = 5202;			
			text = "100";

			x = 0.427812 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class cost_message: Life_V3_RscText {
			idc = -1;
			text = "$STR_Ticket_TotalMax"; //--- ToDo: Localize;
			x = 0.486874 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class payTicket: RscExtremoGui_ButtonDark {
			idc = -1;
			text = "$STR_Ticket_GiveTicket";			
			onButtonClick = "[] call SunriseClient_tickets_Give";
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};

class SunriseDialogFreeTicketPay
{
	idd = 5300;
	name = "SunriseDialogFreeTicketPay";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground {	
		class MainBackground:RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.3292 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.14 * safezoneH;
		};
	};
	
	class controls 
	{
		class title: Life_V3_Title {
			idc = -1;
			text = "$STR_Ticket_PromtTitle"; //--- ToDo: Localize;
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

		class InfoMsg : Life_V3_RscStructuredText
		{
			idc = 5301;
			text = "";

			x = 0.349063 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.07 * safezoneH;
		};

		class payTicket: Life_V3_ButtonMenu {
			idc = -1;
			text = "$STR_Ticket_PayTicket";
			
			onButtonClick = "[] call SunriseClient_tickets_Pay;";
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};