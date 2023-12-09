class SunriseDialogAdmin {
	idd = 2900;
	name = "SunriseDialogAdmin";
	movingenable = 0;
	enablesimulation = 1;
	onload = "[_this select 0] call SunriseClient_gui_Tiles";
	class controlsBackground {
		class Blackout : RscExtremoGui_DialogBG {
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
		};
		class Tiles : RscTiles {
			idc = 1000;
		};
	};
	class controls {
		class Title : RscExtremoGui_HeaderBG {
			idc = 2901;
			text = "$STR_Admin_Title";
			
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0418 * safezoneH;
		};
		class PlayerList_Admin : RscListBox {
			idc = 2902;
			text = "";
			onlbselchanged = "[_this] spawn SunriseClient_admin_Query";
			x = 0.00190622 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.693 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class PlayerBInfo : RscStructuredText {
			idc = 2903;
			text = "";
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.176 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class PlayerLicenses : RscListBox {
			idc = 2904;
			text = "";
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.2294 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.154 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class PlayerLloot : RscListBox {
			idc = 2905;
			text = "";
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.3878 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.33 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class GetLootButton : RscButtonMenu {
			idc = 2906;
			text = "Получить инвентарь";
			onbuttonclick = "[] call SunriseClient_admin_GetUnitLoot";
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class SpectateButton : RscButtonMenu {
			idc = 2907;
			text = "Наблюдение";
			onbuttonclick = "[] spawn SunriseClient_admin_Spectate;";
			x = 0.323656 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class FreezeButton : RscButtonMenu {
			idc = 2908;
			text = "Заморозить";
			onbuttonclick = "[] call SunriseClient_admin_Freeze;";
			x = 0.323656 * safezoneW + safezoneX;
			y = 0.0754 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TeleportToMeButton : RscButtonMenu {
			idc = 2909;
			text = "ТП ко мне";
			onbuttonclick = "[] call SunriseClient_admin_TpHere";
			x = 0.323656 * safezoneW + safezoneX;
			y = 0.1018 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TeleportToHimButton : RscButtonMenu {
			idc = 2910;
			text = "ТП к игроку";
			onbuttonclick = "[] call SunriseClient_admin_TpTo";
			x = 0.323656 * safezoneW + safezoneX;
			y = 0.1282 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DdosTS : RscButtonMenu {
			idc = 29111;
			text = "Дудосят ТС";
			onbuttonclick = "['ddosts'] remoteExecCall ['SunriseServer_system_ServerCommand',2];";
			x = 0.414407 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {1, 0, 0, 1};
		};
		class DdosServer : RscButtonMenu {
			idc = 29112;
			text = "Дудосят Сервер";
			onbuttonclick = "['ddosserver'] remoteExecCall ['SunriseServer_system_ServerCommand',2];";
			x = 0.414407 * safezoneW + safezoneX;
			y = 0.0754 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {1, 0, 0, 1};
		};
		class KickButton : RscButtonMenu {
			idc = 2911;
			text = "КИКНУТЬ";
			onbuttonclick = "[] call SunriseClient_admin_Kick";
			x = 0.414407 * safezoneW + safezoneX;
			y = 0.176709834469328 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {1, 0, 0, 1};
		};
		class BanButton : RscButtonMenu {
			idc = 2912;
			text = "БАН";
			onbuttonclick = "[] call SunriseClient_admin_Ban";
			x = 0.458854166666667 * safezoneW + safezoneX;
			y = 0.2030 * safezoneH + safezoneY;
			w = 0.0428646333333333 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {1, 0, 0, 1};
		};
		class HousesList : RscListBox {
			idc = 2913;
			text = "";
			x = 0.322625 * safezoneW + safezoneX;
			y = 0.2294 * safezoneH + safezoneY;
			w = 0.179438 * safezoneW;
			h = 0.1276 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class GetHousesButton : RscButtonMenu {
			idc = 2914;
			text = "Получить список домов";
			onbuttonclick = "";
			x = 0.322625 * safezoneW + safezoneX;
			y = 0.3614 * safezoneH + safezoneY;
			w = 0.179438 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VehiclesList : RscListBox {
			idc = 2915;
			text = "";
			x = 0.322625 * safezoneW + safezoneX;
			y = 0.3878 * safezoneH + safezoneY;
			w = 0.179438 * safezoneW;
			h = 0.33 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class GetVehiclesButton : RscButtonMenu {
			idc = 2916;
			text = "Получить список техники";
			onbuttonclick = "";
			x = 0.322624 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.180466 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class LockButton : RscButtonMenu {
			idc = 2919;
			text = "Закрыть сервер";
			onbuttonclick = "['lock'] remoteExecCall ['SunriseServer_system_ServerCommand',2];";
			x = 0.795969 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0989999 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class UnLockButton : RscButtonMenu {
			idc = 2920;
			text = "Открыть сервер";
			onbuttonclick = "['unlock'] remoteExecCall ['SunriseServer_system_ServerCommand',2];";
			x = 0.898062 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0989999 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CompensateButton : RscButtonMenu {
			idc = 2921;
			text = "+ $500.000";
			onbuttonclick = "[] call SunriseClient_admin_Compensate";
			x = 0.795969 * safezoneW + safezoneX;
			y = 0.4824 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MakeZero : RscButtonMenu {
			idc = 29221;
			text = "Сделать $0";
			onbuttonclick = "['cash','set',0] call SunriseClient_system_myCash; ['atm','set',0] call SunriseClient_system_myCash";
			x = 0.898062 * safezoneW + safezoneX;
			y = 0.4824 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminShop : RscButtonMenu {
			idc = 29231;
			text = "Магаз оружия";
			onbuttonclick = "['','','','admin'] call SunriseClient_system_weaponShopMenu";
			x = 0.795968 * safezoneW + safezoneX;
			y = 0.4560 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ClothinShop : RscButtonMenu {
			idc = 292231;
			text = "Магаз одежды";
			onbuttonclick = "['','','','admin'] call SunriseClient_system_clothingMenu";
			x = 0.898062 * safezoneW + safezoneX;
			y = 0.4560 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MarkersButton : RscButtonMenu {
			idc = 2922;
			text = "Маркеры";
			onbuttonclick = "[] spawn SunriseClient_admin_Markers";
			x = 0.795969 * safezoneW + safezoneX;
			y = 0.4296 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TeleportButton : RscButtonMenu {
			idc = 2924;
			text = "Телепорт";
			onbuttonclick = "[] call SunriseClient_admin_Teleport; hint 'Укажите место для перемещения'";
			x = 0.898062 * safezoneW + safezoneX;
			y = 0.4296 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DeBuff : RscButtonMenu {
			idc = 29244;
			text = "Лекнуть себя";
			onbuttonclick = "['all'] call SunriseClient_removeBuff; player setdamage 0";
			x = 0.898062 * safezoneW + safezoneX;
			y = 0.5352 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class EditBox : RscEdit {
			idc = 29251;
			text = "Желаемый ник";
			x = 0.795969 * safezoneW + safezoneX;
			y = 0.5088 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MakeChane : RscButtonMenu {
			idc = 292521;
			text = "Сменить ник";
			onbuttonclick = "[player,'realname',(ctrlText 29251)] call CBA_fnc_setVarNet;";
			x = 0.898062 * safezoneW + safezoneX;
			y = 0.5088 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class AmodeOnButton : RscButtonMenu {
			idc = 2925;
			text = "АДМ ВКЛ";
			onbuttonclick = "[true] call SunriseClient_admin_Mode";
			x = 0.795968 * safezoneW + safezoneX;
			y = 0.5352 * safezoneH + safezoneY;
			w = 0.047781 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class AmodeOffButton : RscButtonMenu {
			idc = 2926;
			text = "АДМ ВЫКЛ";
			onbuttonclick = "[false] call SunriseClient_admin_Mode";
			x = 0.847541166666667 * safezoneW + safezoneX;
			y = 0.5352 * safezoneH + safezoneY;
			w = 0.0462088333333334 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CloseButtonKey : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			x = 0.898062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			onbuttonclick = "closeDialog 0;";
		};
		class BanReason : RscEdit {
			idc = 1001;
			text = "Причина";
			x = 0.323656 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class BanTime : RscEdit {
			idc = 1002;
			text = "Время";
			x = 0.414407 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0402805 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {0, 0, 0, 0.75};
		};
		class PermButton : RscButtonMenu {
			idc = 1004;
			text = "Пермач";
			onbuttonclick = "[] call SunriseClient_admin_QuickBan";
			x = 0.323656 * safezoneW + safezoneX;
			y = 0.1767 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {1, 0, 0, 1};
		};
		class Release : RscButtonMenu {
			idc = -1;
			text = "Выпустить";
			onbuttonclick = "[] remoteExec ['SunriseClient_system_release',(call compile format['%1', (lbData[2902,lbCurSel 2902])])];";
			x = 0.323656 * safezoneW + safezoneX;
			y = 0.1525 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {0.871, 0.059, 0.78, 1};
		};
		class EndMissionB : RscButtonMenu {
			idc = -1;
			text = "НЕ НАЖИМАТЬ";
			x = 0.795969 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			onbuttonclick = "endMission 'end5';closeDialog 0;";
			colorbackground[] = {1, 0.5, 0.5, 1};
		};
		class JailButton : RscButtonMenu {
			idc = -1;
			text = "Тюрьма";
			onbuttonclick = "[] call SunriseClient_admin_Jail";
			x = 0.507213516666667 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0428646333333333 * safezoneW;
			h = 0.022 * safezoneH;
			colorbackground[] = {1, 0, 0, 1};
		};
	};
};