local app = select(2,...);

local expansionID = 7;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Island Plate
{"Razorfin","","Island Expedition",35,80001,{100463,100464,100465,100466,100467,100468,100469,100470,}},
{"Bloodwake","","Island Expedition",35,80001,{100559,100560,100561,100562,100563,100564,100565,100566,}},
{"Rattling Bone","","Island Expedition",35,80001,{100551,100552,100553,100554,100555,100556,100557,100558,}},
{"Geocrag","","Island Expedition",35,80001,{100447,100448,100449,100450,100451,100452,100453,100454,}},

{"Twilight Dragon's","Note: Non-recolor of Tier 13 Warrior Set.","Island Expedition",35,80001,{100436,100438,100437,100433,100431,100432,100434,100435,}},
{"Tomb Keeper's","Note: Non-recolor of Tier 15 Warrior Set.","Island Expedition",35,80001,{100489,100494,100493,100490,100487,100488,100491,100492,}},

--Island Mail
{"Dragonrider's","","Island Expedition",68,80001,{100423,100424,100425,100426,100427,100428,100429,100430,}},
{"Mrrglurggl","","Island Expedition",68,80001,{100495,100496,100497,100498,100499,100500,100501,100502,}},
{"Voodoo Stalker's","","Island Expedition",68,80001,{100550,100548,100545,100544,100543,100546,100547,100549,}},

{"Wild Marauder","Note: Non-recolor of Tier 14 Hunter Set.","Island Expedition",68,80001,{100573,100572,100571,100569,100574,100570,100568,100567,}},
{"Headshrinker's","Note: Non-recolor of Tier 13 Shaman Set.","Island Expedition",68,80001,{100519,100520,100522,100521,100523,100524,100526,100525,}},
{"Saurok Scale","Note: Non-recolor of Tier 15 Hunter Set.","Island Expedition",68,80001,{100528,100530,100534,100529,100531,100532,100533,100527,}},

--Island Leather
{"Firekin","","Island Expedition",3592,80001,{100583,100584,100585,100586,100587,100588,100589,100590,}},
{"Fallen Runelord's","","Island Expedition",3592,80001,{103118,103119,103120,103121,103122,103123,103124,103125,}},
{"Miststalker's","","Island Expedition",3592,80001,{100591,100592,100593,100594,100595,100596,100597,100598,}},
{"Spiritbough","","Island Expedition",3592,80001,{100471,100472,100473,100474,100475,100476,100477,100478,}},
{"Whirling Dervish","","Island Expedition",3592,80001,{100575,100576,100577,100578,100579,100580,100581,100582,}},

{"Tranquil Path","Note: Non-recolor of Tier 14 Monk Set.","Island Expedition",3592,80001,{100458,100461,100457,100459,100460,100455,100456,100462,}},
{"Feralbark","Note: Non-recolor of Tier 14 Druid Set.","Island Expedition",3592,80001,{100421,100420,100417,100419,100418,100415,100416,100422,}},

--Island Cloth
{"Duskhaven Suit","","Island Expedition",400,80001,{103136,103137,103138,103147,}},
{"Duskhaven Dress","","Island Expedition",400,80001,{103135,103136,103147,}},
{"Swarmfury","","Island Expedition",400,80001,{100479,100480,100481,100482,100483,100484,100485,100486,}},
{"Hydraxian","","Island Expedition",400,80001,{100439,100440,100441,100442,100443,100444,100445,100446,}},
{"Frostwind","","Island Expedition",400,80001,{100535,100536,100537,100538,100539,100540,100541,100542,}},
{"Dark Animator's","","Island Expedition",400,80001,{103126,103127,103128,103129,103130,103131,103132,103133,}},
{"Mindwrack","","Island Expedition",400,80001,{93159,93160,93161,93163,93165,93162,}},
{"Spider Acolyte's","","Island Expedition",400,80001,{100504,100505,100506,100507,100508,100509,100510,100511,}},
{"Deeptide","","Island Expedition",400,80001,{105104,105105,105106,105107,105108,105109,105110,105131,}},

{"Faceless Follower's","Note: Non-recolor of Tier 13 Warlock Set.","Island Expedition",400,80001,{100517,100518,100516,100513,100512,100514,100515,100511,}},

