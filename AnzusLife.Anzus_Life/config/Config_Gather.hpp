class CfgGather {
    class Resources {
        class apple {
            amount = 5;
            zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
            item = "";
            zoneSize = 30;
        };

        class peach {
            amount = 5;
            zones[] = { "peaches_1", "peaches_2", "peaches_3", "peaches_4" };
            item = "";
            zoneSize = 30;
        };

        class heroin_unprocessed {
            amount = 1;
            zones[] = { "heroin_1" };
            item = "";
            zoneSize = 30;
        };

        class cocaine_unprocessed {
            amount = 1;
            zones[] = { "cocaine_1" };
            item = "";
            zoneSize = 20;
        };

        class cannabis {
            amount = 1;
            zones[] = { "weed_1" };
            item = "";
            zoneSize = 30;
        };

        class MDMA {
            amount = 1;
            zones[] = { "MDMA_1" };
            item = "";
            zoneSize = 30;
        };

        class metal {
            amount = 1;
            zones[] = { "metal_1" };
            item = "";
            zoneSize = 50;
        };

    		class rubberU
    		{
    			amount = 2;
    			zones[] = { "rubber_1" };
    			item = "";
                zoneSize = 30;
    		};

    		class goldcoin
    		{
    			amount = 1;
    			zones[] = { "goldcoin_1" };
    			item = "";
                zoneSize = 30;
    		};

        class wool
    		{
    			amount = 3;
    			zones[] = { "wool_1" };
    			item = "";
                zoneSize = 30;
    		};

        class mushrooms {
            amount = 1;
            zones[] = { "lsd_1" };
            zoneSize = 30;
        };

        class uraniumU {
            amount = 1;
            zones[] = { "uranium_1" };
            item = "pdrill";
            zoneSize = 30;
        };
    };

    class Minerals {
        class oil_unprocessed {
            amount = 2;
            zones[] = { "oil_field_1", "oil_field_2" };
            item = "hardenedpickaxe";
            mined[] = { "oil_unprocessed" };
            zoneSize = 30;
        };

        class ruby {
            amount = 1;
            zones[] = { "ruby_1" };
            item = "hardenedpickaxe";
            mined[] = { "rubyU" };
            zoneSize = 30;
        };
    };
};
