local app = select(2,...);

local expansionID = 0;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Naxx Polar SetsFrame
{"Polar","Original level 60 Naxx. Most pieces unavailable.","Naxxramas (Classic)",3592,10500,{9069,9028,8908,12507,8928,21032,8910,8909,},nil,true},
{"Icy Scale","Original level 60 Naxx. Most pieces unavailable.","Naxxramas (Classic)",68,10500,{9074,9042,8911,8929,21035,8912,8913,},nil,true},
{"Icebane","Original level 60 Naxx. Most pieces unavailable.","Naxxramas (Classic)",35,10500,{9068,9027,8916,14394,8926,8918,8917,},nil,true},
{"Glacial","Original level 60 Naxx. Most pieces unavailable.","Naxxramas (Classic)",400,100000,{9073,{8902,21024},14562,8927,21026,8904,8903,1837,},nil,true},

--Scarlet Crusade
{"Scale of the Scarlet Crusade","Purchased at DMF while wearing the Tabard of the Scarlet Crusade.","Scarlet Crusade",35,10001,{3913,3914,3915,3916,3917,3918,}},
{"Chain of the Scarlet Crusade","Purchased at DMF while wearing the Tabard of the Scarlet Crusade.","Scarlet Crusade",68,10001,{3914,3913,3915,3916,3917,3918,}},

--PvP Horde Plate
{"Blood Guard's Plate","","PvP (Classic)",1,10002,{39439,39438,68144,39431,39435,39432,39433,39434,},"Horde",true},
{"General's Plate","","PvP (Classic)",1,10002,{39503,39500,39504,39502,39505,39501,},"Horde",true},
{"Blood Guard's Lamellar","","PvP (Classic)",2,10002,{39507,39506,39451,39241,39449,39450,},"Horde",true},
{"General's Lamellar","","PvP (Classic)",2,10002,{39473,39471,39474,39470,39472,39475,},"Horde",true},

--PvP Horde Mail
{"Blood Guard's Mail","","PvP (Classic)",64,10002,{39413,39406,39401,68156,39402,39403,39405,39404,},"Horde",true},
{"General's Mail","","PvP (Classic)",64,10002,{39489,39490,39493,39491,39492,39488,},"Horde",true},
{"Blood Guard's Chain","","PvP (Classic)",4,10002,{39333,39334,68157,39335,39336,39337,39332,},"Horde",true},
{"General's Chain","","PvP (Classic)",4,10002,{39462,39463,39459,39461,39460,39458,},"Horde",true},

--PvP Horde Leather
{"Blood Guard's Dragonhide","","PvP (Classic)",1024,10002,{39321,39319,39314,68151,39316,39318,39317,39315,},"Horde",true},
{"General's Dragonhide","","PvP (Classic)",1024,10002,{39453,39457,39455,39452,39454,39456,},"Horde",true},
{"Blood Guard's Leather","","PvP (Classic)",8,10002,{39400,39388,39387,68152,39386,39385,39383,39384,},"Horde",true},
{"General's Leather","","PvP (Classic)",8,10002,{39482,39483,39484,39487,39486,39485,},"Horde",true},

--PvP Horde Cloth
{"Blood Guard's Satin","","PvP (Classic)",16,10002,{39368,39369,39382,68155,39371,39370,39367,},"Horde",true},
{"General's Satin","","PvP (Classic)",16,10002,{39476,39481,39478,39477,39479,},"Horde",true},
{"Blood Guard's Dreadweave","","PvP (Classic)",256,10002,{39417,39418,39366,68153,39427,39419,39415,39420,},"Horde",true},
{"General's Dreadweave","","PvP (Classic)",256,10002,{39496,39494,39495,39498,39497,},"Horde",true},
{"Blood Guard's Silk","","PvP (Classic)",128,10002,{39349,39353,68154,39348,39354,39350,},"Horde",true},
{"General's Silk","","PvP (Classic)",128,10002,{39465,39466,39464,39468,39467,},"Horde",true},

--PvP Alliance Plate
{"Knight-Lieutenant's Plate","","PvP (Classic)",1,10002,{39238,39231,39236,68145,39232,39233,39234,39235,},"Alliance",true},
--{"Marshal's Plate","","PvP (Classic)",1,10002,{39297,39294,39295,39293,39292,39296,},"Alliance",true},
{"Knight-Lieutenant's Lamellar","","PvP (Classic)",2,10002,{39200,39203,68148,39204,39201,39202,39199,},"Alliance",true},
--{"Marshal's Lamellar","","PvP (Classic)",2,10002,{39262,39263,39264,39266,39265,39267,},"Alliance",true}, --Duplicate of Knight-Lieutenant's

--PvP Alliance Mail
{"Knight-Lieutenant's Mail","","PvP (Classic)",64,10002,{68149,39224,39222,39219,39221,39220,39223,},"Alliance",true},
{"Marshal's Mail","","PvP (Classic)",64,10002,{39280,39281,39284,39282,39283,39285,},"Alliance",true},
{"Knight-Lieutenant's Chain","","PvP (Classic)",4,10002,{39191,39188,39184,68150,39186,39189,39187,39185,},"Alliance",true},
{"Marshal's Chain","","PvP (Classic)",4,10002,{39250,39255,39253,39254,39251,39252,},"Alliance",true},

--PvP Alliance Leather
{"Knight-Lieutenant's Dragonhide","","PvP (Classic)",1024,10002,{39183,39181,39177,68158,39180,39323,39178,39176,},"Alliance",true},
{"Marshal's Dragonhide","","PvP (Classic)",1024,10002,{39247,39244,39246,39249,39248,39245,},"Alliance",true},
{"Knight-Lieutenant's Leather","","PvP (Classic)",8,10002,{39218,39212,39215,68159,39211,39216,39398,39214,},"Alliance",true},
{"Marshal's Leather","","PvP (Classic)",8,10002,{39277,39276,39274,39278,39279,39275,},"Alliance",true},

