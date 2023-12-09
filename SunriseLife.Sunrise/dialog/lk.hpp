class SunriseDialogLK {
	idd = 4600;
	name= "SunriseDialogLK";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call SunriseClient_gui_bluring;";
	
	class controlsBackground {		
		class padImage : RscExtremoGui_DialogBG {
			idc = 2001;
			text = "";

			x = 0;
			y = 0;
			w = 1;
			h = 0.9;
		};
		class Title : Life_V3_Title {			
			idc = -1;
			text = "Личный кабинет";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0;
			y = 0;
			w = 1;
			h = 0.08;
		};
		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.95;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";  
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.95;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class BackImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_back.paa";
			
			x = 0.9125;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class BackButton: RscPictureButtonMenu {
			idc = -1;
			text = "";  
			onButtonClick = "closeDialog 0; [] spawn SunriseClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.9125;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
	};
	
	class controls {			
		class lkText : RscStructuredText {
			idc = 4602;			
			text = "";
			sizeEx = 0.020;
			
			x = 0.0375;
			y = 0.1;
			w = 0.925;
			h = 0.68;
		};	
	};
};