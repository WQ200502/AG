class SunriseDialogAdac {
	idd = 3700;
	name= "SunriseDialogAdac";
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
			text = "Меню тюнинга";
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
	
		class Title : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 3701;
			text = "";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		class CarStatus : RscStructuredText
		{
			idc = 3702;			
			text = "";
			sizeEx = 0.020;
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0374988;
			y = 0.16;
			w = 0.925;
			h = 0.38;
		};
		
		class BoxAddRemoveTitle : RscStructuredText
		{
			idc = 3703;			
			text = "Коробки";
			sizeEx = 0.020;
			
			x = 0.0374988;
			y = 0.58;
			w = 0.125;
			h = 0.04;
		};
		
		
		class BoxAddButton : RscButtonMenu {
			idc = 3704;
			text = "Установить";
			style = 1;
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "";
			
			x = 0.175;
			y = 0.58;
			w = 0.2125;
			h = 0.04;
		};
		
		class BoxRemoveButton : RscButtonMenu {
			idc = 3705;
			text = "Убрать";
			style = 1;
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "";
			
			x = 0.4;
			y = 0.58;
			w = 0.2125;
			h = 0.04;
		};
		
				
		class NitroAddRemoveTitle : RscStructuredText
		{
			idc = 3706;
			text = "Нитро: ";
			sizeEx = 0.020;
			
			x = 0.0374988;
			y = 0.64;
			w = 0.125;
			h = 0.04;
		};
		
		class NitroAddRemoveButton : RscButtonMenu {
			idc = 3707;
			text = "Установить";
			style = 1;
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "";
			
			x = 0.175;
			y = 0.64;
			w = 0.2125;
			h = 0.04;
		};		
		
		class ColorTitle : RscStructuredText
		{
			idc = 3708;
			text = "Цвет: ";
			sizeEx = 0.020;
			
			x = 0.0374988;
			y = 0.7;
			w = 0.125;
			h = 0.04;
		};
		
		class ColorList : RscCombo
		{
			idc = 3709;
			
			x = 0.175;
			y = 0.7;
			w = 0.2125;
			h = 0.04;
		};
		
		class ColorButton : RscButtonMenu {
			idc = 3710;
			text = "Покрасить";
			style = 1;
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] call SunriseClient_adac_Recolor";
			
			x = 0.4;
			y = 0.7;
			w = 0.2125;
			h = 0.04;
		};	


		class MaterialTitle : RscStructuredText
		{
			idc = 3712;
			text = "Материал: ";
			sizeEx = 0.020;
			
			x = 0.0375;
			y = 0.76;
			w = 0.125;
			h = 0.04;
		};
		
		class MaterialList : RscCombo
		{
			idc = 3713;
			
			x = 0.175;
			y = 0.76;
			w = 0.2125;
			h = 0.04;
		};
		
		class MaterialButton : RscButtonMenu {
			idc = 3714;
			text = "Применить";
			style = 1;
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] call SunriseClient_adac_Rematerial";
			
			x = 0.4;
			y = 0.76;
			w = 0.2125;
			h = 0.04;
		};
		
	};
};