--PvP Alliance Cloth
{"Knight-Lieutenant's Satin","","PvP (Classic)",16,10002,{39205,39210,68161,39377,39207,39379,},"Alliance",true},
{"Marshal's Satin","","PvP (Classic)",16,10002,{39268,39271,39273,39270,39272,},"Alliance",true},
{"Knight-Lieutenant's Dreadweave","","PvP (Classic)",256,10002,{39311,39229,68162,39226,39230,39225,},"Alliance",true},
{"Marshal's Dreadweave","","PvP (Classic)",256,10002,{39286,39291,39288,39290,39287,},"Alliance",true},
{"Knight-Lieutenant's Silk","","PvP (Classic)",128,10002,{39365,39195,39194,68160,39363,39197,39193,},"Alliance",true},
{"Marshal's Silk","","PvP (Classic)",128,10002,{39261,39259,39260,39257,39256,},"Alliance",true},


--Leveling Plate
{"Revenant","","Classic (Set 1)",35,10000,{13660,14960,14963,14961,14962,14183,}},
{"Templar","","Classic (Set 1)",35,10000,{14173,14216,3796,3794,14452,7304,}},
{"Emerald","","Classic (Set 1)",35,10000,{3906,10563,8962,8964,8183,3903,10669,8963,}},
{"Runic","","Classic (Set 1)",35,10000,{4482,13689,4486,21029,}},
{"Thorium","","Classic (Set 1)",35,10000,{4404,4405,4409,4407,4406,8145,}},

{"Glorious","","Classic (Set 2)",35,10000,{5810,5805,5807,5809,5811,5813,5806,}},
{"Lofty","","Classic (Set 2)",35,10000,{5763,5766,5767,5761,5762,5765,}},
{"Vanguard","","Classic (Set 2)",35,10000,{5695,5697,5700,5698,5702,5696,}},

{"Jade","","Classic (Set 3)",35,10000,{5754,5757,5759,5752,5753,5756,}},
{"Saltstone","","Classic (Set 3)",35,10000,{5734,5737,5739,5735,5742,5736,}},
{"Tyrant's","","Classic (Set 3)",35,10000,{5676,5679,5681,5680,5675,5674,}},

{"Imbued Plate","","Classic (Set 4)",35,10000,{3927,3929,3932,3930,3934,3928,}},
{"Enchanted Thorium","","Classic (Set 4)",35,10000,{4490,4491,14245,8736,8128}},
{"Commander's","","Classic (Set 4)",35,10000,{3937,3941,3935,3936,3939,}},
{"Hyperion","","Classic (Set 4)",35,10000,{3943,3946,3948,3944,3950,{3945,4499},}},

{"Exalted","","Classic (Set 5)",35,10000,{5820,5814,5816,5819,5817,5822,5815,}},
{"Enchanted Adamantite","","Classic (Set 5)",35,10000,{5740,9320,9321,9323,9322,14577,}},
{"Brutish","","Classic (Set 5)",35,10000,{5748,5743,5745,5747,5750,5749,5744,}},
{"Warleader's","","Classic (Set 5)",35,10000,{5703,5705,5708,5706,5710,5704,}},

{"Imperial","","Classic (Set 6)",35,10000,{4421,4422,4417,4418,4423,4420,4419,}},

{"Overlord's","","Classic (Set 7)",35,10000,{3834,3836,3830,3833,3835,3828,3829,3832,}},

{"Deathbone","","Classic (Set 8)",35,10000,{4210,5520,8901,5521,8339,5522,}},
{"Unmelting Ice","","Classic (Set 8)",35,10000,{13074,5524,7410,5523,8605,7455,}},
{"Bloadsoaked","","Classic (Set 8)",35,10000,{49122,49123,49118,49121,49131,49120,}},

{"Dark Iron","","Classic (Set 9)",35,10000,{89414,13904,7060,7905,7061,7631,}},

{"Alabaster","","Classic (Set 10)",35,10000,{3193,3195,3188,3191,3194,3192,3187,3190,}},
{"Gothic","","Classic (Set 10)",35,10000,{3723,3717,3719,3722,3720,3725,3718,}},
{"Valorous","","Classic (Set 10)",35,10000,{3155,3157,3150,3153,3156,3154,3149,3152,}},
{"Heavy Lamellar","","Classic (Set 10)",35,10000,{3872,3867,3870,3871,3865,3866,3869,}},

{"Heavy Lamellar","Note: Obtainable as green BoE items in Isle of Thunder (MoP).","Classic (Set 11)",35,10000,{49130,49127,49128,49124,49125,49129,49126,}},

{"Bloodforged","","Classic (Set 12)",35,10000,{5787,5789,5792,5790,5795,5788,}},
{"Symbolic","","Classic (Set 12)",35,10000,{5662,5668,5670,5669,5673,5667,}},
{"Sunscale","","Classic (Set 12)",35,10000,{5685,5688,5691,5689,5694,5687,}},
{"High Chief's","","Classic (Set 12)",35,10000,{5797,5799,5801,5796,5804,5798,}},

{"Ornate Mithril","","Classic (Set 13)",35,10000,{{4707,2980},2971,2981,2972,}},
{"Conqueror's","","Classic (Set 13)",35,10000,{10033,10031,10036,10032,10038,10034,}},

{"Battle Chain","","Classic (Set 14)",35,10000,{1169,10737,10731,10735,10739,68131,}},

{"Chromite","","Classic (Set 15)",35,10000,{3059,3061,3064,3062,3058,3060,}},
{"Field Plate","","Classic (Set 15)",35,10000,{3225,3219,3221,3224,3222,3218,3220,}},
{"Jouster's","","Classic (Set 15)",35,10000,{3067,3069,3072,3070,3066,3068,}},
{"Embossed Plate","","Classic (Set 15)",35,10000,{3638,3633,3635,3637,3640,3639,3634,}},

{"Brutal","","Classic (Set 16)",35,10000,{2721,2720,2718,9885,}},

