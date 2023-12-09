class SunriseDialogVehicleShopV2
{
	idd = 2300;
	name="SunriseDialogVehicleShopV2";
	movingEnabled = 0;
	enableSimulation = 1;
	//onLoad = "ctrlShow [2330,false];";
	onLoad = "[] call SunriseClient_hud_hide";
	onUnload = "[] call SunriseClient_hud_init;";
	
	class controlsBackground
	{	
		class LeftBackground : RscExtremoGui_DialogBG
		{
			idc = -1;
			
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.052 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.938 * safezoneH;
			//["0.00256251 * safezoneW + safezoneX","0.052 * safezoneH + safezoneY","0.18375 * safezoneW","0.938 * safezoneH"]
		};
	};
	
	class controls
	{
		class Title : Life_V3_Title {
			idc = 2301;
			text = "";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.00440001 * safezoneH + safezoneY;
			w = 0.994876 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
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
					
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		
		class VehicleList : Life_V3_RscListBox {
			idc = 2300;
			text = "";		
			onLBSelChanged = "_this call SunriseClient_system_vehicleShopLBChange";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.3012 * safezoneH + safezoneY;
			w = 0.175875 * safezoneW;
			h = 0.5824 * safezoneH;
		};
		
		class ColorList : Life_V3_RscCombo	{
			idc = 2304;
			onLBSelChanged = "_this call SunriseClient_system_vehicleShopColorLBChange";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.8892 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class MatList : Life_V3_RscCombo	{
			idc = 2305;
			onLBSelChanged = "_this call SunriseClient_system_vehicleShopColorLBChange";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.92 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class vehicleInfomationList : Life_V3_RscStructuredText {
			idc = 2303;
			text = "";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.238 * safezoneH;		
		};
		
		class RentCar : RscExtremoGui_ButtonYellow {
			idc = 2310;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[true] spawn SunriseClient_system_vehicleShopBuy;";
			
			x = 0.0970625 * safezoneW + safezoneX;
			y = 0.9536 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class BuyCar : RscExtremoGui_ButtonGreen {
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[false] spawn SunriseClient_system_vehicleShopBuy;";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.9536 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class RSlide : RscXSliderH 
		{
			idc = 2311;
			x = safeZoneX + safeZoneW * 0.198125;
			y = safeZoneY + safeZoneH * 0.822;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.027;
			color[] = {1,0,0,1};
			colorActive[] = {1,0,0,1};
			onSliderPosChanged = "call SunriseClient_system_vehicleShopColorSliderPosChanged";
			sliderPosition = 0;
			sliderRange[] = {0,1.00000035};
			sliderStep = 0.00392157;
			//["safeZoneX + safeZoneW * 0.198125","safeZoneY + safeZoneH * 0.85","safeZoneW * 0.15","safeZoneH * 0.027"]
		};
		class GSlide : RscXSliderH 
		{
			idc = 2312;
			x = safeZoneX + safeZoneW * 0.198125;
			y = safeZoneY + safeZoneH * 0.864;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.027;
			color[] = {0,1,0,1};
			colorActive[] = {0,1,0,1};
			onSliderPosChanged = "call SunriseClient_system_vehicleShopColorSliderPosChanged";
			sliderPosition = 0;
			sliderRange[] = {0,1.00000035};
			sliderStep = 0.00392157;
			//["0.817 * safezoneW + safezoneX","0.43 * safezoneH + safezoneY","0.15 * safezoneW","0.027 * safezoneH"]
		};
		class BSlide : RscXSliderH 
		{
			idc = 2313;
			x = safeZoneX + safeZoneW * 0.198125;
			y = safeZoneY + safeZoneH * 0.906;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.027;
			color[] = {0,0,1,1};
			colorActive[] = {0,0,1,1};
			onSliderPosChanged = "call SunriseClient_system_vehicleShopColorSliderPosChanged";
			sliderPosition = 0;
			sliderRange[] = {0,1.00000035};
			sliderStep = 0.00392157;
			//["0.817 * safezoneW + safezoneX","0.46 * safezoneH + safezoneY","0.15 * safezoneW","0.027 * safezoneH"]
		};
		class RSPole : RscExtremoGui_Edit 
		{
			idc = 2314;
			x = safeZoneX + safeZoneW * 0.355625;
			y = safeZoneY + safeZoneH * 0.822;
			w = safeZoneW * 0.021;
			h = safeZoneH * 0.027;
			text = "0";
			onKeyDown = "call SunriseClient_system_vehicleShopColorKeyDown";
			colorText[] = {1,0,0,1};
		};
		class GSPole : RscExtremoGui_Edit 
		{
			idc = 2315;
			x = safeZoneX + safeZoneW * 0.355625;
			y = safeZoneY + safeZoneH * 0.864;
			w = safeZoneW * 0.021;
			h = safeZoneH * 0.027;
			text = "0";
			onKeyDown = "call SunriseClient_system_vehicleShopColorKeyDown";
			colorText[] = {0,1,0,1};
			
		};
		class BSPole : RscExtremoGui_Edit 
		{
			idc = 2316;
			x = safeZoneX + safeZoneW * 0.355625;
			y = safeZoneY + safeZoneH * 0.906;
			w = safeZoneW * 0.021;
			h = safeZoneH * 0.027;
			text = "0";
			onKeyDown = "call SunriseClient_system_vehicleShopColorKeyDown";
			colorText[] = {0,0,1,1};
			
		};
		
		class BoxList : Life_V3_RscCombo
		{
			idc = 2317;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.864;
			w = safeZoneW * 0.173;
			h = safeZoneH * 0.027;
			onLBSelChanged = "_this call SunriseClient_system_vehicleShopBoxLBChange";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};	
		};
	};
};