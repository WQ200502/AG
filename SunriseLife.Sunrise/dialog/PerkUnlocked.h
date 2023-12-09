class PerkUnlocked
{
	idd = -1;
	movingEnable = 0;
	enableSimulation = 1;
	fadeout = 0.2;
	fadein = 0.2;
	duration = 6;
	onLoad = "uiNamespace setVariable ['PerkUnlocked',_this select 0];";

	class controls
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 0;
			x = 0.2989 * safezoneW + safezoneX;
			y = 0.807891 * safezoneH + safezoneY;
			w = 0.402201 * safezoneW;
			h = 0.120957 * safezoneH;
		};
	};
};