{"Ango'rosh","","Classic (Set 17)",35,10000,{9957,9953,9951,9956,9952,9958,9954,}},
{"Heavy Mithril","","Classic (Set 17)",35,10000,{2964,10001,1398,2967,2978,10006,10002,}},
{"Platemail","","Classic (Set 17)",35,10000,{3027,3021,3026,3022,3023,3024,}},

{"Warbringer's","","Classic (Set 18)",35,10000,{5778,5782,5784,5779,5780,5781,}},

{"Copper Plate","","Classic (Set 19)",35,10000,{9439,976,977,1284,}},

{"Recruit's","","Classic (Set 20)",35,10000,{8253,8251,8252}},
{"Initiate's","","Classic (Set 20)",35,10000,{8289,9460,9461}},

{"Grunt's Plate","","Classic (Set 21)",35,10000,{4780,31305,31309,31306,31307,31308,}},

{"Recruit's","","Classic (Set 22)",35,10000,{28832,2256,2257,}},

{"Recruit's","","Classic (Set 23)",35,10000,{414,20,21,}},

{"Recruit's","","Classic (Set 24)",35,10000,{28831,9294,9295,}},
{"Squire's","","Classic (Set 24)",35,10000,{14626,9297,25751,}},

{"Squire's","","Classic (Set 25)",35,10000,{28824,23,22,}},

--Leveling Mail
{"Gryphon Mail","","Classic (Set 1)",68,10000,{6370,6375,6369,6366,6374,6373,6367,6372,}},

{"Fortified","","Classic (Set 2)",68,10000,{6311,3486,3482,3483,3478,3479,3481,2387}},
{"Der'izu","","Classic (Set 2)",68,10000,{9909,9905,9903,9908,9904,9910,9906,}},
{"Chainmail","Vendor: Sana (Orgrimmar) or Aldric Moore (Stormwind)","Classic (Set 2)",68,10000,{117,366,118,119,468,120,}},

{"Green Iron","","Classic (Set 3)",68,10000,{1447,1451,2854,1449,1294,1444,1295,}},
{"Khan's","","Classic (Set 3)",68,10000,{5629,5621,5625,5628,5626,5620,5624,}},

{"Black Dragonscale","","Classic (Set 4)",68,10000,{5846,5845,5847,7040,}},

{"Battleforge","","Classic (Set 5)",68,10000,{2515,2517,2519,2513,2514,2518,}},
{"Glimmering Mail","","Classic (Set 5)",68,10000,{1597,1815,2372,1599,2373,1598,}},

{"Ornate","","Classic (Set 6)",68,10000,{3745,3749,3751,3746,3753,3748,}},
{"Masterwork","","Classic (Set 6)",68,10000,{3893,3896,3900,3897,3892,3895,}},
{"Engraved","","Classic (Set 6)",68,10000,{3857,3860,3863,3861,3856,3859,}},

{"Chief Brigadier","","Classic (Set 7)",68,10000,{2394,1830,1605,2395,2396,525,}},

{"Hero's","","Classic (Set 8)",68,10000,{3179,3182,3185,3183,3178,3181,}},
{"Radiant","","Classic (Set 8)",68,10000,{4410,4411,4415,4414,4413,}},
{"Lord's","","Classic (Set 8)",68,10000,{3708,3712,3715,3713,3707,3711,}},

{"Bloodlust","","Classic (Set 9)",68,10000,{5640,5645,5647,5641,5649,5644,}},
{"Ironhide","","Classic (Set 9)",68,10000,{6387,6388,6393,6389,6386,6391,}},

{"Mail Combat","","Classic (Set 10)",68,10000,{1600,1820,2385,1602,2386,1601,}},
{"Captain's","","Classic (Set 10)",68,10000,{2846,2847,2850,2853,2849,}},

{"Ebonhold","","Classic (Set 11)",68,10000,{3141,3144,3147,3145,3140,3143,}},
{"Mercurial","","Classic (Set 11)",68,10000,{3784,3781,3789,3782,3783,3788,}},
{"Myrmidon's","","Classic (Set 11)",68,10000,{3048,3051,3054,3052,3047,3050,}},
{"Crusader's","","Classic (Set 11)",68,10000,{3820,3824,3826,3819,3818,3823,}},

{"Protector","","Classic (Set 12)",68,10000,{5631,5635,5638,5636,5630,5634,}},

{"War Paint","","Classic (Set 13)",68,10000,{5583,5578,5580,5575,5576,5579,}},
{"Outrunner's","","Classic (Set 13)",68,10000,{6249,6246,6252,6247,6248,6251,}},
{"Bloodspattered","","Classic (Set 13)",68,10000,{6237,6241,6242,6238,6244,6240,}},
{"Grunt's","","Classic (Set 13)",68,10000,{6263,6259,6260,6255,6256,6258,}},
{"Spiked Chain","","Classic (Set 13)",68,10000,{6267,6264,6270,6265,6266,6269,}},

{"Merciless","","Classic (Set 14)",68,10000,{6403,6397,6401,6402,6438,6396,6400,}},
{"Formidable","","Classic (Set 14)",68,10000,{6385,6378,6383,6384,6377,6376,6382,}},

{"Brigade","","Classic (Set 15)",68,10000,{{3595,2914},3598,3600,3593,3594,3597,}},

{"Sentry's","","Classic (Set 16)",68,10000,{6273,6277,6278,6274,6281,6276,}},
{"Steadfast","","Classic (Set 16)",68,10000,{6338,6345,6343,6336,6337,6342,}},

{"Knight's","","Classic (Set 17)",68,10000,{2817,2825,2818,2821,2824,2820,}},

{"Magnificient","","Classic (Set 18)",68,10000,{6416,6420,6423,6421,6415,6419,}},
{"Bonelink","","Classic (Set 18)",68,10000,{6356,6360,6363,6361,6357,6359,}},
{"Triumphant","","Classic (Set 18)",68,10000,{6427,6430,6432,6425,6426,6429,}},

