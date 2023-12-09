class SunriseDialogAtm {
	idd = 2700;
	name= "SunriseDialogAtm";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_Tiles";
	
	class controlsBackground {
		class Blackout : RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.25 };
		};
		class Tiles : RscTiles {};
		
		class MainBackground : RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.3658 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.311001 * safezoneH;
		};
	};
	
	class controls {
		class Title : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "$STR_ATM_Title";
			
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseButton : Life_V3_CloseButton {
			x = 0.656358 * safezoneW + safezoneX;
			y = 0.3328 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class CashInfo : Life_V3_RscStructuredText {
			idc = 2701;
			text = "";
			
			x = 0.335 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.145406 * safezoneW;
			h = 0.099 * safezoneH;
		};
				
		class WithdrawButton : RscExtremoGui_ButtonRed {
			idc = -1;
			text = "$STR_ATM_Withdraw";			
			onButtonClick = "[] call SunriseClient_atm_withdraw";
			
			x = 0.339125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class DepositButton : RscExtremoGui_ButtonGreen {
			idc = -1;
			text = "$STR_ATM_Deposit";			
			onButtonClick = "[] call SunriseClient_atm_deposit";
			
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0629063 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class GangDeposit : RscExtremoGui_ButtonGreen{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";			
			onButtonClick = "[] call SunriseClient_gangs_Deposit";

			x = 0.339125 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.136125 * safezoneW;
			h = 0.033 * safezoneH;
		};	

		class moneyEdit : RscExtremoGui_Edit {		
			idc = 2702;
			text = "1";
		
			x = 0.339125 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.137156 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class PlayerList : Life_V3_RscListBox {
			idc = 2703;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.231 * safezoneH;
		};

		class TransferEdit : RscExtremoGui_Edit {		
			idc = 2704;
			text = "1";
		
			x = 0.5 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class TransferButton : RscExtremoGui_ButtonYellow {
			idc = -1;
			text = "$STR_ATM_Transfer";			
			onButtonClick = "[] call SunriseClient_atm_transfer";
			
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};