--Darkshore Alliance
{"Wardenguard's","","Darkshore Warfront",35,80101,{101672,101670,103098,101668,101675,101667,101673,101674,101669,},"Alliance"},
{"Wardenguard's","","Darkshore Warfront",35,80101,{103005,103007,103106,103002,103009,103004,103008,103006,103003,},"Alliance"},

{"Kaldorei Archer's","","Darkshore Warfront",68,80101,{101663,101662,103096,101660,101659,101664,101665,101661,101666},"Alliance"},
{"Kaldorei Archer's","","Darkshore Warfront",68,80101,{102997,102999,103097,102994,102996,103000,102998,102995,},"Alliance"},

{"Darkwood Sentinel's","","Darkshore Warfront",3592,80101,{101655,101654,103094,101652,101658,101651,101656,101657,101653,},"Alliance"},
{"Darkwood Sentinel's","","Darkshore Warfront",3592,80101,{102989,102991,103095,102986,102993,102988,102992,102990,102987,},"Alliance"},

{"Moonpriest's","","Darkshore Warfront",400,80101,{101644,101645,101646,101647,101648,101649,101650,{101671,102794},},"Alliance"},
{"Moonpriest's","","Darkshore Warfront",400,80101,{102980,102982,{102985,103078},102984,102979,102983,102981,102978,103093},"Alliance"},

--Darkshore Horde
{"Deathguard's","","Darkshore Warfront",35,80101,{101699,101700,101701,101702,101704,101705,101706,101707,},"Horde"},
{"Deathguard's","","Darkshore Warfront",35,80101,{102973,102975,102970,102977,102972,102976,102974,102971,},"Horde"},

{"Blightguard's","","Darkshore Warfront",68,80101,{101695,101694,103101,101692,101698,101691,101696,101697,101693,},"Horde"},
{"Blightguard's","","Darkshore Warfront",68,80101,{102965,102967,103102,102962,102969,102964,102968,102966,102963,},"Horde"},

{"Deathstalker's","","Darkshore Warfront",3592,80101,{101687,101686,101684,101690,101683,101688,101689,101685,103100},"Horde"},
{"Deathstalker's","","Darkshore Warfront",3592,80101,{102957,102959,102954,102961,102956,102960,102958,102955,},"Horde"},

{"Plaguebringer's","","Darkshore Warfront",400,80101,{101676,101677,101678,101679,101680,101681,101682,101703,103099},"Horde"},
{"Plaguebringer's","","Darkshore Warfront",400,80101,{102948,102950,102953,102952,102947,102951,102949,102946,},"Horde"},

--Arathi Alliance
{"7th Legionnaire's","","Arathi Warfront",35,80001,{99140,99142,99145,99146,99149,99152,99155,99156,99088,},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",35,80001,{100720,100716,100712,100724,100714,100722,100728,100718,100726,},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",35,80001,{100721,100717,100713,100725,100715,100723,100729,100719,100727,},"Alliance"},

{"7th Legionnaire's","","Arathi Warfront",68,80001,{99020,99032,99129,99133,99135,99136,99137,99138,99084,},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",68,80001,{100738,100736,100734,100742,100732,100740,100746,100730,100744},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",68,80001,{100739,100737,100735,100743,100733,100741,100747,100731,100745},"Alliance"},

{"7th Legionnaire's","","Arathi Warfront",3592,80001,{99006,99119,99011,99021,99033,99113,99121,99080,99108,},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",3592,80001,{100706,100704,100702,100694,100700,100696,100710,100698,100708,},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",3592,80001,{100707,100705,100703,100695,100701,100697,100711,100699,100709,},"Alliance"},