{"Champion's","","Classic (Set 19)",68,10000,{2892,{2887,356},2895,2888,2891,2894,2890,}},
{"Blackforge","","Classic (Set 19)",68,10000,{1835,{1607,65},2407,1609,2405,2408,1608,}},
{"Golden Scale","","Classic (Set 19)",68,10000,{1448,1452,1450,1454,2230,3227,13455}},

{"Turtle Scale","","Classic (Set 20)",68,10000,{{3089,3433},3085,3098,3087,3427,3426}},
{"Laminated Scale","","Classic (Set 20)",68,10000,{1535,1536,1529,1534,1530,1531,1533,}},
{"Frigid Mail","","Classic (Set 20)",68,10000,{9925,15404,15405,15409,15406,15407,13178,}},

{"Ravager's","","Classic (Set 21)",68,10000,{5610,5615,5617,5611,5612,5614,}},

{"Warmonger's","","Classic (Set 22)",68,10000,{3632,3624,3628,3631,3629,3623,3627,}},

{"Wicked Chain","","Classic (Set 23)",68,10000,{6285,6288,6290,6283,6284,6287,}},
{"Enduring","","Classic (Set 23)",68,10000,{5602,5603,5608,5604,5601,5606,}},
{"Grunt's Chain","","Classic (Set 23)",68,10000,{13916,6484,15146,4818,4798,13917,}},

{"Defender","","Classic (Set 24)",68,10000,{2504,2500,2502,2497,2498,{2501,13722},}},
{"Netherstalker","","Classic (Set 24)",68,10000,{9853,9849,9847,9852,9848,9854,9850,}},
{"Sundered","","Classic (Set 24)",68,10000,{9921,9919,9924,9920,9926,9922,}},
{"Green Dragonscale","","Classic (Set 24)",68,10000,{5840,5841,8061,}},

{"Marauder's","","Classic (Set 25)",68,10000,{6315,6319,6321,6313,6314,6318,}},

{"Pillager's","","Classic (Set 26)",68,10000,{6306,6303,6310,6304,6305,6309,}},

{"Ancient","","Classic (Set 27)",68,10000,{6348,6353,6354,6346,6347,6352,}},
{"Sparkleshell","","Classic (Set 27)",68,10000,{6326,6323,6330,6324,6325,6329,}},

{"Ironspine","","Classic (Set 28)",68,10000,{2822,9897,9895,9900,9896,9902,9898,}},
{"Rough Bronze","","Classic (Set 28)",68,10000,{1290,983,982,2357,1722,}},
{"Lambent Scale","","Classic (Set 28)",68,10000,{1079,1810,1078,1076,1136,1077,}},

{"Tough Scorpid","","Classic (Set 29)",68,10000,{3103,5877,3106,3109,3105,3104,}},
{"Heavy Scorpid","","Classic (Set 29)",68,10000,{5871,5877,5874,49145,5872,5873,}},

{"Infantry","","Classic (Set 30)",68,10000,{6381,2353,35154,2354,35163,35155,35162,}},
{"Unyielding","","Classic (Set 30)",68,10000,{9835,9837,9833,9831,9836,9832,9838,9834,}},
{"Warrior's","","Classic (Set 30)",68,10000,{3538,6272,1026,1027,1138,1029,1774,1028}},
{"Worn Mail","","Classic (Set 30)",68,10000,{1603,379,372,917,371,367,368,370,}},
{"Scarlet","","Classic (Set 30)",68,10000,{992,3914,1907,1288,8315}},

{"Renegade","","Classic (Set 31)",68,10000,{3534,3537,3539,3532,3533,3536,}},
{"Banded","","Classic (Set 31)",68,10000,{3504,3508,3509,3961,3505,3507,}},
{"Phalanx","","Classic (Set 31)",68,10000,{2791,2795,2796,2790,2789,2794,}},
{"Silvered Bronze","","Classic (Set 31)",68,10000,{1291,986,1820,3967,1292,1293,}},

{"Runed Copper","","Classic (Set 32)",68,10000,{981,980,1287,979,1286,}},

{"Slayer's","","Classic (Set 33)",68,10000,{5593,5597,5599,5598,5592,5596,}},
{"Felscale","","Classic (Set 33)",68,10000,{10526,5588,10525,10524,5585,10523,}},
{"Thick Scale","","Classic (Set 33)",68,10000,{6295,6298,6300,6293,6294,6297,}},
{"Scaled Draenic","","Classic (Set 33)",68,10000,{10528,7555,10530,10527,7446,10529,}},

{"War Torn","","Classic (Set 34)",68,10000,{6236,14211,6234,5161,6233,6230}},
{"Battle Chain","","Classic (Set 34)",68,10000,{1169,10737,10731,10735,10739,68131,}},
{"Charger's","","Classic (Set 34)",68,100000,{6228,6221,6222,6223,919,6170}},
{"Brackwater","","Classic (Set 34)",68,100000,{1187,1791,68134,1183,1184,1185,}},

{"Rusted Chain","Vendor: Sana (Orgrimmar) or Aldric Moore (Stormwind)","Classic (Set 35)",68,10000,{153,223,366,639,767,768,291,}},
{"Burnished","","Classic (Set 35)",68,10000,{1800,2469,2472,2470,1003,2474,2471,}},
{"Felstone","","Classic (Set 35)",68,10000,{1604,1381,7314,9844,9255,2278,9842,}},
{"Wax-Polished","","Classic (Set 35)",68,10000,{1606,2286,2289,9855,857,1928,1943,8655,}},

{"Trapper's","Vendor: Sana (Orgrimmar) or Aldric Moore (Stormwind)","Classic (Set 36)",68,10000,{28835,2267,2268,}},
{"Rugged Trapper's","Vendor: Sana (Orgrimmar) or Aldric Moore (Stormwind)","Classic (Set 36)",68,10000,{28823,47,43,}},

