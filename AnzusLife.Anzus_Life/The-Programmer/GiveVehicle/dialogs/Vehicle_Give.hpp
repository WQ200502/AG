/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
class Vehicle_Give {
    idd = 2700;
    name= "Vehicle_Give";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn max_giveVeh_fnc_vehicleGive;";

    class controlsBackground {
        class Life_RscTitleBackgrounda: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.463])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',1])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.6 - (22 / 250);
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 5404;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class KeyChainList: Life_RscListBox {
            idc = 2701;
            text = "";
            sizeEx = 0.035;
            x = 0.12;
            y = 0.26;
            w = 0.56;
            h = 0.370;
        };

        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class NearPlayers: Life_RscCombo {
            idc = 2702;
            x = 0.26;
            y = 0.645;
            w = 0.275;
            h = 0.03;
        };

        class GiveKey: Life_RscButtonMenu {
            idc = 2703;
            text = "";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call max_giveVeh_fnc_vehicleGiveTo";
            x = 0.15;
            y = 0.69;
            w = 0.365;
            h = (1 / 25);
            class Attributes {align = "center";};
        };
        class textPrice : Life_RscEdit {
           idc = 2704;
           text = "";
           x = 0.535;
           y = 0.69;
           w = 0.115;
           h = (1 / 25);
       };
    };
};