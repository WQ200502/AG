/*
*   class:
*       MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       MateriANZUSive (Returned items) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       Text (Progess Bar Text) = Localised String
*       NoLicenseCost (Cost to process w/o license) = Scalar
*
*   Example for multiprocess:
*
*   class Example {
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MateriANZUSive[] = {{"diamond_cut",1}};
*       Text = "STR_Process_Example";
*       NoLicenseCost = 4000;
*   };
*/

class ProcessAction {
    class oil {
        MaterialsReq[] = {{"oil_unprocessed",1}};
        MateriANZUSive[] = {{"oil_processed",1}};
        Text = "STR_Process_Oil";
        NoLicenseCost = 1000;
    };

    class diamond {
        MaterialsReq[] = {{"diamondOre",1}};
        MateriANZUSive[] = {{"diamond",1}};
        Text = "STR_Process_Diamond";
        NoLicenseCost = 1000;
    };

    class heroin {
        MaterialsReq[] = {{"heroin_unprocessed",1}};
        MateriANZUSive[] = {{"heroin_processed",1}};
        Text = "STR_Process_Heroin";
        NoLicenseCost = 4000;
    };

    class coal {
        MaterialsReq[] = {{"coalOre",1}};
        MateriANZUSive[] = {{"coal",1}};
        Text = "STR_Process_Coal";
        NoLicenseCost = 1000;
    };

    class iron {
        MaterialsReq[] = {{"ironOre",1}};
        MateriANZUSive[] = {{"iron",1}};
        Text = "STR_Process_Iron";
        NoLicenseCost = 1000;
    };
    
    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",1}};
        MateriANZUSive[] = {{"cocaine_processed",1}};
        Text = "STR_Process_Cocaine";
        NoLicenseCost = 4000;
    };

    class marijuana {
        MaterialsReq[] = {{"cannabis",1}};
        MateriANZUSive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        NoLicenseCost = 2500;
    };

    class rubber {
        MaterialsReq[] = {{"rubberU",1}};
        MateriANZUSive[] = {{"rubber",1}};
        Text = "STR_Process_rubber";    
        NoLicenseCost = 1000;
    };

    class cloth {
        MaterialsReq[] = {{"wool",1}};
        MateriANZUSive[] = {{"cloth",1}};
        Text = "STR_Process_cloth"; 
        NoLicenseCost = 1000;
    };
    
    class lsd {
        MaterialsReq[] = {{"mushrooms",1}};
        MateriANZUSive[] = {{"LSD",1}};
        Text = "STR_Process_LSD";   
        NoLicenseCost = 3000;
    };

    class ruby {
        MaterialsReq[] = {{"rubyU",1}};
        MateriANZUSive[] = {{"rubyC",1}};
        Text = "STR_Process_Ruby";  
        NoLicenseCost = 1500;
    };

    class uranium {
        MaterialsReq[] = {{"uraniumU",1}};
        MateriANZUSive[] = {{"uranium",1}};
        Text = "STR_Process_uranium";   
        NoLicenseCost = 3000;
    };
};