--Leveling Leather
{"Scouting","","Classic (Set 1)",3592,10000,{2508,2511,2506,2507,2510}},
{"Robust","","Classic (Set 1)",3592,10000,{5915,5913,5908,5909,5912}},
{"Scaled Leather","","Classic (Set 1)",3592,10000,{3503,3501,3496,3497,3500}},
{"Tough Leather","","Classic (Set 1)",3592,10000,{739,28152,28447,30301,2737}},

{"Bandit","","Classic (Set 2)",3592,10000,{3450,3443,3449,3444,3445,3448,}},
{"Bard's","","Classic (Set 2)",3592,10000,{2476,2482,2477,2481,2480,2478,}},
{"Clefthoof","","Classic (Set 2)",3592,10000,{9792,9790,9795,9791,9797,9793,}},

{"Boneshredder","","Classic (Set 3)",3592,10000,{9802,9804,9800,9798,9803,9799,9805,{9801,513},}},
{"Bristlebark","","Classic (Set 3)",3592,10000,{10505,5478,{5475,116},5472,5479,{5473,113},5474,{5477,114}}},
{"Pathfinder","","Classic (Set 3)",3592,10000,{6107,6113,6114,6115,6112,6109,6116,6111,}},
{"Rawhide","","Classic (Set 3)",3592,10000,{429,430,423,428,424,425,427,2810}},
{"Patched Leather","","Classic (Set 3)",3592,10000,{422,415,420,416,417,419,1469,421}},
{"Rough Leather","","Classic (Set 3)",3592,10000,{98,463,97,95,464,96,}},

{"Blackened Defias","Unlocked via Ensemble: Blackened Defias Armor","Classic (Set 4)",3592,10000,{3951,3955,3952,3954,3953,{10353,5945}}},
{"Rigid","","Classic (Set 4)",3592,10000,{5903,5905,5904,5898,5899,5902,}},
{"Superior","","Classic (Set 4)",3592,10000,{{3477,619},3476,3470,3471,3474,}},
{"Smooth","","Classic (Set 4)",3592,10000,{1512,1513,1506,1511,1507,1508,1510,}},

{"Prospector's","","Classic (Set 5)",3592,10000,{5471,5467,5464,5470,5465,5466,5469,}},
{"Nomad","","Classic (Set 5)",3592,10000,{3425,10725,3424,10723,10722,}},
{"Dirty Leather","","Classic (Set 5)",3592,10000,{39,461,59,60,462,71,}},

{"Cadaverous","","Classic (Set 6)",3592,10000,{5531,5530,5532,5534,5533,},nil,true},

{"Wolf Rider's","","Classic (Set 7)",3592,10000,{6144,6137,6142,6138,6145,6140,}},
{"Nocturnal","","Classic (Set 7)",3592,10000,{5946,5941,5944,5939,5947,5942,}},
{"Dervish","","Classic (Set 7)",3592,10000,{2526,2523,2529,2524,2525,2528,}},
{"Dokebi","","Classic (Set 7)",3592,10000,{5486,5483,5490,5484,5485,5488,}},
{"Trickster's","","Classic (Set 7)",3592,10000,{6127,6129,6134,6130,6128,6133,}},

{"Sentinel","","Classic (Set 8)",3592,10000,{2813,2808,2816,2809,2812,2815,2811,}},
{"Peerless","","Classic (Set 8)",3592,10000,{6187,6182,6185,6180,6179,6183,}},

{"Fine Leather","","Classic (Set 9)",3592,10000,{3620,9748,1654,1656,2215,733,2734,738,}},
{"Burnt Leather","","Classic (Set 9)",3592,10000,{31120,{1022,1174},1023,1124,1172,1780,1170}},
{"Light Leather","","Classic (Set 9)",3592,10000,{2177,587,2735,1857,2231}},
{"Frozen Leather","","Classic (Set 9)",3592,10000,{2573,7441,15387,2272,2159,80,15391,}},

{"Traveler's","","Classic (Set 10)",3592,10000,{3175,3177,3172,3176,3170,3171,3174,}},
{"Stormshroud","","Classic (Set 10)",3592,10000,{13716,5853,{5851,5070},5852,9093,4613,{8353,13831,4873}}},
{"Tempest","","Classic (Set 10)",3592,10000,{3137,10616,13000,8606,8462,}},
{"Mighty","","Classic (Set 10)",3592,10000,{5561,3780,3778,3779,3773,3774,{3776,5885},}},

{"Feral","","Classic (Set 11)",3592,10000,{{6090,4736},6087,6091,6084,6085,6089,}},

{"Adventurer's","","Classic (Set 12)",3592,10000,{3890,3891,3886,3889,3884,3883,3887,}},
{"Redeemed Soul","","Classic (Set 12)",3592,10000,{11885,9538,9536,14952,14955,14953,14954,9521,}},
{"Verdant","","Classic (Set 12)",3592,10000,{7493,8764,5855,5075,14017,14016,}},
{"Demon-Cured","","Classic (Set 12)",3592,10000,{14557,14189,14438,13402,15017}},
{"Inferno Hardened","","Classic (Set 12)",3592,10000,{7617,13911,13913,13914,13915,4241}},

{"Cabalist","","Classic (Set 13)",3592,10000,{2876,2884,2877,2880,2883,2879,}},
{"Chieftain's","","Classic (Set 13)",3592,10000,{3617,3614,3621,3615,3616,3619,}},
{"Keeper's","","Classic (Set 13)",3592,10000,{5549,5546,5553,5547,5548,5551,}},

{"Glyphed","","Classic (Set 14)",3592,10000,{1833,1584,2403,1586,2402,1585,2401,}},
{"Mistspray","","Classic (Set 14)",3592,10000,{30500,{29461,2412},29433,33137,33143,29467,26168,}},
{"Tracker's","","Classic (Set 14)",3592,10000,{3590,3591,3583,3589,3584,3592,3587,}},
{"Swashbuckler's","","Classic (Set 14)",3592,10000,{3816,3809,3817,3815,3810,3811,3813,}},
{"Chimeric","","Classic (Set 14)",3592,10000,{29393,5870,30522,5867,5868,29355,5869,}},

