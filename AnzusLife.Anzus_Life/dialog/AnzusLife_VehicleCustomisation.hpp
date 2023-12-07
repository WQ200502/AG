class AnzusLife_VehicleCustomisation {
    idd = 91002400;
    name= "AnzusLife_VehicleCustomisation";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "uiNamespace setVariable ['OriginalTexture', (getObjectTextures (vehicle player))];";
    class controls {
   		class BACKGROUND: Life_RscBackground
		{
			idc = 2200;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class HEADER: ANZUS_ctrlStaticHeader
		{
			idc = 1003;
			text = "车辆定制"; //--- ToDo: Localize;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.3262 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class BACKGROUNDBOTTOM: Life_RscBackground
		{
			idc = 2201;
			x = 0.157625 * safezoneW + safezoneX;
			y = 0.5154 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.7};
		};
		class BACKGROUNDTOP: Life_RscBackground
		{
			idc = 2202;
			x = 0.156594 * safezoneW + safezoneX;
			y = 0.3504 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.154 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.7};
		};

		class COLORPREVIEW: Life_RscPicture
		{
			idc = 2209;
			x = 0.163813 * safezoneW + safezoneX;
			y = 0.4626 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			text = "";
		};

		class RedSlider: life_RscXSliderH
		{
			idc = 1900;
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "_this call ANZUS_fnc_ambienceSliderChange;";
		};
		class GreenSlider: life_RscXSliderH
		{
			idc = 1901;
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "_this call ANZUS_fnc_ambienceSliderChange;";
		};
		class BlueSlider: life_RscXSliderH
		{
			idc = 1902;
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "_this call ANZUS_fnc_ambienceSliderChange;";
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "红色"; //--- ToDo: Localize;
			x = 0.168969 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "绿色"; //--- ToDo: Localize;
			x = 0.166907 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "蓝色"; //--- ToDo: Localize;
			x = 0.167939 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class PlateSelection: Life_RscEdit
		{
			idc = 1400;
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.5506 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			text = "输入自定义号牌";
		};
		class RscButtonMenu_2400: ANZUS_ctrlDefaultButton
		{
			idc = 2400;
			text = "保存颜色"; //--- ToDo: Localize;
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonDown = "call ANZUS_fnc_ambienceSaveColour;";
		};
		class RscButtonMenu_2401: ANZUS_ctrlDefaultButton
		{
			idc = 2401;
			text = "保存号牌"; //--- ToDo: Localize;
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonDown = "call ANZUS_fnc_changePlate;";
		};

		class RscButtonMenu_2401111: ANZUS_ctrlDefaultButton
		{
			idc = 2409;
			text = "重置车辆"; //--- ToDo: Localize;
			x = 0.176187 * safezoneW + safezoneX;
			y = 0.6606 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonDown = "call ANZUS_fnc_vehicleResetCustom;";
		};
	};
};