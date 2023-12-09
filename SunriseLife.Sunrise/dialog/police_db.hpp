class SunriseDialogPoliceDB
{
    idd=6396;
    name="SunriseDialogPoliceDB";
    movingEnable=0;
    enableSimulation=1;
    onLoad="[_this select 0] call SunriseClient_gui_bluring;[] spawn SunriseClient_system_policedb";
    class ControlsBackground
    {
		class padImage : RscExtremoGui_DialogBG {
			idc = 2001;
			text = "";

			x = 0;
			y = 0;
			w = 1;
			h = 0.9;
		};
		class Title : RscExtremoGui_HeaderBG {			
			idc = -1;
			text = "База данных полиции";
			
			x = 0;
			y = 0;
			w = 1;
			h = 0.08;
		};
		class CloseImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_close.paa";
			
			x = 0.95;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";  
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.95;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class BackImage : RscPicture {
			idc = -1;
			text = "\sunrise_gui\data\v3\button_back.paa";
			
			x = 0.9125;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
		class BackButton: RscPictureButtonMenu {
			idc = -1;
			text = "";  
			onButtonClick = "closeDialog 0; [] spawn SunriseClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.9125;
			y = 0.02;
			w = 0.035;
			h = 0.045;
		};
    };
    class Controls
    {
        class FindMan: RscEdit
        {
            idc=93695;
            x=0.031818189;
            y=0.72525257;
            w=0.36818182;
            h=0.050505061;
            text="Имя или номер паспорта";
            sizeEx=0.029999999;
        };
        class SearchPerson: RscButtonUC
        {
            idc=63967;
            x=0.2;
            y=0.78;
            w=0.2;
            h=0.06;
            text="Найти";
            colorBackground[]={0,0,0,0.5};
            onButtonClick="[1] spawn SunriseClient_system_policedb";
            tooltip="Найти человека в базе данных";
        };
		class DeletePerson: RscButtonUC
        {
            idc=63968;
            x=0.0375;
            y=0.78;
            w=0.1375;
            h=0.06;
            text="Удалить";
			show = "false";
            colorBackground[]={1,0,0,0.5};
            onButtonClick="[5] spawn SunriseClient_system_policedb";
            tooltip="Удалить человека из базы данных";
        };
        class Group: RscEdit
        {
            idc=63950;
            x=0.44999999;
            y=0.54500002;
            w=0.23;
            h=0.050000001;
            text="Группа";
			tooltip="Группа";
            sizeEx=0.029999999;
        };
        class Rating: RscCombo
        {
            idc=63951;
            x=0.815;
            y=0.54500002;
            w=0.13500001;
            h=0.050000001;
        };
        class Portrait: RscEdit
        {
            idc=63952;
            x=0.44999999;
            y=0.60500002;
            w=0.5;
            h=0.050000001;
            text="Психологический портрет";
			tooltip="Психологический портрет";
            sizeEx=0.029999999;
        };
        class Crimes: RscEdit
        {
            idc=63953;
            x=0.44999999;
            y=0.66500002;
            w=0.5;
            h=0.050000001;
            text="Нарушения";
			tooltip="Нарушения";
            sizeEx=0.029999999;
        };
        class Comments: RscEdit
        {
            idc=63954;
            x=0.44999999;
            y=0.72500002;
            w=0.5;
            h=0.050000001;
            text="Комментарий";
			tooltip="Комментарий";
            sizeEx=0.029999999;
        };
        class AddOrChange: RscButtonUC
        {
            idc=963698;
            x=0.69999999;
            y=0.78500003;
            w=0.25;
            h=0.059999999;
            text="Добавить";
            colorBackground[]={0,0,0,0.5};
            onButtonClick="";
        };
        class Players: RscCombo
        {
            idc=63962;
            x=0.44999999;
            y=0.78500003;
            w=0.23999999;
            h=0.059999999;
        };
        class DatabaseTitle: RscTitle
        {
            idc=63963;
            x=0.03257576;
            y=0.1;
            w=0.91893941;
            h=0.040404059;
            text="База данных полицейского департамента";
            colorBackground[]={1,1,1,0.1};
        };
        class FindPersonTitle: RscTitle
        {
            idc=-1;
            x=0.031818189;
            y=0.67146468;
            w=0.36818182;
            h=0.040404059;
            text="Найти человека";
            colorBackground[]={1,1,1,0.1};
        };
        
        class TextShow : RscControlsGroup {
            x=0.032575771;
            y=0.15959615;
            w=0.91893941;
            h=0.3;
            class HScrollbar : HScrollbar {
                height = 0;
            };
            class controls {
                class Database_list: RscStructuredText
                {
                    idc=96396;
                    colorBackground[]={0.28,0.28,0.28,0.28};
                    shadow=0;
                    x=0;
                    y=0;
                    w=0.91893941;
                    h=1;
                };
            };
        };
        class Addorchange_title: RscTitle
        {
            idc=963699;
            x=0.44257578;
            y=0.48500001;
            w=0.50893939;
            h=0.040404059;
            text="Добавить";
            colorBackground[]={1,1,1,0.1};
        };
    };
};