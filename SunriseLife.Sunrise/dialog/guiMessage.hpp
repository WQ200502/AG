class SunriseRscMessageBox
{
	idc = 2351;
	x = -1;
	y = -1;
	w = 0;
	h = 0;
	class Controls
	{
		class BcgCommonTop: Life_V3_Title
		{
			idc = 235100;
			colorBackground[] = {TLD_COLOR_1,0.9};
			x = 0;
			y = 0;
			w = "18.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BcgCommon
		{
			idc = 235101;
			x = 0;
			y = "1.35 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "18.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			background = 1;
			deletable = 0;
			fade = 0;
			access = 0;
			type = 0;
			text = "";
			fixedWidth = 0;
			style = 0;
			shadow = 1;
			colorShadow[] = {0,0,0,0.5};
			font = "RobotoCondensed";
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			linespacing = 1;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
		};
		class Text
		{
			idc = 235102;
			x = "0.7 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "17 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			deletable = 0;
			fade = 0;
			access = 0;
			type = 13;
			style = 0;
			colorText[] = {1,1,1,1};
			class Attributes
			{
				font = "RobotoCondensed";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "left";
				shadow = 1;
			};
			text = "";
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			shadow = 1;
		};
		/*class BackgroundButtonOK
		{
			idc = 235103;
			x = 0;
			y = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "6.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			background = 1;
			deletable = 0;
			fade = 0;
			access = 0;
			type = 0;
			text = "";
			fixedWidth = 0;
			style = 0;
			shadow = 1;
			colorShadow[] = {0,0,0,0.5};
			font = "RobotoCondensed";
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			linespacing = 1;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
		};*/
		class BackgroundButtonMiddle
		{
			idc = 235104;
			x = "6.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "3.15 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "6.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			background = 1;
			deletable = 0;
			fade = 0;
			access = 0;
			type = 0;
			text = "";
			fixedWidth = 0;
			style = 0;
			shadow = 1;
			colorShadow[] = {0,0,0,0.5};
			font = "RobotoCondensed";
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			linespacing = 1;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
		};
		/*class BackgroundButtonCancel
		{
			idc = 235105;
			x = "12.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "6.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			background = 1;
			deletable = 0;
			fade = 0;
			access = 0;
			type = 0;
			text = "";
			fixedWidth = 0;
			style = 0;
			shadow = 1;
			colorShadow[] = {0,0,0,0.5};
			font = "RobotoCondensed";
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			linespacing = 1;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
		};*/
		class ButtonOK: RscExtremoGui_ButtonDark
		{
			default = 1;
			idc = 235106;
			x = 0;
			y = "3.15 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "6.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			shortcuts[] = {"0x00050000 + 0",28,57,156};
			text = "ОК";
		};
		class ButtonCancel: RscExtremoGui_ButtonDark
		{
			default = 0;
			idc=235107;
			x="12.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y="3.15 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="6.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			shortcuts[] = {"0x00050000 + 1"};
			text = "Отмена";
		};
	};
	class VScrollbar
	{
		width = 0;
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		height = 0;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
	class HScrollbar
	{
		height = 0;
		color[] = {1,1,1,1};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		width = 0;
		autoScrollEnabled = 0;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
	deletable = 0;
	fade = 0;
	type = 15;
	shadow = 0;
	style = 16;
};
class SunriseRscDisplayCommonMessage
{
	idd = 999;
	movingEnable = 1;
	onload = "uinamespace setvariable ['RscDisplayCommonMessage_display',_this select 0];";
	onunload = "uinamespace setvariable ['RscDisplayCommonMessage_display',nil];";
	class controls
	{
		class MessageBox: SunriseRscMessageBox
		{
			x = "10.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = 1;
			h = 1;
		};
	};
};
class SunriseRscDisplayCommonMessagePause: SunriseRscDisplayCommonMessage
{
	enablesimulation=0;
};