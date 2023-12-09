class SunriseDialogResCapture {
	idd = 4500;
	name= "SunriseDialogResCapture";
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
		class Title : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "Меню захвата переработок";
			
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
		
	class Controls
	{
		class Title : RscTitle 
		{
			idc = -1;
			x = 0.01749881;
			y = 0.1;
			w = 0.94500001;
			h = 0.04;
			text = "Битва за переработку";
			colorBackground[] = {1,1,1,0.1};
			
		};
		class ResCaptureList : RscListBox 
		{
			idc = 4501;
			x = 0.01749881;
			y = 0.16;
			w = 0.29500002;
			h = 0.68;
			onLBSelChanged = "[] call SunriseClient_system_ResCaptureInfo";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class PardonButtonKey : RscButtonUC 
		{
			idc = 4505;
			show = "false";
			x = 0.325001;
			y = 0.78;
			w = 0.637501;
			h = 0.06;
			text = "Принять участие в битве за этот ресурс";
			onButtonClick = "[] spawn SunriseClient_system_resCaptureManage;";
			
		};
		class ProcInfo : RscStructuredText 
		{
			type = 13;
			idc = 4502;
			x = 0.33000008;
			y = 0.16000011;
			w = 0.63000003;
			h = 0.56000004;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0.5};
			class Attributes
			{
				
			};
			
		};
		
	};
	
};
