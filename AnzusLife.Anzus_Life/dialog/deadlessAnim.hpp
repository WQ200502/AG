/*
  deadlessAnim - idd - 9990
  deadless_background - idc - 9991
  deadless_listbox - idc - 9992
  deadless_AnimButton - idc - 9993
*/

class deadlessAnim
{
	name = "deadlessAnim";
	movingEnable = 0;
	enableSimulation = 1;
	idd = 9990;
	class ControlsBackground {};
	class Controls
	{
		class deadless_background
		{
			type = 0;
			idc = 9991;
			x = safeZoneX + safeZoneW * 0.79875;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.128125;
			h = safeZoneH * 0.42555556;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.8275,0.3059,0.0078,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

		};
		class deadless_listbox
		{
			type = 5;
			idc = 9992;
			x = safeZoneX + safeZoneW * 0.806875;
			y = safeZoneY + safeZoneH * 0.30888889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.38;
			style = 16;
			colorBackground[] = {0,0.102,0.502,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.6,0,0,1};
			colorText[] = {0.8314,0.8902,0.7255,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
      onLBListSelChanged = "call anzus_fnc_updateListbox";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
		class deadless_AnimButton
		{
			type = 1;
			idc = 9993;
			x = safeZoneX + safeZoneW * 0.80625;
			y = safeZoneY + safeZoneH * 0.69555556;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02111112;
			style = 0;
			text = "Do Animation";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0.9569,0.9294,0.3412,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
      onButtonClick = "call anzus_fnc_doAnimation";
		};

	};

};
