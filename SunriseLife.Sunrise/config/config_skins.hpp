/*

	class default - должен быть всегда!

*/

class LifeCfgPadSkins {
	class default {
		title = "Windows10";
		image = "\sunrise_pad\pad_skins\phone_bg1.paa";
		conditions = "";
	};
	class skin1 {
		title = "Йеллоустоун";
		image = "\sunrise_pad\pad_skins\phone_bg2.paa";
		conditions = "";
	};
	class skin2 {
		title = "Голубой";
		image = "\sunrise_pad\pad_skins\phone_bg3.paa";
		conditions = "";
	};
	class skin3 {
		title = "Tom Clancy's";
		image = "\sunrise_pad\pad_skins\phone_bg4.paa";
		conditions = "";
	};
	class skin4 {
		title = "Карта";
		image = "\sunrise_pad\pad_skins\phone_bg5.paa";
		conditions = "";
	};
	class skin5 {
		title = "Citroen";
		image = "\sunrise_pad\pad_skins\phone_bg6.paa";
		conditions = "";
	};
	class skin6 {
		title = "Call of Duty";
		image = "\sunrise_pad\pad_skins\phone_bg7.paa";
		conditions = "";
	};
	class space {
		title = "Мемчик";
		image = "\sunrise_pad\pad_skins\phone_bg8.paa";
		conditions = "(call life_donator) > 0";
	};
	class crystal {
		title = "КОТЭ";
		image = "\sunrise_pad\pad_skins\phone_bg9.paa";
		conditions = "(call life_donator) > 0";
	};
	class stickbomb {
		title = "Пальмы";
		image = "\sunrise_pad\pad_skins\phone_bg10.paa";
		conditions = "(call life_donator) > 0";
	};
	class sexy {
		title = "Стол";
		image = "\sunrise_pad\pad_skins\phone_bg11.paa";
		conditions = "(call life_donator) > 0";
	};
	class crysis {
		title = "Зима";
		image = "\sunrise_pad\pad_skins\phone_bg12.paa";
		conditions = "(call life_donator) > 0";
	};
	class darksouls {
		title = "Серый";
		image = "\sunrise_pad\pad_skins\phone_bg13.paa";
		conditions = "(call life_donator) > 0";
	};
	class darkness {
		title = "Полиция";
		image = "\sunrise_pad\pad_skins\phone_bg14.paa";
		conditions = "(call life_donator) > 0";
	};
	class fallout {
		title = "Дождь";
		image = "\sunrise_pad\pad_skins\phone_bg15.paa";
		conditions = "(call life_donator) > 0";
	};
	class dota {
		title = "Абстракция";
		image = "\sunrise_pad\pad_skins\phone_bg16.paa";
		conditions = "(call life_donator) > 0";
	};
	class diablo {
		title = "Салатовый";
		image = "\sunrise_pad\pad_skins\phone_bg17.paa";
		conditions = "(call life_donator) > 0";
	};
};

class LifeCfgPadIcons {
	class ButtonStatus {
		tooltip = "STR_PM_Status";
		image = "\sunrise_pad\pad_icons\pad_icons_status.paa";
		action = "closeDialog 0; [0] spawn SunriseClient_pad_openStatus";
		conditions = "";
	};
	
	class ButtonCraft {
		tooltip = "STR_PM_Craft";
		image = "\sunrise_pad\pad_icons\pad_icons_craft.paa";
		action = "closeDialog 0; createDialog ""SunriseDialogCraft""";
		conditions = "";
	};
	
	/*class ButtonExperience {
		tooltip = "STR_PM_ExperinceMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_experience.paa";
		action = "closeDialog 0; mav_ttm_lastOpenTime = diag_tickTime; createDialog 'SunriseDialogExperienceOverview';";
		conditions = "";
	};*/
	
	class ButtonSettings {
		tooltip = "STR_SM_Title";
		image = "\sunrise_pad\pad_icons\pad_icons_settings.paa";
		action = "closeDialog 0; [] spawn SunriseClient_system_settingsMenu";
		conditions = "";
	};

	class ButtonPhone {
		tooltip = "STR_PM_CellPhone";
		image = "\sunrise_pad\pad_icons\pad_icons_phone.paa";
		action = "closeDialog 0; [0] spawn SunriseClient_system_OpenPhone";
		conditions = "";
	};

