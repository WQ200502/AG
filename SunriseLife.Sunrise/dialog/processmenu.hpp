class SunriseDialogProcessing {
	idd = 5000;
	name= "SunriseDialogProcessing";
	movingEnable = 0;
	enableSimulation = 1;		
	
	class controlsBackground {	
		class MainBackground:RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.303124 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.3136 * safezoneH;
			//[0.303124 * safezoneW + safezoneX,0.36 * safezoneH + safezoneY,0.39375 * safezoneW,0.3136 * safezoneH]
		};		
	};
	
	class controls {
		class Proces_menu_title: RscExtremoGui_HeaderBG {
			idc = 5001;
			text = "Proces of smth";
			x = 0.303127 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.042 * safezoneH;
			//[0.303127 * safezoneW + safezoneX,0.318 * safezoneH + safezoneY,0.39375 * safezoneW,0.042 * safezoneH]
		};
		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.679784 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
			//[0.679784 * safezoneW + safezoneX,0.3264 * safezoneH + safezoneY,0.0144375 * safezoneW,0.0252 * safezoneH]
		};

		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.679784 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		class Recipe_info: Life_V3_RscStructuredText {
			idc = 5002;
			text = "Recipe";
			x = 0.305748 * safezoneW + safezoneX;
			y = 0.3656 * safezoneH + safezoneY;
			w = 0.228374 * safezoneW;
			h = 0.2688 * safezoneH;
			//[0.305748 * safezoneW + safezoneX,0.3656 * safezoneH + safezoneY,0.228374 * safezoneW,0.2688 * safezoneH]
		};
		class Inventory_title: Life_V3_RscText {
			idc = 5009;
			text = ""; //--- ToDo: Localize;			
			x = 0.53675 * safezoneW + safezoneX;
			y = 0.3656 * safezoneH + safezoneY;
			w = 0.157502 * safezoneW;
			h = 0.028 * safezoneH;	
			//[0.53675 * safezoneW + safezoneX,0.3656 * safezoneH + safezoneY,0.157502 * safezoneW,0.028 * safezoneH]
		};
		class inventory_list: Life_V3_RscListBox {
			idc = 5003;
			x = 0.536749 * safezoneW + safezoneX;
			y = 0.3992 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.2352 * safezoneH;
			//[0.536749 * safezoneW + safezoneX,0.3992 * safezoneH + safezoneY,0.1575 * safezoneW,0.2352 * safezoneH]
		};		
		class process_edit: RscExtremoGui_Edit {
			idc = 5004;
			text = "1";
			onKeyUp = "[life_process_info] call SunriseClient_processing_update";
			
			x = 0.395 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.305748 * safezoneW + safezoneX,0.64 * safezoneH + safezoneY,0.039375 * safezoneW,0.028 * safezoneH]
		};
		class process_button: RscExtremoGui_ButtonGreen {
			idc = 5005;
			text = "Создать"; //--- ToDo: Localize;
			onButtonClick = "[life_process_info] spawn SunriseClient_processing_action";			
			
			x = 0.574813 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.118124 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.34775 * safezoneW + safezoneX,0.64 * safezoneH + safezoneY,0.118124 * safezoneW,0.028 * safezoneH]
		};
		class process_button_all: RscExtremoGui_ButtonYellow {
			idc = 5008;
			text = "Переработать все"; //--- ToDo: Localize;
			onButtonClick = "[life_process_info] spawn SunriseClient_processing_action_all";			
			
			x = 0.454062 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.118124 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.34775 * safezoneW + safezoneX,0.64 * safezoneH + safezoneY,0.118124 * safezoneW,0.028 * safezoneH]
		};	
		class ProcessBar: Life_V3_RscProcessBar {
			idc = 5006;
			x = 0.303124 * safezoneW + safezoneX;
			y = 0.6736 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.468497 * safezoneW + safezoneX,0.64 * safezoneH + safezoneY,0.225749 * safezoneW,0.028 * safezoneH]
		};	
		class process_value: Life_V3_RscProcessBarText {
			idc = 5007;
			text = ""; //--- ToDo: Localize;			
			x = 0.303124 * safezoneW + safezoneX;
			y = 0.6736 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.028 * safezoneH;
			//[0.468497 * safezoneW + safezoneX,0.64 * safezoneH + safezoneY,0.225749 * safezoneW,0.028 * safezoneH]
		};	
	};
};