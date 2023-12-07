class AnzusLife_Core_Settings {
  phoneNumberPrefix = "+01";
  phoneNumberLength = 10;
  phoneNumberStart = 7;
  ServerTag = "AnzusLife";
  allMenus[] = {"AnzusLife_EmergencyMessage","AnzusLife_MessagesEmergency", "AnzusLife_MessagesView", "AnzusLife_MessagesMain", "AnzusLife_ContactView","AnzusLife_ContactEdit","AnzusLife_ContactAdd","AnzusLife_Setup","AnzusLife_ContactsMain","AnzusLife_PhoneWarning","AnzusLife_gangCreate","AnzusLife_gangMain","AnzusLife_KeyChain","AnzusLife_Buttons", "AnzusLife_Settings","AnzusLife_ChangeBackground","AnzusLife_Licenses","AnzusLife_Money","AnzusLife_Inv"};

  BannedWords[] = {
    "Fuck",
    "Shit",
    "Prick",
    "Nigger",
    "Nigga",
    "Jiggaboo",
    "Spic",
   	"Faggot",
   	"Fag",
   	"Bitch",
   	"Paki",
   	"Coon",
   	"Nignog",
   	"Niglet",
   	"Porch Monkey",
   	"PorchMonkey",
   	"Chink",
   	"Gook",
   	"Towelhead",
   	"Spick",
   	"Wetback",
   	"Beaner"
  };
};

class AnzusLife_Backgrounds {
  class test1 {
    image = "\AnzusLifeCore\images\phone\backgrounds\Background_1.paa";
    preview = "\AnzusLifeCore\images\phone\backgrounds\Background_1_preview.paa";
  };
  class test2 {
    image = "\AnzusLifeCore\images\phone\backgrounds\Background_2.paa";
    preview = "\AnzusLifeCore\images\phone\backgrounds\Background_2_preview.paa";
  };
  class test3 {
    image = "\AnzusLifeCore\images\phone\backgrounds\Background_3.paa";
    preview = "\AnzusLifeCore\images\phone\backgrounds\Background_3_preview.paa";
  };
  class test4 {
    image = "\AnzusLifeCore\images\phone\backgrounds\Background_4.paa";
    preview = "\AnzusLifeCore\images\phone\backgrounds\Background_4_preview.paa";
  };
};

class AnzusLife_BottomIcons
{
  class Keys
  {
    displayName = "钥匙";
    onCall = "['AnzusLife_KeyChain'] spawn ANZUS_fnc_changeMenu";
    image = "Keys.paa";
  };
  class Money
  {
    displayName = "钱包";
    onCall = "['AnzusLife_Money'] spawn ANZUS_fnc_changeMenu";
    image = "money.paa";
  };
  class Sync
  {
    displayName = "数据同步";
    onCall = "[] call ANZUS_fnc_syncData";
    image = "sync.paa";
  };
  class Inventory
  {
    displayName = "背包";
    onCall = "['AnzusLife_Inv'] spawn ANZUS_fnc_changeMenu";
    image = "Inventory.paa";
  };
};

class AnzusLife_Apps
{
  class Licenses
  {
    displayName = "许可证";
    onCall = "['AnzusLife_Licenses'] spawn ANZUS_fnc_changeMenu";
    image = "licenses.paa";
    conditions = "";
  };
  
