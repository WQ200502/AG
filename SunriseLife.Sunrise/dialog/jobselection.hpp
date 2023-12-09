class SunriseDialogJobSelection {
	idd = 7000;
	name= "SunriseDialogJobSelection";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring";
	
	class controlsBackground {		
		class MainBackground:RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.378 * safezoneH;
		};
	};
	
	class controls {
		class Title : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "Биржа труда";
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.566936 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
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
					
			x = 0.566936 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class targetInfo: Life_V3_RscStructuredText
		{
			idc = 7001;			
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.3712 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.1176 * safezoneH;
		};
		class TextShow : RscControlsGroup {
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.228199 * safezoneH;	
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class b1: RscExtremoGui_ButtonDark
				{
					idc = 7002;
					text = ""; //--- ToDo: Localize;
					y = 0;
					w = 0.170625 * safezoneW;
					h = 0.028 * safezoneH;			
				};
		
				class b2: b1
				{
					idc = 7003;
					y = 0.0610909;
				};
				class b3: b1
				{
					idc = 7004;
					y = 0.122182;
				};
				class b4: b1
				{
					idc = 7005;
					y = 0.183273;
				};
				class b5: b1
				{
					idc = 7006;
					y = 0.244364;
				};
				class b6: b1
				{
					idc = 7007;
					y = 0.305454;
				};
				class b7: b1
				{
					idc = 7008;
					y = 0.366545;
				};
				class b8: b1
				{
					idc = 7009;
					y = 0.427636;
				};
				class b9: b1
				{
					idc = 7010;
					y = 0.488727;
				};
				//y = y + 0.0610909;
			};
		};
	};
};