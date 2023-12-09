class life_compass {
	idd = 7600;
	fadeout=0;
	fadein=0;
	onLoad="uiNamespace setVariable ['life_compass',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_compass', displayNull]";
	duration = 10e10;
	name= "life_compass";
	controlsBackground[] = {};
	objects[] = {};
	
	class controls
	{
		class compass_group: RscControlsGroup
		{
			idc = 7634;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 10 * safezoneH;
			class controls {
				class compass_image: RscPicture
				{
					idc = 7636;
					text = "sunrise_gui\data\compass.paa";
				};
			};
		};
		class compass_bg: RscStructuredText
		{
			idc = 7635;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.038 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
		};
		class compass_need: RscStructuredText
		{
			idc = 7637;
			text = "<t shadow=1><t align='center' size='0.4' font='PuristaLight'>I";
			x = (0.5 * safezoneW + safezoneX)- 0.05;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.1;
			h = 0.09 * safezoneH;
		};
		
	};
	
};
