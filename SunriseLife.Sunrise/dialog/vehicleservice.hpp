class SunriseDialogVehicleService {
	idd = 8400;
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[] call SunriseClient_hud_hide";
	onUnload = "[] call SunriseClient_hud_init;";
	class controlsBackground {
		class MainBackground: RscExtremoGui_DialogBG {			
			idc = -1;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.8476 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.154 * safezoneH;
		};
	};//missionconfigfile >> "SunriseDialogVehicleService"
	class Controls {
		class Title : Life_V3_Title {			
			idc = -1;
			text = "Тюнинг-сервис";
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0.25 * safezoneW + safezoneX;
			y = 0.8036 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class CloseButton : Life_V3_CloseButton {
			x = 0.726875 * safezoneW + safezoneX;
			y = 0.8146 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0251999 * safezoneH;
		};

		class ColorList : Life_V3_RscCombo 
		{
			idc = 8401;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.027 * safezoneH;
			onLBSelChanged = "_this call SunriseClient_system_vehicleServiceColorLBChange";
		};
		class MatList : Life_V3_RscCombo 
		{
			idc = 8402;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.027 * safezoneH;
			onLBSelChanged = "_this call SunriseClient_system_vehicleServiceColorLBChange";
		};
		class BoxList : Life_V3_RscCombo 
		{
			idc = 8403;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.027 * safezoneH;
			onLBSelChanged = "_this call SunriseClient_system_vehicleServiceLBChange";
		};
		
		class RSlide : RscXSliderH 
		{
			idc = 8404;
			show = false;
			x = 0.25972 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.121125 * safezoneW;
			h = 0.027 * safezoneH;
			color[] = {1,0,0,1};
			colorActive[] = {1,0,0,1};
			onSliderPosChanged = "call SunriseClient_system_vehicleServiceColorSliderPosChanged";
			sliderPosition = 0;
			sliderRange[] = {0,1.00000035};
			sliderStep = 0.00392157;
		};
		class GSlide : RscXSliderH 
		{
			idc = 8405;
			show = false;
			x = 0.25972 * safezoneW + safezoneX;
			y = 0.928 * safezoneH + safezoneY;
			w = 0.121125 * safezoneW;
			h = 0.027 * safezoneH;
			color[] = {0,1,0,1};
			colorActive[] = {0,1,0,1};
			onSliderPosChanged = "call SunriseClient_system_vehicleServiceColorSliderPosChanged";
			sliderPosition = 0;
			sliderRange[] = {0,1.00000035};
			sliderStep = 0.00392157;
		};
		class BSlide : RscXSliderH 
		{
			idc = 8406;
			show = false;
			x = 0.25972 * safezoneW + safezoneX;
			y = 0.96 * safezoneH + safezoneY;
			w = 0.121125 * safezoneW;
			h = 0.027 * safezoneH;
			color[] = {0,0,1,1};
			colorActive[] = {0,0,1,1};
			onSliderPosChanged = "call SunriseClient_system_vehicleServiceColorSliderPosChanged";
			sliderPosition = 0;
			sliderRange[] = {0,1.00000035};
			sliderStep = 0.00392157;
		};
		class RSPole : RscExtremoGui_Edit 
		{
			idc = 8407;
			show = false;
			x = 0.386563 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.021 * safezoneW;
			h = 0.0269999 * safezoneH;
			text = "0";
			onKeyDown = "call SunriseClient_system_vehicleServiceColorKeyDown";
			colorText[] = {1,0,0,1};
			
		};
		class GSPole : RscExtremoGui_Edit 
		{
			idc = 8408;
			show = false;
			x = 0.386563 * safezoneW + safezoneX;
			y = 0.928 * safezoneH + safezoneY;
			w = 0.021 * safezoneW;
			h = 0.0269999 * safezoneH;
			text = "0";
			onKeyDown = "call SunriseClient_system_vehicleServiceColorKeyDown";
			colorText[] = {0,1,0,1};
			
		};
		class BSPole : RscExtremoGui_Edit 
		{
			idc = 8409;
			show = false;
			x = 0.386563 * safezoneW + safezoneX;
			y = 0.96 * safezoneH + safezoneY;
			w = 0.021 * safezoneW;
			h = 0.0269999 * safezoneH;
			text = "0";
			onKeyDown = "call SunriseClient_system_vehicleServiceColorKeyDown";
			colorText[] = {0,0,1,1};
			
		};

		class Costs: Life_V3_RscStructuredText
		{
			idc = 8410;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.09975 * safezoneW;
			h = 0.0934 * safezoneH;
		};

		class ButtonBuy : RscExtremoGui_ButtonDark
		{
			idc = 8411;
			text = "Подтвердить";			
			onButtonClick = "[] spawn SunriseClient_system_vehicleServiceConfirm;";
			
			x = 0.646438 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.0956251 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class ButtonNitro : RscExtremoGui_ButtonDark
		{
			idc = 8413;
			text = "Установить нитро";			
			onButtonClick = "call SunriseClient_system_vehicleServiceNitro;";
			
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.125525 * safezoneW;
			h = 0.027 * safezoneH;
		};
	};
};