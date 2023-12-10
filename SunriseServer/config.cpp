class CfgPatches {
    class SunriseServer {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "SunriseServer.pbo";
        author = "SunriseTeam";
    };
};

class CfgFunctions {
    class SunriseServer {
        class Bootstrap {
            file = "SunriseServer\bootstrap";
            
            class preInit {preInit = 1};
            //class postInit {postInit = 1};
            class initServer {postInit = 1};
            class initHeadless {};
            class initDB {};
        };
    };
};