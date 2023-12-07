class Life_cell_phone_call {
	idd = 5000;
	name= "life_cell_phone_call";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn ANZUS_fnc_cell_call";
	
	class controlsBackground {
		
		class MainBackground: Life_RscStructuredText{
			  idc = -1;
			  x = 0.318499 * safezoneW + safezoneX;
			  y = 0.159 * safezoneH + safezoneY;
			  w = 0.360937 * safezoneW;
			  h = 0.638 * safezoneH;
		};
		
	};
	
	class controls {

		class TextTime : Life_RscStructuredText
		{
			idc = 90035;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0; y = 0.165;
			w = 1; h = 0.05;
		};
		
		class TextStatusLeft : Life_RscStructuredText
		{
			idc = 90036;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.5 - (0.08 * 2) - 0.005; y = 0.165;
			w = 0.3; h = 0.05;
		};
		
		class TextStatusRight : Life_RscStructuredText
		{
			idc = 90037;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.34; y = 0.165;
			w = 1 - (0.34 * 2) - 0.02; h = 0.05;
			class Attributes {
				align = "right";
			};
		};
		
		class TextTitle : Life_RscStructuredText {
			//colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "手机状态";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes {
				align = "center";
			};
		};
		
		class TextStatus : Life_RscStructuredText {
			//colorBackground[] = {0, 0, 0, 0};
			idc = 5003;
			text = "空闲";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes {
				align = "center";
			};
		};
		
		class CallButton : Life_RscButtonInvisible 
		{
			idc = 5015;
			//text = "致电";
			//colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[true,objNull] call ANZUS_fnc_phoneCall";
			
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class HangUpButton : Life_RscButtonInvisible 
		{
			idc = 5016;
			//text = "挂断";
			//colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call ANZUS_fnc_phoneEnd";
			
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "anzuslifecore\images\phone\dialogimages\phone_background2.paa";
			x = 0.318499 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.638 * safezoneH;
		};
		
		class PlayerList : RscListbox 
		{
			idc = 5004;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.33 * safezoneH;
		};
		

		
		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "返回";
			x = 0.5 - ((6.25 / 40) / 2);
			y = 1 - 0.15;
			w = (6.25 / 40);
			h = (6.25 / 40);
		};
	};
};