{"Righteous","","Classic (Set 15)",3592,10000,{3706,3701,3698,3705,{3699,4725},3700,3703,}},
{"Heraldic","","Classic (Set 15)",3592,10000,{3046,7606,2613,3265,3249,8735,}},
{"Discarded Swampstalker","","Classic (Set 15)",3592,10000,{49136,49138,49133,49135,49137,49139,49132,}},
{"Ranger","","Classic (Set 15)",3592,10000,{2842,2837,2845,2838,2841,2844,2840,}},

{"The Fang","","Classic (Set 16)",3592,10000,{2429,3964,3962,3963,3965,}},

{"Headhunter's","","Classic (Set 17)",3592,10000,{6124,6117,6126,6118,6119,6123,}},
{"Murkblood","","Classic (Set 17)",3592,10000,{9809,9806,9812,9808,9814,9810,}},
{"Swampwalker","","Classic (Set 17)",3592,10000,{1732,2575,719,}},

{"Nightshade","","Classic (Set 18)",3592,10000,{3847,3848,3854,3849,3850,3852,}},
{"Serpentskin","","Classic (Set 18)",3592,10000,{3134,3131,3138,3132,3133,3136,}},
{"Potent","","Classic (Set 18)",3592,10000,{5957,5965,5963,5958,5959,5961,}},
{"Supreme","","Classic (Set 18)",3592,10000,{6196,6188,6194,6189,6190,6192,}},

{"Archer's","","Classic (Set 19)",3592,10000,{3531,3522,3523,3530,3524,3525,3529,}},

{"Abyssal Leather","","Classic (Set 20)",3592,10000,{8175,1328,8159,8157,8150,8169,8153,},nil,true},
{"Reinforced Leather","","Classic (Set 20)",3592,10000,{813,814,815,816,817,818,}},
{"Insignia","","Classic (Set 20)",3592,10000,{1824,1583,2392,1581,1582,2393,74,}},

{"Dusky","","Classic (Set 21)",3592,10000,{6136,2771,2776,2770,2777,}},
{"Dementia","","Classic (Set 21)",3592,10000,{9756,9752,9750,9755,9751,9757,9753,}},
{"Umbrafen","","Classic (Set 21)",3592,10000,{9788,9784,9782,9787,9783,9789,9785,}},
{"Guardian","","Classic (Set 21)",3592,10000,{1666,1668,2217,2221,1670,}},

{"Wicked Leather","","Classic (Set 22)",3592,10000,{4346,5880,5882,7221,5879,5878,}},
{"Ghostloom","","Classic (Set 22)",3592,10000,{7369,4220,9129,5455,14195,7698,}},
{"Wanderer's","","Classic (Set 22)",3592,10000,{2878,3744,3736,3740,3743,3737,3738,3741,}},

{"Dark Leather","","Classic (Set 23)",3592,10000,{1662,742,1659,2216,740,1658,}},
{"Daggerfen","","Classic (Set 23)",3592,10000,{9780,9776,9774,9779,9775,9781,9777,}},
{"Inscribed Leather","","Classic (Set 23)",3592,10000,{1046,2365,1047,1048,1129,1049,}},
{"Vengeance","","Classic (Set 23)",3592,10000,{9740,9736,9734,9739,9735,9741,9737,}},
{"Ranger","","Classic (Set 23)",3592,10000,{9768,9766,9771,9767,9773,9769,}},

{"Infiltrator","","Classic (Set 24)",3592,10000,{2781,2780,2779,2787,2782,2783,2785,}},
{"Emblazoned","","Classic (Set 24)",3592,10000,{2383,2380,2382,1578,1579,1577,2381,}},
{"Forest Leather","","Classic (Set 24)",3592,10000,{1812,1081,2368,1082,1083,1126,1084,}},

{"Battered Leather","","Classic (Set 25)",3592,10000,{751,752,753,754,755,756,}},
{"Strapped Leather","","Classic (Set 25)",3592,100000,{6083,1519,}},

{"Thug","","Classic (Set 26)",3592,10000,{28834,40,41,}},

{"Worn Leather","","Classic (Set 27)",3592,10000,{280,274,279,275,276,278,}},
{"Ragged Leather","","Classic (Set 27)",3592,10000,{242,246,243,244,247,245,}},
{"Cracked Leather","","Classic (Set 27)",3592,10000,{609,604,608,605,606,607,}},

--Leveling Cloth
{"Black Mageweave","","Classic (Set 1)",400,10000,{3643,3644,3661,14445,4894,}},
{"Crystalweave","","Classic (Set 1)",400,10000,{5038,13391,12502,15070,14003,}},
{"Infernoweave","","Classic (Set 1)",400,10000,{5094,5097,13898,14000,13997,}},
{"Goldweave","","Classic (Set 1)",400,10000,{12235,3844,14395,}},

{"Buccaneer's","","Classic (Set 2)",400,10000,{{5187,8946},5185,3258,5186,5178,}},
{"Azure Silk","","Classic (Set 2)",400,10000,{1695,2683,}},
{"Crimson Silk","","Classic (Set 2)",400,10000,{{2695,1994},2692,2699,}},

{"Silver-Thread","","Classic (Set 3)",400,10000,{2709,1817,1565,2378,1564,2377,}},

{"Aboriginal","","Classic (Set 4)",400,10000,{5136,5128,5134,5129,5132,5130}},
{"Barbaric","","Classic (Set 4)",400,10000,{1191,1190,1188,35497,1189,1795}},
{"Ancestral","","Classic (Set 4)",400,10000,{1178,1784,1177,1175,1359,1176,}},