{"7th Legionnaire's","","Arathi Warfront",400,80001,{99003,99008,99019,99030,99068,99071,99073,99075,99001,},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",400,80001,{100688,100686,100676,100678,100684,100690,100692,100682,100680,},"Alliance"},
{"7th Legionnaire's","","Arathi Warfront",400,80001,{100689,100687,100677,100679,100685,100691,100693,100683,100681,},"Alliance"},

--Arathi Horde
{"Honorbound Centurion's","","Arathi Warfront",35,80001,{99062,99187,99189,99190,99192,99193,99194,99195,99103,},"Horde"},
{"Honorbound Centurion's","","Arathi Warfront",35,80001,{99332,99326,99320,99338,99318,99336,99342,99330,99340,},"Horde"},
{"Honorbound Centurion's","","Arathi Warfront",35,80001,{99333,99327,99321,99339,99319,99337,99343,99331,99341,},"Horde"},

{"Honorbound Vanguard's","","Arathi Warfront",68,80001,{99180,99037,99063,99175,99179,99182,99183,99185,99101,},"Horde"},
{"Honorbound Vanguard's","","Arathi Warfront",68,80001,{100668,100664,100662,100658,100660,100670,100674,100666,100672},"Horde"},
{"Honorbound Vanguard's","","Arathi Warfront",68,80001,{100669,100665,100663,100659,100661,100671,100675,100667,100673},"Horde"},

{"Honorbound Outrider's","","Arathi Warfront",3592,80001,{99053,{99038,99274},99064,99166,99169,99171,99172,99173,99095,},"Horde"},
{"Honorbound Outrider's","","Arathi Warfront",3592,80001,{100650,100648,100646,{100640,99274},100644,100652,100656,100642,100654,},"Horde"},
{"Honorbound Outrider's","","Arathi Warfront",3592,80001,{100651,100649,100647,{100641,99274},100645,100653,100657,100643,100655,},"Horde"},

{"Honorbound Artificer's","","Arathi Warfront",400,80001,{99160,99158,99092,99035,99061,99162,99164,99051,99040,},"Horde"},
{"Honorbound Artificer's","","Arathi Warfront",400,80001,{100637,100636,100635,100631,100634,100638,100639,100633,100632,},"Horde"},
{"Honorbound Artificer's","","Arathi Warfront",400,80001,{100626,100624,100622,100614,100620,100628,100630,100618,100616,},"Horde"},


--Nazjatar
{"Zanj'ir Scaleguard","","Nazjatar",35,80200,{104130,104128,105152,104126,104133,104125,104131,104132,104127,}},
{"Wavecrash","","Nazjatar",35,80200,{105132,105130,105137,105128,105135,105127,105133,105134,105129,}},
{"Reefwalker","","Nazjatar",68,80200,{105123,105122,105136,105120,105126,105119,105124,105125,105121,}},
{"Azsh'ari Stormsurger","","Nazjatar",68,80200,{104121,104120,105153,104118,104124,104117,104122,104123,104119,}},
{"Fathomstalker","","Nazjatar",3592,80200,{104113,104112,105151,104110,104116,104109,104114,104115,104111,}},
{"Slithershell","","Nazjatar",3592,80200,{105115,105114,105138,105112,105118,105111,105116,105117,105113,}},
{"Shirakess","","Nazjatar",400,80200,{104105,104104,105150,104102,104108,104129,104106,104107,104103,}},
{"Deeptide","","Nazjatar",400,80200,{105107,105106,105139,105104,105110,105131,105108,105109,105105,}},

--Brawler's
{"Brawler's","","Brawler's Guild",0,80150,{104146,104147,104148,104149,104150,104151,104152,104153,},"Horde"},
{"Brawler's","","Brawler's Guild",0,80150,{104142,104141,104139,104145,104137,104143,104144,104140,},"Alliance"},

--Kul Tiran Dungeon Plate
{"Maritime Guard","","Kul Tiras Dungeon (BfA)",35,80000.5,{92529,94316,94372,95046,95197,95215,95217,95218,95268,}},
{"Harpooner's","","Kul Tiras Dungeon (BfA)",35,80000.5,{95656,95704,97052,95666,95659,95673,95660,95669,95671,}},
{"Petrified Wickerplate","","Kul Tiras Dungeon (BfA)",35,80000.5,{95655,95703,97051,95198,94317,95672,94373,95216,95670,}},
{"Proudmoore Marine's","","Kul Tiras Dungeon (BfA)",35,80000.5,{97599,105016,104841,97625,97642,97566,97622,97683,}},
--Zandalar Dungeon Plate
{"Embellished Ritual","","Zandalar Dungeon (BfA)",35,80000.5,{95621,95639,98376,95645,95628,95619,95630,95626,95617,}},
{"Everlasting Guardian","","Zandalar Dungeon (BfA)",35,80000.5,{95620,95638,98375,95222,94371,95618,95202,94321,95616,}},
{"Putrid Path","","Zandalar Dungeon (BfA)",35,80000.5,{92511,92514,92516,94320,94370,95040,95201,95208,95221,}},
{"Grand Fleet","Note: Incomplete Set","Zandalar Dungeon (BfA)",35,80000.5,{96502,97533,97551,97554,97557,97572,}},

--Kul Tiran Dungeon Mail
{"Cannoneer's","","Kul Tiras Dungeon (BfA)",68,80000.5,{95132,92531,94364,95128,95124,95178,95123,92536,}},
{"Witch Hunter's","","Kul Tiras Dungeon (BfA)",68,80000.5,{95878,95874,95875,95876,95835,95886,95845,96219}},
{"Flint-Linked","","Kul Tiras Dungeon (BfA)",68,80000.5,{95877,95873,95125,95129,95834,95885,95871,94365}},
{"Seacallers","","Kul Tiras Dungeon (BfA)",68,80000.5,{104970,105022,97514,104830,97621,97638,97618,}},
--Zandalar Dungeon Mail
{"Glittering Gold","","Zandalar Dungeon (BfA)",68,80000.5,{98398,98421,94309,94313,98384,98388,98377,94311}},
{"Eternal Service","","Zandalar Dungeon (BfA)",68,80000.5,{92518,95131,94310,94312,94308,95133,94348,95130,}},
{"Sanguine Fervor","","Zandalar Dungeon (BfA)",68,80000.5,{98416,98405,98381,98383,98385,98407,98387,98382}},
{"Akunda's Grounding","Note: Incomplete Set","Zandalar Dungeon (BfA)",68,80000.5,{101551,97507,97516,97512,97521,97594,}},

--Kul Tiran Dungeon Leather
{"Irontide","","Kul Tiras Dungeon (BfA)",3592,80000.5,{92512,92528,92532,95050,95052,95065,95100,95103,95083,}},
{"Azerite Arsenal","","Kul Tiras Dungeon (BfA)",3592,80000.5,{98439,95589,99295,98478,98453,98467,98474,98449,95576,}},
{"Sea Dog's","","Kul Tiras Dungeon (BfA)",3592,80000.5,{98438,95053,99294,98477,95066,98466,95101,98448,95575,}},
{"Mekgineer's","","Kul Tiras Dungeon (BfA)",3592,80000.5,{104847,104967,104957,105028,105018,105027,105021,}},
--Zandalar Dungeon Leather
{"Sand-Shined Snakeskin","","Zandalar Dungeon (BfA)",3592,80000.5,{92519,94377,95092,94358,92510,94302,94306,95061,}},
{"Blood Elder's","","Zandalar Dungeon (BfA)",3592,80000.5,{95586,95579,95574,95584,95597,95580,95578,95609,}},
{"Slithering Loa","","Zandalar Dungeon (BfA)",3592,80000.5,{95585,94303,95573,94359,95596,94307,95577,95608,}},
{"Swampstalker","Note: Incomplete Set","Zandalar Dungeon (BfA)",3592,80000.5,{96501,97471,97474,97482,97496,}},

--Kul Tiran Dungeon Cloth
{"Undying Devotion","","Kul Tiras Dungeon (BfA)",400,80000.5,{94298,92530,94354,94961,{95014,94296},94975,95008,92535,}},
{"Void-Touched Waters","","Kul Tiras Dungeon (BfA)",400,80000.5,{95741,95756,{95778,95744},95752,95743,95713,95745,95750,}},
{"Drowned Lord","","Kul Tiras Dungeon (BfA)",400,80000.5,{95740,95755,{95015,94297},95751,95742,95712,94299,94355,}},
{"Maritime Spellweaver's","","Kul Tiras Dungeon (BfA)",400,80000.5,{104852,104964,97608,97611,105009,97462,97628,}},
--Zandalar Dungeon Cloth
{"Reborn Serpent","","Zandalar Dungeon (BfA)",400,80000.5,{94352,94322,94300,94349,94350,94966,94960,94965,}},
{"Sandswept","","Zandalar Dungeon (BfA)",400,80000.5,{95543,95553,95546,95545,95551,95549,95547,95541,}},
{"Everliving Fealty","","Zandalar Dungeon (BfA)",400,80000.5,{95542,95552,94351,95544,95550,95548,94353,94301,}},
{"Swamp Medic's","Note: Incomplete Set","Zandalar Dungeon (BfA)",400,80000.5,{97420,97432,97435,97444,97581,96509,}},

--Leveling Plate
{"Dread Corsair","","Kul Tiras Leveling (BfA)",35,80000,{92068,92064,92056,91533,91354,91458,92077,92061,}},
{"Corlain","","Kul Tiras Leveling (BfA)",35,80000,{91805,91994,91807,91808,91809,91810,91989,91812,}},
{"Sea Raider's","","Kul Tiras Leveling (BfA)",35,80000,{91919,91922,91927,91930,91934,91940,91943,91948,}},
{"Zandalar Quest","","Zandalar Leveling (BfA)",35,80000,{92254,92257,92262,92265,92269,92275,92278,92283,}},
{"Zandalar Quest","","Zandalar Leveling (BfA)",35,80000,{91858,91859,91860,91861,91862,91863,91864,91865,}},
{"Zandalar Quest","","Zandalar Leveling (BfA)",35,80000,{91772,91773,91774,91775,91776,91777,91778,91779,}},
--Leveling Mail
{"Crone-Seeker's","","Kul Tiras Leveling (BfA)",68,80000,{92012,92016,91996,91991,91999,92003,92009,91987,}},
{"Outrigger","","Kul Tiras Leveling (BfA)",68,80000,{91920,91924,91929,91932,91936,91942,91945,91949,}},
{"Stormchaser","","Kul Tiras Leveling (BfA)",68,80000,{92054,92058,92063,92066,92070,92076,92079,92083,}},
{"Zalamar","","Zandalar Leveling (BfA)",68,80000,{91794,91793,91792,91790,91796,91795,91789,91791,}},
{"Resilient","","Zandalar Leveling (BfA)",68,80000,{92255,92259,92264,92267,92271,92277,92280,92284,}},
{"Torcalin","","Zandalar Leveling (BfA)",68,80000,{92121,92125,92130,92133,92137,92143,92146,92150,}},
--Leveling Leather
{"Banisher","","Kul Tiras Leveling (BfA)",3592,80000,{92017,91992,92004,91993,91818,91819,91820,92013,}},
{"Darkwater","","Kul Tiras Leveling (BfA)",3592,80000,{92055,92059,92060,92067,92071,92073,92080,92084,}},
{"Freebooter","","Kul Tiras Leveling (BfA)",3592,80000,{91921,91925,91926,91933,91937,91939,91946,91950,}},
{"Festerroot","","Zandalar Leveling (BfA)",3592,80000,{91783,91785,91782,91781,91786,91787,91788,91784,}},
{"Scorching Sands","","Zandalar Leveling (BfA)",3592,80000,{92256,92260,92261,92268,92272,92274,92281,92285,}},
{"Jambani","","Zandalar Leveling (BfA)",3592,80000,{98189,98190,98191,98192,98193,98194,98195,98196,}},
--Leveling Cloth
{"Navigator's","Kul Tiras Leveling","Kul Tira Leveling (BfA)",400,80000,{91935,91931,91923,91947,91938,91941,91944,91928,}},
{"Tidespeaker","Kul Tiras Leveling","Kul Tira Leveling (BfA)",400,80000,{92057,92062,92065,92069,92072,92075,92078,92081,}},
{"Wickerwoven","Kul Tiras Leveling","Kul Tira Leveling (BfA)",400,80000,{92011,91998,91995,92002,92005,91990,92014,92008,}},
{"Zanchuli","","Zandalar Leveling (BfA)",400,80000,{92136,92132,92124,92148,92139,92142,92145,92129,}},
{"Loa Speaker's","","Zandalar Leveling (BfA)",400,80000,{91848,91849,91850,91851,91852,91853,91854,91855,}},
{"Lastwind","","Zandalar Leveling (BfA)",400,80000,{92258,92263,92266,92270,92273,92276,92279,92282,}},
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
{1973,106773,106901}, --Season 4 BfA, Mail, Corrupted Gladiator's Chain Chest/Robe (Elite)
{1957,106772,107212}, --Season 4 BfA, Mail, Corrupted Gladiator's Chain Chest/Robe
{1986,108189,108177}, --Ny'alotha, Mail, Chest/Robe (Normal)
{1988,108191,108179}, --Ny'alotha, Mail, Chest/Robe (Heroic)
{1987,108190,107475}, --Ny'alotha, Mail, Chest/Robe (LFR)
{1989,108192,108180}, --Ny'alotha, Mail, Chest/Robe (Mythic)

{1835,104432,104444}, --Eternal Palace, Mail, Chest/Robe (Heroic)
{1843,104431,104443}, --Eternal Palace, Mail, Chest/Robe (LFR)
{1831,104430,104442}, --Eternal Palace, Mail, Chest/Robe (Normal)
{1839,104433,104445}, --Eternal Palace, Mail, Chest/Robe (Mythic)

{1814,101880,102238}, --BoD, Mail, Chest/Robe (Normal)
{1816,101882,102240}, --BoD, Mail, Chest/Robe (Heroic)
{1815,101881,102239}, --BoD, Mail, Chest/Robe (LFR)
{1817,101883,102241}, --BoD, Mail, Chest/Robe (Mythic)

{1813,102237,102249}, --BoD, Leather, Chest/Robe (Mythic)
{1812,102236,102248}, --BoD, Leather, Chest/Robe (Heroic)
{1811,102235,102247}, --BoD, Leather, Chest/Robe (LFR)
{1810,102234,102246}, --BoD, Leather, Chest/Robe (Normal)

{1796,101671,102794}, --Season 1 BfA, Cloth, Chest/Robe (Warfront)(Alliance)
{1671,100640,99274}, --Season 1 BfA, Leather, Chest/Robe (Warfront)(Horde)

{1804,102667,102661}, --Blood Elf Heritage Armor, Chest/Robe
{1977,107808,108030}, --Goblin Heritage Armor, Goggles Up/Down
{1976,107820,107821}, --Worgen Heritage Armor, Chest/Robe
}