   class Phone
  {
    displayName = "手机";
    onCall = "[] call ANZUS_fnc_phone";
    image = "Phone.paa";
    conditions = "";
  };
  class Settings
  {
    displayName = "设置";
    onCall = "['AnzusLife_Settings'] spawn ANZUS_fnc_changeMenu";
    image = "settings.paa";
    conditions = "";
  };
  class GangMenu
  {
    displayName = "组队菜单";
    onCall = "[] spawn ANZUS_fnc_LoadGangMenu";
    image = "gang.paa";
    conditions = "playerSide isEqualTo Civilian || playerSide isEqualTo WEST";
  };
  class GangProgress
  {
    displayName = "组队管理";
    onCall = "[] call AnzusLife_OpenGangPicker;";
    image = "gangT.paa";
    conditions = "playerSide isEqualTo civilian || playerSide isEqualTo WEST";
  };
  class Contacts
  {
    displayName = "联系人";
    onCall = "['AnzusLife_ContactsMain'] spawn ANZUS_fnc_changeMenu";
    image = "Contacts.paa";
    conditions = "";
  };
  class Messages
  {
    displayName = "信息";
    onCall = "['AnzusLife_MessagesMain'] spawn ANZUS_fnc_changeMenu";
    image = "Messages.paa";
    conditions = "";
  };
  class EmergencyMessage
  {
    displayName = "调度";
    onCall = "['AnzusLife_MessagesEmergency'] spawn ANZUS_fnc_changeMenu";
    image = "999_messaging.paa";
    conditions = "!(playerSide isEqualTo Civilian)";
  };
  class EmergencyMessageTo
  {
    displayName = "911";
    onCall = "['AnzusLife_EmergencyMessage'] spawn ANZUS_fnc_changeMenu";
    image = "999_dispatch.paa";
    conditions = "";
  };
  class SkillMenu
  {
    displayName = "技能";
    onCall = "createDialog ""TTM_GUI_RscDisplayTalentOverview"";";
    image = "skills.paa";
    conditions = "";
  };

  /////////////////////////////////////////
  ///                VIP                ///
  /////////////////////////////////////////
  class VIP
  {
    displayName = "名称颜色";
    onCall = "[] call AnzusLife_VIPNametagMenu;";
    image = "VIP.paa";
    conditions = "call life_donorlevel > 3";
  };
  /////////////////////////////////////////

  class Checkpoint
  {
    displayName = "屏障";
    onCall = "[] call AnzusLife_CheckpointBuilder;";
    image = "nav.paa";
    conditions = "(playerSide isEqualTo WEST || playerSide isEqualTo independent)";
  };
  
  // class PoliceGroup
  // {
  //   displayName = "警察标识";
  //   onCall = "['InitializePlayer', [player, true]] call BIS_fnc_dynamicGroups;";
  //   image = "gangt.paa";
  //   conditions = "playerSide isEqualTo WEST";
  // };
  class warrants
  {
    displayName = "通缉";
    onCall = "closeDialog 0; [] call ANZUS_fnc_openWarrants;";
    image = "wanted.paa";
    conditions = "playerSide isEqualTo WEST";
  };
  class majorcrime
  {
    displayName = "MC 警报";
    onCall = "closeDialog 0; [] spawn AnzusLife_MajorCrimeAlert;";
    image = "gang.paa";
    conditions = "playerSide isEqualTo WEST";
  };
  class Navigation
  {
    displayName = "导航";
    onCall = "closeDialog 0; [] spawn ANZUS_fnc_markerMenu;";
    image = "nav.paa";
    conditions = "";
  };
  class Helpmenu
  {
    displayName = "帮助菜单";
    onCall = "closeDialog 0; createDialog ""Help_MainMenu"";";
    image = "help.paa";
    conditions = "";
  };
  class copPhone
  {
    displayName = "CONVICTION";
    onCall = "closeDialog 0; createDialog ""AnzusLife_CopPhone"";";
    image = "appicon.paa";
    conditions = "playerSide isEqualTo WEST";
  };
};

class AnzusLife_onLoads
{
  class AnzusLife_Buttons
  {
    onload = "[] spawn ANZUS_fnc_loadMainButtons";
  };
  class AnzusLife_ChangeBackground
  {
    onload = "[] spawn ANZUS_fnc_loadBackgroundSelection";
  };
  class AnzusLife_Money
  {
    onload = "[] call ANZUS_fnc_LoadMoneyMenu";
  };

  class AnzusLife_Inv
  {
    onload = "[] call ANZUS_fnc_LoadInventory";
  };

  class AnzusLife_Licenses
  {
    onload = "[] call ANZUS_fnc_LoadLicenses";
  };

  class AnzusLife_Settings
  {
    onload = "[] call ANZUS_fnc_loadSettings";
  };

  class AnzusLife_KeyChain
  {
    onload = "[] call ANZUS_fnc_LoadKeyChain";
  };

  class AnzusLife_ContactsMain
  {
    onload = "[] call ANZUS_fnc_LoadContacts";
  };

  class AnzusLife_MessagesMain
  {
    onload = "[] spawn ANZUS_fnc_LoadMessageList";
  };

  class AnzusLife_MessagesEmergency
  {
    onLoad = "[] spawn ANZUS_fnc_OpenEmergencyMessage";
  };
};