{"Aurora","","Classic (Set 5)",400,10000,{1832,2397,}},
{"Darkcloth","","Classic (Set 5)",400,10000,{19202,{952,1563},}},
{"Doomed Ritual","","Classic (Set 5)",400,10000,{8750,24238,}},
{"Beastwalker","","Classic (Set 5)",400,10000,{2694,1739,1699,}},
{"Arcana","","Classic (Set 5)",400,10000,{9708,2184,2875,}},

{"Sage's","","Classic (Set 6)",400,10000,{2531,2533,2538,2534,2535,2537,}},
{"Shimmering","","Classic (Set 6)",400,10000,{2491,2494,2492,2486,2487,2489,}},

{"Mistscape","","Classic (Set 7)",400,10000,{2411,1836,2409,}},
{"Venomshroud","","Classic (Set 7)",400,10000,{5190,5412,10425,}},
{"Everlasting Night","","Classic (Set 7)",400,10000,{1319,5288,{7306,3881},}},
{"Darkmist","","Classic (Set 7)",400,10000,{5257,3769,357,}},
{"Crimson Silk","","Classic (Set 7)",400,10000,{13687,2696,2700,}},
{"Duskwoven","","Classic (Set 7)",400,10000,{3694,4904,}},

{"Arachnidian","","Classic (Set 8)",400,10000,{5298,5299,5305,5300,5301,5304,}},
{"Hibernal","","Classic (Set 8)",400,10000,{3028,3036,3034,{3029,4899},3030,3032,}},

{"Dark Animator's","","Classic (Set 9)",400,10000,{9692,103128,103126,103130,103127,}},
{"Bonecaster's","","Classic (Set 9)",400,10000,{5308,14001,14002,}},
{"Black Ash","","Classic (Set 9)",400,10000,{3837,7700,14005,8489,}},
{"Power","","Classic (Set 9)",400,10000,{7036,2691,14213,}},
{"Flarecore","","Classic (Set 9)",400,10000,{3126,7625,4470,}},
{"Gossamer","","Classic (Set 9)",400,10000,{2872,2867,4347,}},

{"Mooncloth","","Classic (Set 10)",400,10000,{{5152,3159},5151,6462,}},
{"Netherweave","","Classic (Set 10)",400,10000,{{3873,3283},3879,3874,}},
{"Duskwoven","","Classic (Set 10)",400,10000,{3688,3695,3689,3690,3693,}},
{"Cindercloth","","Classic (Set 10)",400,10000,{2688,4648,3678,}},

{"Elementalist","","Classic (Set 11)",400,10000,{9712,9710,9715,9711,9717,9713,}},
{"Abjurer's","","Classic (Set 11)",400,10000,{3613,3612,3609,3603,3604,3606,}},
{"Aurora","","Classic (Set 11)",400,10000,{2711,2400,1572,2398,1571,1570,}},

{"Exiled Dabbler's","","Classic (Set 12)",400,10000,{14004,49148,49146,49147,49149,49151,49150,}},
{"Runecloth","","Classic (Set 12)",400,10000,{2869,{5027,24623},2875,}},
{"Sage's","","Classic (Set 12)",400,10000,{14463,2539,5037,}},
{"Highborne","","Classic (Set 12)",400,10000,{5421,{3648,4071},}},
{"Doan","","Classic (Set 12)",400,10000,{2924,2923,13679,},nil,true},

{"Seer's","","Classic (Set 13)",400,10000,{2485,1805,1043,1044,1362,1045,}},
{"Loosely Threaded","","Classic (Set 13)",400,10000,{10337,9603,1719,1775,}},
{"Thread-Bare","","Classic (Set 13)",400,10000,{15372,1346,1687,1684,}},

{"Outlander's","","Classic (Set 14)",400,10000,{9608,9602,9611,9607,9613,9609,}},
{"Laughing Skull","","Classic (Set 14)",400,10000,{9632,9630,9635,9631,9637,9633,}},
{"Fireheart","","Classic (Set 14)",400,10000,{9616,9614,9619,9615,9621,9617,}},
{"Feralfen","","Classic (Set 14)",400,10000,{9656,9654,9659,9655,9661,9657,}},
{"Journeyman's","","Classic (Set 14)",400,10000,{1018,1778,1019,1020,1358,1021,}},

{"Ritual","","Classic (Set 15)",400,10000,{5148,5146,5140,5144,5137,5139,}},
{"Mystic's","","Classic (Set 15)",400,10000,{5354,5093,5355,5349,5351,5352,}},
{"Beaded","","Classic (Set 15)",400,10000,{5109,5105,5101,5104,5108}},
{"Tattered Cloth","","Classic (Set 15)",400,10000,{52,1348,53,54,1349,70,}},

{"The Postmaster's","","Classic (Set 16)",400,10000,{4867,4868,4870,14171,}},
{"Gossamer","","Classic (Set 16)",400,10000,{2866,2875,2868,2871,2874,2870,}},

{"Bloodwoven","","Classic (Set 17)",400,10000,{5277,5268,5274,5269,5270,5272,}},
{"Windchaser","","Classic (Set 17)",400,10000,{5396,5404,5402,5397,5398,5400,}},
{"Gaea's","","Classic (Set 17)",400,10000,{5287,5286,5284,5279,5278,5282,}},
{"Nightsky","","Classic (Set 17)",400,10000,{2710,1823,2388,2389,2390,1568,}},
{"Highborne","","Classic (Set 17)",400,10000,{5424,5423,5906,5416,5417,5420,}},

{"Stonecloth","","Classic (Set 18)",400,10000,{{5376,3266},5383,5384,5377,5385,5380,}},
{"Sanguine","","Classic (Set 18)",400,10000,{5357,5358,5364,5359,5360,5362,}},
{"Watcher's","","Classic (Set 18)",400,10000,{{5192,5227},5197,5195,5188,5189,5193,}},
{"Thistlefur","","Classic (Set 18)",400,10000,{{5214,5228},5217,5215,5208,5209,5211,}},