function AddToCollection()
  for i = 1, #db do
    local data = {};
    data.classMask = db[i][4];
    data.note = db[i][2];
    data.label = db[i][3];
    data.uiOrder = i;
    data.name = db[i][1];
    data.patchID = db[i][5];
    data.requiredFaction = db[i][7];
    data.favorite = false;
    data.expansionID = expansionID;
    if db[i][8] == true then
      data.noLongerObtainable = true;
    end
    
    data.setID = (expansionID + 1) * app.SetsFrame.ExpandedID + db[i][6][1];
    
    data.sources = {};
    for j=1,#db[i][6] do 
      if type(db[i][6][j]) == "table" then
        if not data.altSources then data.altSources = {}; data.altSourceNumbers = {}; end
        data.sources[db[i][6][j][1]] = false--C_TransmogCollection.GetSourceInfo(db[i][6][j][1]).isCollected;
        data.altSources[db[i][6][j][1]] = {db[i][6][j][1], db[i][6][j][2]};
        data.altSourceNumbers[db[i][6][j][1]] = 1;
      else
        data.sources[db[i][6][j]] = false--C_TransmogCollection.GetSourceInfo(db[i][6][j]).isCollected;
      end
    end
    
    app.SetsFrame.AddSetToTables(data);
  end
  
  for i = 1, #altAppearancesDB do
    app.SetsFrame.AddAltAppearancesToTables(altAppearancesDB[i][1],altAppearancesDB[i][2],altAppearancesDB[i][3]);
  end
end

app.ExpandedCallbacks[expansionID] = AddToCollection;
app.altAppearancesDB[expansionID] = altAppearancesDB;
--do
--  for i = 1, #altAppearancesDB do
--    app.ExpandedAltAppearances[altAppearancesDB[i][1]] = {altAppearancesDB[i][2],altAppearancesDB[i][3]};
--  end
--end

--data:
----classMask:    yes (simply use 35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
----collected:    no
----description:  yes
----expansionID:  no (file dependent can hardcode)
----favorite:     no
----hidden...:    no
----label:        yes (source i.e. dungeon/leveling/islands)
----limitedTime:  no
----name:         yes
----patchID:      yes (for sorting, 80300 = patch 8.3)
----requiredFact: yes
----setID:        yes (auto gened)
----uiOrder:      yes (might just always put 0, for sorting)
----sources:      myAddition, list of items in the set