	class ButtonHeal {
		tooltip = "STR_PM_Healing";
		image = "\sunrise_pad\pad_icons\pad_icons_fhelp.paa";
		action = "closeDialog 0; [] spawn SunriseClient_system_healMenu";
		conditions = "";
	};

	class ButtonGang {
		tooltip = "STR_PM_MyGang";
		image = "\sunrise_pad\pad_icons\pad_icons_gang.paa";
		action = "if (isNil {(group player) getVariable ""gang_owner""}) then {closeDialog 0; [] call SunriseClient_gangs_MenuCreat} else {closeDialog 0; [] call SunriseClient_gangs_Menu}";
		conditions = "";
	};

	class ButtonGov {
		tooltip = "STR_PM_GoverMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_gover.paa";
		action = "closeDialog 0; [] spawn SunriseClient_system_openGovMenu";
		conditions = "";
	};
	
	class ButtonProperty {
		tooltip = "STR_PM_PropertyMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_estate.paa";
		action = "closeDialog 0; [] spawn SunriseClient_system_openPropertyMenu";
		conditions = "";
	};

	/*class ButtonCarsharing {
		tooltip = "STR_PM_CarsharingMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_carsharing.paa";
		action = "closeDialog 0; [] spawn SunriseClient_carsharing_openMenu";
		conditions = "";
	};*/
	
	class ButtonCrime {
		tooltip = "STR_PM_WantedList";
		image = "\sunrise_pad\pad_icons\pad_icons_crime.paa";
		action = "closeDialog 0; [] spawn SunriseClient_system_wantedMenu";
		conditions = "life_copDuty";
	};
	class ButtonCrime2 {
		tooltip = "STR_PM_WantedList2";
		image = "\sunrise_pad\pad_icons\pad_icons_crime.paa";
		action = "closeDialog 0; createDialog ""SunriseDialogPoliceDB""";
		conditions = "life_copDuty";
	};

	class ButtonMedic {
		tooltip = "STR_PM_MedicMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_doctor.paa";
		action = "closeDialog 0; [] spawn SunriseClient_system_medicMenu";
		conditions = "life_medDuty";
	};

	/*class ButtonSave {
		tooltip = "STR_PM_SyncData";
		image = "\sunrise_pad\pad_icons\pad_icons_save.paa";
		action = "[] call SunriseClient_session_syncData";
		conditions = "";
	};*/

	class ButtonML {
        tooltip = "STR_PM_MartialLaw";
        image = "\sunrise_pad\pad_icons\pad_icons_vp.paa";
        action = "closeDialog 0; [] call SunriseClient_martiallaw_listWarPoints";
        conditions = "life_coplevel > 1 OR life_canUseWarZone OR life_civlevel > 4";
    };
	
	class ButtonAdmin2 {
		tooltip = "STR_PM_AdminMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_admin.paa";
		action = "closeDialog 0; createDialog ""ExtremoInventory""";
		conditions = "call life_isAdmin";
	};
	
	class ButtonAdmin {
		tooltip = "STR_PM_AdminMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_admin.paa";
		action = "closeDialog 0; [] spawn SunriseClient_admin_Menu";
		conditions = "call life_isAdmin";
	};
	
	/*class ButtonMTP {
        tooltip = "STR_PM_MsgToPlayer";
        image = "\sunrise_pad\pad_icons\pad_icons_mtp.paa";
		//image = "\sunrise_pack\icons\items\noicon.paa"; //NEED ICON
        action = "closeDialog 0; [] spawn SunriseClient_message_msgToTargetMenu";
        conditions = "";
    };
	
	class ButtonLk {
		tooltip = "STR_PM_LKMenu";
		image = "\sunrise_pad\pad_icons\pad_icons_lk.paa";
		action = "closeDialog 0; [] spawn SunriseClient_system_openLK";
		conditions = "";
	};
	class ButtonBusiness {
		tooltip = "STR_PM_MyBusiness";
		image = "\sunrise_pad\pad_icons\pad_icons_ltd.paa";
		action = "closeDialog 0; if (life_ltdData isEqualTo []) then {[] spawn SunriseClient_ltd_regMenu} else {[] spawn SunriseClient_ltd_mainMenu}";
		conditions = "";
	};
	class ButtonPouch {
		tooltip = "STR_PM_Pouch";
		image = "\sunrise_pad\pad_icons\pad_icons_keys.paa";
		action = "closeDialog 0; call SunriseClient_pouch_pouchOpen";
		conditions = "";
	};*/
};