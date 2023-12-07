class CfgJail {
    
    class Crimes {
        class VerbalAssault {
            crimeID     = 2;
            title       = "辱骂玩家";
            description = "Verbaly abusing a person.";
            penalty     = "Ticket";
            ticketValue = 700;
            prisonTime  = 0;
        };

        class Assault {
            crimeID     = 3;
            title       = "企图谋杀";
            description = "Assault on a person.";
            penalty     = "Ticket";
            ticketValue = 2000;
            prisonTime  = 0;
        };

        class GBH {
            crimeID     = 4;
            title       = "恶意伤害";
            description = "Grievously performing harm to a person's body..";
            penalty     = "Ticket";
            ticketValue = 4500;
            prisonTime  = 0;
        };

        class AttemptedMurder {
            crimeID     = 5;
            title       = "谋杀未遂";
            description = "Attemping to murder a person.";
            penalty     = "Ticket";
            ticketValue = 6000;
            prisonTime  = 0;
        };

        class Murder {
            crimeID     = 6;
            title       = "一级谋杀";
            description = "The unlawful premeditated killing of a person or living creature.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 1500;
        };

        class Manslaughter {
            crimeID     = 7;
            title       = "误杀";
            description = "The unlawful unintentional killing of a person or living creature.";
            penalty     = "Prison";
            ticketValue = 0; //-- ToDO: 150k or Prison
            prisonTime  = 100;
        };

        class TTK {
            crimeID     = 8;
            title       = "威胁杀人或伤害他人";
            description = "Threatening to kill or do harm to a person.";
            penalty     = "Ticket";
            ticketValue = 5000;
            prisonTime  = 0;
        };

        class ResistingArrest {
            crimeID     = 9;
            title       = "拒捕";
            description = "Resisting to comply with the officer's commands and being uncooperative.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 300;
        };

        class EscapingPrison {
            crimeID     = 10;
            title       = "越狱";
            description = "Escaping the prison before the sentence is carried out.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 10; //--- ToDO: Get players current prison time and * 2
        };

        class Theft {
            crimeID     = 11;
            title       = "偷窃";
            description = "Taking another person's property or services without that person's permission or consent.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 5;
        };

        class Robbery {
            crimeID     = 12;
            title       = "抢劫";
            description = "Taking another person's property by use of force.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 100;
        };

        class ArmedRobbery {
            crimeID     = 13;
            title       = "武装抢劫";
            description = "Taking another person's property by use of armed weaponry.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 1200;
        };

        class AttemptedVehiclesTheft {
            crimeID     = 14;
            title       = "盗窃车辆未遂";
            description = "Attempting to take someone's vehicle without their consent or permission.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 5000;
        };

        class StolenPoliceClothing {
            crimeID     = 15;
            title       = "盗取警用制服";
            description = "Stealing and wearing stolen police clothing.";
            penalty     = "Ticket";
            ticketValue = 4500;
            prisonTime  = 0;
        };

        class GrandTheftAuto {
            crimeID     = 16;
            title       = "盗窃车辆";
            description = "Take someone's vehicle without their consent or permission.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 7000;
        };

        class LegalWithoutLicense {
            crimeID     = 17;
            title       = "拥有枪支没许可证";
            description = "In possession of a legal firearm however without the proper needed license.";
            penalty     = "Ticket";
            ticketValue = 3500;
            prisonTime  = 0;
        };

        class VisableFirearmLegal {
            crimeID     = 18;
            title       = "公共区域可见的合法枪支";
            description = "Displaying a legal firearm openly in public areas.";
            penalty     = "Ticket";
            ticketValue = 2000; 
            prisonTime  = 0;
        };

        class IllegalFirearm {
            crimeID     = 19;
            title       = "非法持有枪支";
            description = "In possession of an illegal firearm.";
            penalty     = "Ticket";
            ticketValue = 6000; 
            prisonTime  = 0;
        };

        class IllegalAttachment {
            crimeID     = 20;
            title       = "非法扣押";
            description = "In possession of an illegal Attacment.";
            penalty     = "Ticket";
            ticketValue = 1500;
            prisonTime  = 0;
        };

        class IllegalMagazine {
            crimeID     = 21;
            title       = "持有非法杂志";
            description = "In possession of an illegal Magazine.";
            penalty     = "Ticket";
            ticketValue = 100;
            prisonTime  = 0;
        };

        class IllegallySelling {
            crimeID     = 22;
            title       = "出售非法枪支";
            description = "Engaging in trade that involves trade of illegal firearm.";
            penalty     = "Ticket";
            ticketValue = 6000;
            prisonTime  = 0;
        };

        class Speeding {
            crimeID     = 23;
            title       = "超速行驶";
            description = "Breaching Goverment Speed Limits on the national roads.";
            penalty     = "Ticket";
            ticketValue = 1250;
            prisonTime  = 0;
        };
		
		class ArtThief {
            crimeID     = 24;
            title       = "艺术贼";
            description = "Steal art from art gallery.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 35;
        };
    };

    class Jails {
        class Anzus_Life {
            class KamdanPrison {
                name        = "Kamdan Prison";
                description = "Kamdan Prison is the national prison on Kamdan.";
                icon        = "";
                class ProcessingArea {
                    direction = 90;
                    positionATL[] = {9390.16, 5762.41, 0};
                };
                class ReleaseArea {
                    direction = 308;
                    positionATL[] = {8780.15, 6268.48, 0};
                };
            };
        };
    };
};