class AnzusLife_GangMenu {
    idd = 8999320;
    name= "AnzusLife_GangMenu";
    movingEnable = 0;
    enableSimulation = 1;

    class ControlsBackground {
        class BACKGROUND: ANZUS_ctrlStatic {
            idc                 = -1;
            x                   = "0.29375 * safezoneW + safezoneX";
            y                   = "0.248148 * safezoneH + safezoneY";
            w                   = "0.4125 * safezoneW";
            h                   = "0.380 * safezoneH";
            colorBackground[]   = {0.2,0.2,0.2,1};
        };
        class HEADER: ANZUS_ctrlStatic {
            idc                 = -1;
            text                = "帮派菜单";
            x                   = "0.293751 * safezoneW + safezoneX";
            y                   = "0.225 * safezoneH + safezoneY";
            w                   = "0.4125 * safezoneW";
            h                   = 0.022 * safezoneH;
            colorBackground[] = {0,0.306,1,1};
        };
        class TREE_ORGS_TITLE: ANZUS_ctrlStatic {
            idc                 = -1;
            text                = "你的帮派";
            x                   = "0.296354 * safezoneW + safezoneX";
            y                   = "0.251852 * safezoneH + safezoneY";
            w                   = "0.165 * safezoneW";
            h                   = 0.022 * safezoneH;
            colorBackground[]   = {0.05,0.05,0.05,1};
        };
        class ORG_SELECTED_INFO: TREE_ORGS_TITLE {
            text                = "帮派情报";
            x                   = "0.464573 * safezoneW + safezoneX";
            y                   = "0.251852 * safezoneH + safezoneY";
            w                   = "0.239232 * safezoneW";
        };
        class SELMEMBER_TITLE: TREE_ORGS_TITLE {
            text                = "Selected Member";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.465763 * safezoneH + safezoneY";
            w                   = "0.239232 * safezoneW";
        };
        class ORG_SELECTED_NAME_TITLE: ANZUS_ctrlStatic {
            idc                 = -1;
            text                = "帮派名称:";
            x                   = "0.464573 * safezoneW + safezoneX";
            y                   = "0.275 * safezoneH + safezoneY";
            w                   = "0.0691184 * safezoneW";
            h                   = 0.022 * safezoneH;
            colorBackground[]   = {0,0,0,0.5};
            style               = 0x01;
        };
        class ORG_CREATED_DATE_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "帮主:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.298148 * safezoneH + safezoneY";
        };
        class ORG_LASTACTIVE_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "帮派银行:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.321296 * safezoneH + safezoneY";
        };
        class ORG_LEVEL_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "帮派角色:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.344444 * safezoneH + safezoneY";
        };
        class ORG_BANK_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "最大成员数:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.367593 * safezoneH + safezoneY";
        };
        class ORG_OWNER_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "创建:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.390741 * safezoneH + safezoneY";
        };
        class SELMEMBER_NAME_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "姓名:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.489141 * safezoneH + safezoneY";
        };
        class SELMEMBER_RANK_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "等级:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.512289 * safezoneH + safezoneY";
        };
        class SELMEMBER_ONLINE_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "地位:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.535437 * safezoneH + safezoneY";
        };
        class ORG_INVITE_PLAYER: ORG_SELECTED_NAME_TITLE {
        	text               = "邀请玩家:";
        	x                  = "0.464583 * safezoneW + safezoneX";
        	y                  = "0.413889 * safezoneH + safezoneY";
        };
        class FOUNDORG_NAME_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "频率群:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.590637 * safezoneH + safezoneY";
        };
    };

    class Controls {
        class TREE_GANGS: ANZUS_ctrlTree {
        	idc                = 8999321;
        	x                  = "0.296354 * safezoneW + safezoneX";
        	y                  = "0.275 * safezoneH + safezoneY";
        	w                  = "0.165 * safezoneW";
        	h                  = "0.3470 * safezoneH";
        	colorBackground[]  = {0,0,0,0.5};
        };
        class BUTTON_CLOSE: ANZUS_ctrlButtonCancel {
            idc                = 8999322;
        	x                  = "0.692843 * safezoneW + safezoneX";
        	y                  = "0.225 * safezoneH + safezoneY";
        	w                  = "0.0134063 * safezoneW";
        };
        class GANG_NAME: ANZUS_ctrlStatic {
        	idc                = 8999323;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.275 * safezoneH + safezoneY";
        	w                  = "0.169133 * safezoneW";
        	h                  = "0.022 * safezoneH";
        	colorBackground[]  = {0,0,0,0.4};
        };
        class GANG_OWNER: GANG_NAME {
        	idc                = 8999324;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.298148 * safezoneH + safezoneY";
        };
        class GANG_BANK: GANG_NAME {
        	idc                = 8999325;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.321296 * safezoneH + safezoneY";
        };
        class GANG_ROLE: GANG_NAME {
        	idc                = 8999326;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.344444 * safezoneH + safezoneY";
        };
        class GANG_MAXMEMBERS: GANG_NAME {
        	idc                = 8999327;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.367593 * safezoneH + safezoneY";
        };
        class GANG_CREATED: GANG_NAME {
        	idc                = 8999328;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.390741 * safezoneH + safezoneY";
        };
        class GANG_SELMEMBER_NAME: GANG_NAME {
        	idc                = 8999329;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.489141 * safezoneH + safezoneY";
        };
        class GANG_SELMEMBER_RANK: GANG_NAME {
        	idc                = 8999330;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.512289 * safezoneH + safezoneY";
        };
        class GANG_SELMEMBER_ONLINE: GANG_NAME {
        	idc                = 8999331;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.535437 * safezoneH + safezoneY";
        };
        class LIST_PLAYERS_COMBO: ANZUS_ctrlCombo {
        	idc                = 8999334;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.413889 * safezoneH + safezoneY";
        	w                  = "0.152612 * safezoneW";
        	h                  = "0.022 * safezoneH";
        	colorBackground[]  = {0,0,0,0.4};
        };
        class BUTTON_INVITE_PLAYERS: ANZUS_ctrlDefaultButton {
            idc                = 8999335;
            text               = "OK";
        	x                  = "0.6875 * safezoneW + safezoneX";
        	y                  = "0.413889 * safezoneH + safezoneY";
        	w                  = "0.01586 * safezoneW";
        	h                  = "0.022 * safezoneH";
        };
        class BUTTON_LEAVEORG: ANZUS_ctrlDefaultButton {
            idc                = 8999336;
            text               = "离开帮派";
            x                  = "0.464583 * safezoneW + safezoneX";
            y                  = "0.437037 * safezoneH + safezoneY";
            w                  = "0.1195145 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class BUTTON_DISBANDORG: ANZUS_ctrlDefaultButton {
            idc                = 8999337;
        	text               = "解散帮派";
            x                  = "0.584000 * safezoneW + safezoneX";
        	y                  = "0.437037 * safezoneH + safezoneY";
        	w                  = "0.1195145 * safezoneW";
        	h                  = "0.0198 * safezoneH";
        };
        class BUTTON_SELMEMBER_KICK: ANZUS_ctrlDefaultButton {
            idc                = 8999339;
            text               = "踢";
            x                  = "0.464062 * safezoneW + safezoneX";
            y                  = "0.55823 * safezoneH + safezoneY";
            w                  = "0.0797499 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class BUTTON_SELMEMBER_PROMOTE: ANZUS_ctrlDefaultButton {
            idc                = 8999340;
            text               = "提升";
            x                  = "0.544228 * safezoneW + safezoneX";
            y                  = "0.55823 * safezoneH + safezoneY";
            w                  = "0.0797499 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class BUTTON_SELMEMBER_DEMOTE: ANZUS_ctrlDefaultButton {
            idc                = 8999341;
            text               = "降级";
            x                  = "0.624394 * safezoneW + safezoneX";
            y                  = "0.55823 * safezoneH + safezoneY";
            w                  = "0.07875 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class GANGFREQ_INPUT: ANZUS_ctrlEdit {
        	idc                = 8999342;
            toolTip            = "输入您的帮派将使用的频率。";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.591637 * safezoneH + safezoneY";
        	w                  = "0.153133 * safezoneW";
        	h                  = "0.022 * safezoneH";
        	colorBackground[]  = {0,0,0,0.4};
            maxChars           = 4;
        };
        class BUTTON_SETFREQ: ANZUS_ctrlDefaultButton {
            idc                = 8999343;
            text               = "OK";
        	x                  = "0.6875 * safezoneW + safezoneX";
        	y                  = "0.590637 * safezoneH + safezoneY";
        	w                  = "0.01586 * safezoneW";
        	h                  = "0.022 * safezoneH";
        };
    };
};
