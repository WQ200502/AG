class Life_cell_phone {
	idd = 3000;
	name = "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";

	class controlsBackground {

		class MainBackground :Life_RscPictureKeepAspect {
			idc = -1;
			text = "";
			colorBackground[] = { 0, 0, 0, 0 };
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};

	};

	class controls {

		class TextTime : Life_RscStructuredText
		{
			idc = 90035;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0; y = 0.115;
			w = 1; h = 0.05;
		};

		class TextStatusLeft : Life_RscStructuredText
		{
			idc = 90036;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.5 - (0.08 * 2) - 0.005; y = 0.115;
			w = 0.3; h = 0.05;
		};

		class TextStatusRight : Life_RscStructuredText
		{
			idc = 90037;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.34; y = 0.115;
			w = 1 - (0.34 * 2) - 0.02; h = 0.05;
			class Attributes {
				align = "right";
			};
		};

		class TextToSend : Life_RscTitle {
			colorBackground[] = { 0, 0, 0, 0 };
			idc = 3002;
			text = "发送消息:";
			x = 0.5 - (0.08 * 2);
			y = 0.18;
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			h = (1 / 25);
		};

		class textEdit : Life_RscEdit {
			idc = 3003;
			text = "";
			sizeEx = 0.030;
			x = 0.5 - (0.08 * 2); y = 0.23;
			w = 1 - ((0.5 - (0.08 * 2)) * 2); h = 0.03;
		};

		class TextMsgButton : life_RscButtonMenu
		{
			idc = 3015;
			text = "发送";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "[] call life_fnc_cell_textmsg";

			x = 1 - 0.34 - 0.075;
			y = 0.3;
			w = 0.075;
			h = (1 / 25);
		};

		class PlayerList : Life_RscCombo
		{
			idc = 3004;
			x = 0.34; y = 0.3;
			w = 1 - ((0.5 - (0.08 * 2)) * 2) - 0.08; h = (1 / 25);
		};

		class TextCopButton : life_RscButtonMenu
		{
			idc = 3016;
			text = "发给警察";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "[] call life_fnc_cell_textcop";

			x = 0.5 - (0.08 * 2);
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			y = 0.35;
			h = (1 / 25);
		};

		class TextEMTButton : life_RscButtonMenu
		{
			idc = 3018;
			text = "发给医生";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "[] call life_fnc_cell_textemt";

			x = 0.5 - (0.08 * 2);
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			y = 0.4;
			h = (1 / 25);
		};

		class TextAdminButton : life_RscButtonMenu
		{
			idc = 3017;
			text = "发给管理员";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "[] call life_fnc_cell_textadmin";

			x = 0.5 - (0.08 * 2);
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			y = 0.45;
			h = (1 / 25);
		};

		class TaxiMsgButton : life_RscButtonMenu
		{
			idc = 3020;
			text = "呼叫出租车";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "[] spawn life_fnc_Taxi";

			x = 0.5 - (0.08 * 2);
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			y = 0.5;
			h = (1 / 25);
		};

		class historybutton : life_RscButtonMenu
		{
			idc = 3020;
			text = "历史消息";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "createDialog 'message_history'";

			x = 0.5 - (0.08 * 2);
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			y = 0.65;
			h = (1 / 25);
		};

		class AdminMsgButton : life_RscButtonMenu
		{
			idc = 3022;
			text = "管理信息发送";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "[] call life_fnc_cell_adminmsg";

			x = 0.5 - (0.08 * 2);
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			y = 0.55;
			h = (1 / 25);
		};

		class AdminMsgAllButton : life_RscButtonMenu
		{
			idc = 3021;
			text = "发送全服公告";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "[] call life_fnc_cell_adminmsgall";

			x = 0.5 - (0.08 * 2);
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			y = 0.6;
			h = (1 / 25);
		};

		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "返回";
			x = 0.5 - ((6.25 / 80) / 2);
			y = 1 - 0.1;
			w = (6.25 / 80);
			h = (6.25 / 80);
		};
	};
};