{"Imperial Red","","Classic (Set 19)",400,10000,{3121,3129,3127,3122,3123,3125,}},
{"Shadow Council","","Classic (Set 19)",400,10000,{9688,9686,9691,9687,9693,9689,}},
{"Regal","","Classic (Set 19)",400,10000,{2748,2836,2829,2832,2835,2831,}},
{"Mystical","","Classic (Set 19)",400,10000,{3808,3807,3804,3806,3800,3803,}},

{"Resplendent","","Classic (Set 20)",400,10000,{5337,{5336,5328},5334,5329,5330,5333,}},
{"Bonecaster's","","Classic (Set 20)",400,10000,{5314,{5313,5316},5315,5309,5311,5312,}},
{"Celestial","","Classic (Set 20)",400,10000,{5319,{5327,5318},5325,5320,5321,5324,}},
{"Elunarian","","Classic (Set 20)",400,10000,{5433,5434,5431,5427,5426,5430,}}, --Robe/Vest??
{"Eternal","","Classic (Set 20)",400,10000,{5347,{5346,5338},5344,5339,5340,5343,}},

{"Starfire","","Classic (Set 21)",400,10000,{9624,9627,5033,5032,4454,}},
{"Mistscape","","Classic (Set 21)",400,10000,{2712,1838,1574,1575,1573,2410,}},
{"Councillor's","","Classic (Set 21)",400,10000,{3735,3732,3726,3727,3730,}},
{"High Councillor's","","Classic (Set 21)",400,10000,{3762,3768,3764,3763,3767,}},

{"Embersilk","","Classic (Set 22)",400,10000,{5241,5246,5244,5247,5238,5242,}},
{"Darkmist","","Classic (Set 22)",400,10000,{5248,5256,5253,5249,5251,5252,}},
{"Twilight","","Classic (Set 22)",400,10000,{2798,2807,2800,2803,2806,2802,}},
{"Resilient","","Classic (Set 22)",400,10000,{5367,5375,5373,5368,5371,5372,}},
{"Silksand","","Classic (Set 22)",400,10000,{5390,5386,5395,5393,5387,5388,5391,}},

{"Bright","","Classic (Set 23)",400,10000,{{2530,55},1087,1086,1351}},
{"Whispering","","Classic (Set 23)",400,10000,{{1853,795},{14197,798},796,797,1347}},
{"Green Silk","","Classic (Set 23)",400,10000,{2702,496,1679}},
{"Padded","","Classic (Set 23)",400,10000,{635,634,1345,633}},

{"Bloodmage","","Classic (Set 24)",400,10000,{2911,728,1879,}},
{"Combustion","","Classic (Set 24)",400,10000,{7720,7343,7317,}},
{"Ivycloth","","Classic (Set 24)",400,10000,{10438,3466,13705,}},
{"Raincaller","","Classic (Set 24)",400,10000,{5198,3580,}},
{"Scholarly","","Classic (Set 24)",400,10000,{1323,552,}},

{"Geomancer's","","Classic (Set 25)",400,10000,{5235,9051,}},
{"Twilight","","Classic (Set 25)",400,10000,{2804,28321,}},
{"Elder's","","Classic (Set 25)",400,10000,{2766,2182,}},
{"Conjurer's","","Classic (Set 25)",400,10000,{3518,27840,}},

{"Haunting","","Classic (Set 26)",400,10000,{33133,886,8489,1234,1353,8300}},
{"Vindicator","","Classic (Set 26)",400,10000,{30518,{18375,2183},9639,1238}},
{"Canvas","","Classic (Set 26)",400,10000,{401,2324,725,632,}},
{"Interlaced","","Classic (Set 26)",400,10000,{1421,2271,2681,}},
{"Harvester's","","Classic (Set 26)",400,10000,{33285,339,}},

{"Conjurer's","","Classic (Set 27)",400,10000,{3512,3521,3519,3513,3514,3516,}},
{"Ivycloth","","Classic (Set 27)",400,10000,{3459,3467,3465,3463,3514}},
{"Durable","","Classic (Set 27)",400,10000,{3487,3956,3493,3491,}},
{"Sorcerer","","Classic (Set 27)",400,10000,{3542,3543,3551,3544,3547,3548,}},
{"Sabotage","","Classic (Set 27)",400,10000,{30524,29460,28343,28369,}},

{"Greenweave","","Classic (Set 28)",400,10000,{3442,3434,3440,3435,3436,3439,}},
{"Pagan","","Classic (Set 28)",400,10000,{5170,5176,5177,5171,5172,5174,}},
{"Native","","Classic (Set 28)",400,10000,{5111,5112,5117,5125,5110,1147}},
{"Woven","","Classic (Set 28)",400,100000,{747,1356,748,749,1357,750,}},

{"Knitted","","Classic (Set 29)",400,10000,{94,1354,93,91,1355,92,}},

{"Heavy Weave","","Classic (Set 30)",400,10000,{109,1342,110,112,1343,111,}},
{"Brocade","","Classic (Set 30)",400,10000,{408,1236,406,403,1237,405,}},
{"Canvas","","Classic (Set 30)",400,10000,{402,1234,400,397,1235,399,}},
{"Cross-Stitched","","Classic (Set 30)",400,10000,{414,1238,412,409,1239,411,}},

{"Calico","","Classic (Set 31)",400,10000,{317,1232,316,313,1233,315,}},

{"Frayed","","Classic (Set 32)",400,10000,{253,252,249,251,}},

{"Interlaced","","Classic (Set 33)",400,10000,{1422,1420,1416,1417,1419,}},

{"Thin Cloth","","Classic (Set 34)",400,10000,{603,1352,602,600,1353,601,}},

--{"","","Classic (Set 29)",400,10000,{}},
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
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
    
    if type(db[i][6][1]) == "table" then
      data.setID = (expansionID + 1) * app.SetsFrame.ExpandedID + db[i][6][1][1];
    else
      data.setID = (expansionID + 1) * app.SetsFrame.ExpandedID + db[i][6][1];
    end
    
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