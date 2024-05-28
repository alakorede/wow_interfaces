local app = select(2,...);

local expansionID = 9;--69434
--end of DF 90880

--Name, Description, Label, classMask, patchID, sources, requiredFact, noLongerObtainable
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
{"Swabbie's",nil,"Plunderstorm",0,100206,{198786,169021,198781,198783,96233,198776},nil,true},
{"Storm Captain's",nil,"Plunderstorm",0,100206,{198785,195323,198782,198784,198778,198777,},nil,true},

--83014 orc --78462
{"Sabellian's","","Sabellian Cosmetic",0,100000,{183074,{183073,183080},183075,183076,183077,183078,183079,}},
};

local altLabelDB = {
[3443]="Plunderstorm",
}

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
--Draenei Heritage Masked Helm alt
{3346,194095,194107}, --purple
{3347,194102,194106}, --orange

--Plunderlord's
{3443,198627,218283}, --hatless eyepatch

----
-- amirdrassil/s3
----
--dk 82900
{3216,190575,192285}, --S3 Elite Helm (less shiny)(DK)
{3216,190583,192263}, --S3 Elite Shoulders (less shiny)(DK)
{3215,190574,192284}, --S3 Glad Helm (more shiny)(DK)
{3215,190582,192262}, --S3 Glad Shoulders (more shiny)(DK)
{3164,192277,192283}, --Amirdrassil Mythic Helm (less shiny)(DK)
{3164,192255,192261}, --Amirdrassil Mythic Shoulders (less shiny)(DK)
{3161,192276,192282}, --Amirdrassil Heroic Helm (more shiny)(DK)
{3161,192254,192260}, --Amirdrassil Heroic Shoulders (more shiny)(DK)
{3162,192275,192280}, --Amirdrassil RF Helm (more shiny)(DK)
{3162,192253,192258}, --Amirdrassil RF Shoulders (more shiny)(DK)
{3163,188739,192281}, --Amirdrassil Normal Helm (more shiny)(DK)
{3163,188737,192259}, --Amirdrassil Normal Shoulders (more shiny)(DK)

--paladin 81063
{3218,190621,189326}, --S3 Elite Shoulders (less shiny)(paladin)
{3217,190620,189325}, --S3 Glad Shoulders (more shiny)(paladin)
{3145,189318,189324}, --Amirdrassil Mythic Shoulders (less shiny)(paladin)
{3146,189317,189323}, --Amirdrassil Heroic Shoulders (more shiny)(paladin)
{3147,189316,189321}, --Amirdrassil RF Shoulders (more shiny)(paladin)
{3148,188728,189322}, --Amirdrassil Normal Shoulders (more shiny)(paladin)

--warrior 82739 --shoulders at 82998
{3220,190651,192876}, --S3 Elite Helm (less shiny)(warrior)
{3220,190663,192884}, --S3 Elite belt (less shiny)(warrior)
{3220,190639,192864}, --S3 Elite chest (less shiny)(warrior)
{3220,190659,193071}, --S3 Elite shoulder (less shiny)(warrior)
{3219,190650,192875}, --S3 Glad Helm (more shiny)(warrior)
{3219,190662,192883}, --S3 Glad belt (more shiny)(warrior)
{3219,190638,192863}, --S3 Glad chest (more shiny)(warrior)
{3219,190658,193070}, --S3 Glad shoulder (more shiny)(warrior)
{3151,193131,193137}, --Amirdrassil Mythic Helm (less shiny)(warrior)
{3151,193098,193104}, --Amirdrassil Mythic belt (less shiny)(warrior)
{3151,193164,193170}, --Amirdrassil Mythic chest (less shiny)(warrior)
{3151,193109,193115}, --Amirdrassil Mythic shoulder (less shiny)(warrior)
{3149,193130,193136}, --Amirdrassil Heroic Helm (more shiny)(warrior)
{3149,193097,193103}, --Amirdrassil Heroic belt (more shiny)(warrior)
{3149,193163,193169}, --Amirdrassil Heroic chest (more shiny)(warrior)
{3149,193108,193114}, --Amirdrassil Heroic shoulder (more shiny)(warrior)
{3152,193129,193134}, --Amirdrassil RF Helm (more shiny)(warrior)
{3152,193096,193101}, --Amirdrassil RF belt (more shiny)(warrior)
{3152,193162,193167}, --Amirdrassil RF chest (more shiny)(warrior)
{3152,193107,193112}, --Amirdrassil RF shoulder (more shiny)(warrior)
{3150,188721,193135}, --Amirdrassil Normal Helm (more shiny)(warrior)
{3150,188718,193102}, --Amirdrassil Normal belt (more shiny)(warrior)
{3150,188724,193168}, --Amirdrassil Normal chest (more shiny)(warrior)
{3150,188719,193113}, --Amirdrassil Normal shoulder (more shiny)(warrior)

--warlock 81563
{3200,190271,189249}, --S3 Elite Helm (less shiny)(warlock)
{3200,190279,189227}, --S3 Elite Shoulders (less shiny)(warlock)
{3199,190270,189248}, --S3 Glad Helm (more shiny)(warlock)
{3199,190278,189226}, --S3 Glad Shoulders (more shiny)(warlock)
{3173,189241,189247}, --Amirdrassil Mythic Helm (less shiny)(warlock)
{3173,189219,189225}, --Amirdrassil Mythic Shoulders (less shiny)(warlock)
{3174,189240,189246}, --Amirdrassil Heroic Helm (more shiny)(warlock)
{3174,189218,189224}, --Amirdrassil Heroic Shoulders (more shiny)(warlock)
{3176,189239,189244}, --Amirdrassil RF Helm (more shiny)(warlock)
{3176,189217,189222}, --Amirdrassil RF Shoulders (more shiny)(warlock)
{3175,188811,189245}, --Amirdrassil Normal Helm (more shiny)(warlock)
{3175,188809,189223}, --Amirdrassil Normal Shoulders (more shiny)(warlock)

--mage 81216
{3196,190193,189139}, --S3 Elite helm (less shiny)(mage)
{3196,190203,189117}, --S3 Elite Shoulders (less shiny)(mage)
{3196,190207,189106}, --S3 Elite belt (less shiny)(mage)
{3195,190192,189138}, --S3 Glad helm (more shiny)(mage)
{3195,190202,189116}, --S3 Glad Shoulders (more shiny)(mage)
{3195,190206,189105}, --S3 Glad belt (more shiny)(mage)
{3188,189131,189137}, --Amirdrassil Mythic helm (less shiny)(mage)
{3188,189109,189115}, --Amirdrassil Mythic Shoulders (less shiny)(mage)
{3188,189098,189104}, --Amirdrassil Mythic belt (less shiny)(mage)
{3187,189130,189136}, --Amirdrassil Heroic helm (more shiny)(mage)
{3187,189108,189114}, --Amirdrassil Heroic Shoulders (more shiny)(mage)
{3187,189097,189103}, --Amirdrassil Heroic belt (more shiny)(mage)
{3185,189129,189134}, --Amirdrassil RF helm (more shiny)(mage)
{3185,189107,189112}, --Amirdrassil RF Shoulders (more shiny)(mage)
{3185,189096,189101}, --Amirdrassil RF belt (more shiny)(mage)
{3186,188829,189135}, --Amirdrassil Normal helm (more shiny)(mage)
{3186,189741,189113}, --Amirdrassil Normal Shoulders (more shiny)(mage)
{3186,188826,189102}, --Amirdrassil Normal belt (more shiny)(mage)

--priest 82046
{3198,190233,190051}, --S3 Elite helm (less shiny)(priest)
{3198,190241,190029}, --S3 Elite shoulders (less shiny)(priest)
{3197,190232,190050}, --S3 Glad helm (more shiny)(priest)
{3197,190240,190028}, --S3 Glad shoulders (more shiny)(priest)
{3182,190043,190049}, --Amirdrassil Mythic helm (less shiny)(priest)
{3182,190021,190027}, --Amirdrassil Mythic shoulders (less shiny)(priest)
{3183,190042,190048}, --Amirdrassil Heroic helm (more shiny)(priest)
{3183,190020,190026}, --Amirdrassil Heroic shoulders (more shiny)(priest)
{3181,190041,190046}, --Amirdrassil RF helm (more shiny)(priest)
{3181,190019,190024}, --Amirdrassil RF shoulders (more shiny)(priest)
{3184,188820,190047}, --Amirdrassil Normal helm (more shiny)(priest)
{3184,188818,190025}, --Amirdrassil Normal shoulders (more shiny)(priest)

--rogue 82667
{3208,190423,191555}, --S3 Elite Helm (less shiny)(rogue)
{3208,190431,191543}, --S3 Elite Shoulders (less shiny)(rogue)
{3207,190422,191554}, --S3 Glad Helm (more shiny)(rogue)
{3207,190430,191542}, --S3 Glad Shoulders (more shiny)(rogue)
{3166,191238,191553}, --Amirdrassil Mythic Helm (less shiny)(rogue)
{3166,191228,191541}, --Amirdrassil Mythic Shoulders (less shiny)(rogue)
{3168,191237,191552}, --Amirdrassil Heroic Helm (more shiny)(rogue)
{3168,191227,191540}, --Amirdrassil Heroic Shoulders (more shiny)(rogue)
{3167,191236,191550}, --Amirdrassil RF Helm (more shiny)(rogue)
{3167,191226,191538}, --Amirdrassil RF Shoulders (more shiny)(rogue)
{3165,188775,191551}, --Amirdrassil Normal Helm (more shiny)(rogue)
{3165,188773,191539}, --Amirdrassil Normal Shoulders (more shiny)(rogue)

--DH 81139
{3204,190355,192164}, --S3 Elite Shoulders (less shiny)(DH)
{3203,190354,192163}, --S3 Glad Shoulders (more shiny)(DH)
{3156,192354,192360}, --Amirdrassil Mythic Shoulders (less shiny)(DH)
{3155,192353,192359}, --Amirdrassil Heroic Shoulders (more shiny)(DH)
{3154,192352,192357}, --Amirdrassil RF Shoulders (more shiny)(DH)
{3153,188800,192358}, --Amirdrassil Normal Shoulders (more shiny)(DH)

--81352 monk
{3206,190393,189524}, --S3 Elite Shoulders (less shiny)(monk)
{3205,190392,189523}, --S3 Glad Shoulders (more shiny)(monk)
{3141,189516,189522}, --Amirdrassil Mythic Shoulders (less shiny)(monk)
{3143,189515,189521}, --Amirdrassil Heroic Shoulders (more shiny)(monk)
{3142,189514,189519}, --Amirdrassil RF Shoulders (more shiny)(monk)
{3144,188782,189520}, --Amirdrassil Normal Shoulders (more shiny)(monk)

--82602 druid
{3202,190317,192126}, --S3 Elite Shoulders (less shiny)(druid)
{3201,190316,192125}, --S3 Glad Shoulders (more shiny)(druid)
{3180,192486,192426}, --Amirdrassil Mythic Shoulders (less shiny)(druid)
{3178,192485,192425}, --Amirdrassil Heroic Shoulders (more shiny)(druid)
{3179,192484,192423}, --Amirdrassil RF Shoulders (more shiny)(druid)
{3177,188791,192424}, --Amirdrassil Normal Shoulders (more shiny)(druid)

--82823 evoker
{3210,190461,192031}, --S3 Elite Helm (less shiny)(evoker)
{3209,190460,192030}, --S3 Glad Helm (more shiny)(evoker)
{3159,192023,192029}, --Amirdrassil Mythic Helm (less shiny)(evoker)
{3158,192022,192028}, --Amirdrassil Heroic Helm (more shiny)(evoker)
{3160,192021,192026}, --Amirdrassil RF Helm (more shiny)(evoker)
{3157,188766,192027}, --Amirdrassil Normal Helm (more shiny)(evoker)

{3210,190449,193422}, --S3 Elite vest(evoker)
{3209,190448,193421}, --S3 Glad vest(evoker)
{3159,192056,193420}, --Amirdrassil Mythic vest(evoker)
{3158,192055,193419}, --Amirdrassil Heroic vest(evoker)
{3160,192054,193418}, --Amirdrassil RF vest(evoker)
{3157,188769,188697}, --Amirdrassil Normal vest(evoker)

--82251 hunter
{3212,190507,192730}, --S3 Elite Shoulders (less shiny)(hunter)
{3211,190506,192729}, --S3 Glad Shoulders (more shiny)(hunter)
{3139,193360,193322}, --Amirdrassil Mythic Shoulders (less shiny)(hunter)
{3140,193359,193321}, --Amirdrassil Heroic Shoulders (more shiny)(hunter)
{3138,193358,193319}, --Amirdrassil RF Shoulders (more shiny)(hunter)
{3137,188755,193320}, --Amirdrassil Normal Shoulders (more shiny)(hunter)

--80974 shaman
{3214,190537,189447}, --S3 Elite Helm (less shiny)(shaman)
{3214,190545,189425}, --S3 Elite Shoulders (less shiny)(shaman)
{3213,190536,189446}, --S3 Glad Helm (more shiny)(shaman)
{3213,190544,189424}, --S3 Glad Shoulders (more shiny)(shaman)
{3172,189439,189445}, --Amirdrassil Mythic Helm (less shiny)(shaman)
{3172,189417,189423}, --Amirdrassil Mythic Shoulders (less shiny)(shaman)
{3170,189438,189444}, --Amirdrassil Heroic Helm (more shiny)(shaman)
{3170,189416,189422}, --Amirdrassil Heroic Shoulders (more shiny)(shaman)
{3171,189437,189442}, --Amirdrassil RF Helm (more shiny)(shaman)
{3171,189415,189420}, --Amirdrassil RF Shoulders (more shiny)(shaman)
{3169,188748,189443}, --Amirdrassil Normal Helm (more shiny)(shaman)
{3169,188746,189421}, --Amirdrassil Normal Shoulders (more shiny)(shaman)

----
-- zaralek caverns
----
{3012,185660,189905}, --Cavern Delver's/Endowed Garb (cloth)(shoulders)--79400
{3012,185658,189899}, --Cavern Delver's/Endowed Garb (cloth)(helm)
{3011,185862,189898}, --Cavern Delver's/Moonless Vestiture (cloth)(helm)
{3011,185864,189904}, --Cavern Delver's/Moonless Vestiture (cloth)(shoulders)
{3087,188848,189897}, --Cavern Delver's/Anachronistic Vestments (cloth)(helm)
{3087,188850,189903}, --Cavern Delver's/Anachronistic Vestments (cloth)(shoulders)
{3014,185928,189896}, --Cavern Delver's/Zaralek Surveyor's (cloth)(helm)
{3014,185956,189902}, --Cavern Delver's/Zaralek Surveyor's (cloth)(shoulders)
{3013,185794,189895}, --Cavern Delver's/Suffused Attire (cloth)(helm)
{3013,185790,189901}, --Cavern Delver's/Suffused Attire (cloth)(shoulders)
{3091,189788,189894}, --Cavern Delver's/Infinite Zealot's (cloth)(helm)
{3091,189790,189900}, --Cavern Delver's/Infinite Zealot's (cloth)(shoulders)

{3024,185682,189881}, --Cavern Delver's/Bestowed (plate)(helm)
{3024,185684,189917}, --Cavern Delver's/Bestowed (plate)(shoulder)
{3023,185886,189880}, --Cavern Delver's/Starless (plate)(helm)
{3023,185888,189916}, --Cavern Delver's/Starless (plate)(shoulder)
{3090,188872,189879}, --Cavern Delver's/Anomalous (plate)(helm)
{3090,188874,189915}, --Cavern Delver's/Anomalous (plate)(shoulder)
{3025,185946,189878}, --Cavern Delver's/Zaralek (plate)(helm)
{3025,185951,189914}, --Cavern Delver's/Zaralek (plate)(shoulder)
{3026,185821,189877}, --Cavern Delver's/Suffused (plate)(helm)
{3026,185816,189913}, --Cavern Delver's/Suffused (plate)(shoulder)
{3094,189816,189876}, --Cavern Delver's/Infinite (plate)(helm)
{3094,189818,189912}, --Cavern Delver's/Infinite (plate)(shoulder)

{3020,185674,189893}, --Cavern Delver's/Bequeathed (mail)(helm)
{3020,185676,189911}, --Cavern Delver's/Bequeathed (mail)(shoulder)
{3019,185878,189892}, --Cavern Delver's/Skyless (mail)(helm)
{3019,185880,189910}, --Cavern Delver's/Skyless (mail)(shoulder)
{3089,188864,189891}, --Cavern Delver's/Paradoxical (mail)(helm)
{3089,188866,189909}, --Cavern Delver's/Paradoxical (mail)(shoulder)
{3022,185941,189890}, --Cavern Delver's/Zaralek (mail)(helm)
{3022,185943,189908}, --Cavern Delver's/Zaralek (mail)(shoulder)
{3021,185810,189889}, --Cavern Delver's/Suffused (mail)(helm)
{3021,185808,189907}, --Cavern Delver's/Suffused (mail)(shoulder)
{3093,189808,189888}, --Cavern Delver's/Infinite (mail)(helm)
{3093,189810,189906}, --Cavern Delver's/Infinite (mail)(shoulder)

{3018,185666,189887}, --Cavern Delver's/Inherited (leather)(helm)
{3015,185870,189886}, --Cavern Delver's/Sunless (leather)(helm)
{3088,188856,189885}, --Cavern Delver's/Discontinuity (leather)(helm)
{3016,185934,189884}, --Cavern Delver's/Zaralek (leather)(helm)
{3017,185803,189883}, --Cavern Delver's/Suffused (leather)(helm)
{3092,189825,189882}, --Cavern Delver's/Infinite (leather)(helm)

----
-- aberrus/s2
----
--dk 80400
{2914,186802,187677}, --S2 Elite Helm (less shiny)(DK)
{2914,186810,187689}, --S2 Elite Shoulders (less shiny)(DK)
{2913,186801,187676}, --S2 Glad Helm (more shiny)(DK)
{2913,186809,187688}, --S2 Glad Shoulders (more shiny)(DK)
{2896,186278,187675}, --Aberrus Mythic Helm (less shiny)(DK)
{2896,186284,187687}, --Aberrus Mythic Shoulders (less shiny)(DK)
{2895,186277,187674}, --Aberrus Heroic Helm (more shiny)(DK)
{2895,186283,187686}, --Aberrus Heroic Shoulders (more shiny)(DK)
{2897,186279,187673}, --Aberrus RF Helm (more shiny)(DK)
{2897,186285,187685}, --Aberrus RF Shoulders (more shiny)(DK)
{2870,184435,187672}, --Aberrus Normal Helm (more shiny)(DK)
{2870,184433,187684}, --Aberrus Normal Shoulders (more shiny)(DK)

--paladin 79036
{2932,187088,186002}, --S2 Elite Helm (less shiny)(paladin)
{2932,187096,185990}, --S2 Elite Shoulders (less shiny)(paladin) --79526
{2931,187087,186001}, --S2 Glad Helm (more shiny)(paladin)
{2931,187095,185989}, --S2 Glad Shoulders (more shiny)(paladin)
{2872,185996,186000}, --Aberrus Mythic Helm (less shiny)(paladin)
{2872,185984,185988}, --Aberrus Mythic Shoulders (less shiny)(paladin)
{2871,185995,185999}, --Aberrus Heroic Helm (more shiny)(paladin)
{2871,185983,185987}, --Aberrus Heroic Shoulders (more shiny)(paladin)
{2873,185994,185998}, --Aberrus RF Helm (more shiny)(paladin)
{2873,185982,185985}, --Aberrus RF Shoulders (more shiny)(paladin)
{2859,184426,185997}, --Aberrus Normal Helm (more shiny)(paladin)
{2859,184424,185986}, --Aberrus Normal Shoulders (more shiny)(paladin)

--warrior 80661
{2934,187120,186315}, --S2 Elite Helm (less shiny)(warrior)
{2934,187128,186306}, --S2 Elite Shoulders (less shiny)(warrior)
{2933,187119,186314}, --S2 Glad Helm (more shiny)(warrior)
{2933,187127,186305}, --S2 Glad Shoulders (more shiny)(warrior)
{2899,185919,186313}, --Aberrus Mythic Helm (less shiny)(warrior)
{2899,186300,186304}, --Aberrus Mythic Shoulders (less shiny)(warrior)
{2898,185920,186312}, --Aberrus Heroic Helm (more shiny)(warrior)
{2898,186299,186303}, --Aberrus Heroic Shoulders (more shiny)(warrior)
{2900,185918,186311}, --Aberrus RF Helm (more shiny)(warrior)
{2900,186298,186301}, --Aberrus RF Shoulders (more shiny)(warrior)
{2858,184417,186310}, --Aberrus Normal Helm (more shiny)(warrior)
{2858,184415,186302}, --Aberrus Normal Shoulders (more shiny)(warrior)

--warlock 79528
{2918,186866,186212}, --S2 Elite Helm (less shiny)(warlock)
{2918,186874,186197}, --S2 Elite Shoulders (less shiny)(warlock)
{2917,186865,186211}, --S2 Glad Helm (more shiny)(warlock)
{2917,186873,186196}, --S2 Glad Shoulders (more shiny)(warlock)
{2875,186206,186210}, --Aberrus Mythic Helm (less shiny)(warlock)
{2875,186191,186195}, --Aberrus Mythic Shoulders (less shiny)(warlock)
{2874,186205,186209}, --Aberrus Heroic Helm (more shiny)(warlock)
{2874,186190,186194}, --Aberrus Heroic Shoulders (more shiny)(warlock)
{2876,186204,186208}, --Aberrus RF Helm (more shiny)(warlock)
{2876,186189,186192}, --Aberrus RF Shoulders (more shiny)(warlock)
{2860,184507,186207}, --Aberrus Normal Helm (more shiny)(warlock)
{2860,184505,186193}, --Aberrus Normal Shoulders (more shiny)(warlock)

--mage 80466
{2936,186728,186339}, --S2 Elite belt (less shiny)(mage)
{2936,186724,186348}, --S2 Elite Shoulders (less shiny)(mage)
{2935,186723,186347}, --S2 Glad belt (more shiny)(mage)
{2935,186727,186338}, --S2 Glad Shoulders (more shiny)(mage)
{2908,186342,186346}, --Aberrus Mythic belt (less shiny)(mage)
{2908,186333,186337}, --Aberrus Mythic Shoulders (less shiny)(mage)
{2907,186332,186336}, --Aberrus Heroic belt (more shiny)(mage)
{2907,186341,186345}, --Aberrus Heroic Shoulders (more shiny)(mage)
{2909,186331,186334}, --Aberrus RF belt (more shiny)(mage)
{2909,186340,186343}, --Aberrus RF Shoulders (more shiny)(mage)
{2865,184522,186335}, --Aberrus Normal belt (more shiny)(mage)
{2865,184523,186344}, --Aberrus Normal Shoulders (more shiny)(mage)

--priest 80466
{2916,186834,186252}, --S2 Elite helm (less shiny)(priest)
{2915,186833,186251}, --S2 Glad helm (more shiny)(priest)
{2884,186246,186250}, --Aberrus Mythic helm (less shiny)(priest)
{2883,186245,186249}, --Aberrus Heroic helm (more shiny)(priest)
{2885,186244,186248}, --Aberrus RF helm (more shiny)(priest)
{2863,184516,186247}, --Aberrus Normal helm (more shiny)(priest)

--rogue 78348
{2926,187002,186116}, --S2 Elite shoulder (less shiny)(rogue)
{2925,187001,186115}, --S2 Glad shoulder (more shiny)(rogue)
{2881,186110,186114}, --Aberrus Mythic shoulder (less shiny)(rogue)
{2880,186109,186113}, --Aberrus Heroic shoulder (more shiny)(rogue)
{2882,186108,186111}, --Aberrus RF shoulder (more shiny)(rogue)
{2862,184469,186112}, --Aberrus Normal shoulder (more shiny)(rogue)

--DH 80525
{2920,186898,186435}, --S2 Elite helm (less shiny)(DH)
{2920,186906,186423}, --S2 Elite Shoulders (less shiny)(DH)
{2919,186897,186434}, --S2 Glad helm (more shiny)(DH)
{2919,186905,186422}, --S2 Glad Shoulders (more shiny)(DH)
{2902,186429,186433}, --Aberrus Mythic helm (less shiny)(DH)
{2902,186417,186421}, --Aberrus Mythic Shoulders (less shiny)(DH)
{2901,186428,186432}, --Aberrus Heroic helm (more shiny)(DH)
{2901,186416,186420}, --Aberrus Heroic Shoulders (more shiny)(DH)
{2903,186427,186431}, --Aberrus RF helm (more shiny)(DH)
{2903,186415,186418}, --Aberrus RF Shoulders (more shiny)(DH)
{2869,184498,186430}, --Aberrus Normal helm (more shiny)(DH)
{2869,184496,186419}, --Aberrus Normal Shoulders (more shiny)(DH)

--79615 monk
{2924,186962,187683}, --S2 Elite Helm (less shiny)(monk)
{2924,186970,187695}, --S2 Elite Shoulders (less shiny)(monk)
{2923,186961,187682}, --S2 Glad Helm (more shiny)(monk)
{2923,186969,187694}, --S2 Glad Shoulders (more shiny)(monk)
{2887,185779,187681}, --Aberrus Mythic Helm (less shiny)(monk)
{2887,185773,187693}, --Aberrus Mythic Shoulders (less shiny)(monk)
{2886,185778,187680}, --Aberrus Heroic Helm (more shiny)(monk)
{2886,185772,187692}, --Aberrus Heroic Shoulders (more shiny)(monk)
{2888,185777,187679}, --Aberrus RF Helm (more shiny)(monk)
{2888,185771,187690}, --Aberrus RF Shoulders (more shiny)(monk)
{2864,184480,187678}, --Aberrus Normal Helm (more shiny)(monk)
{2864,184478,187691}, --Aberrus Normal Shoulders (more shiny)(monk)

--78876 druid
{2922,186930,18617}, --S2 Elite Helm (less shiny)(druid)
{2922,186938,186155}, --S2 Elite Shoulders (less shiny)(druid)
{2922,186942,186146}, --S2 Elite belt (less shiny)(druid)
{2921,186929,186166}, --S2 Glad Helm (more shiny)(druid)
{2921,186937,186154}, --S2 Glad Shoulders (more shiny)(druid)
{2921,186941,186145}, --S2 Glad belt (more shiny)(druid)
{2893,186161,186165}, --Aberrus Mythic Helm (less shiny)(druid)
{2893,186149,186153}, --Aberrus Mythic Shoulders (less shiny)(druid)
{2893,186140,186144}, --Aberrus Mythic belt (less shiny)(druid)
{2892,186160,186164}, --Aberrus Heroic Helm (more shiny)(druid)
{2892,186148,186152}, --Aberrus Heroic Shoulders (more shiny)(druid)
{2892,186139,186143}, --Aberrus Heroic belt (more shiny)(druid)
{2894,186159,186163}, --Aberrus RF Helm (more shiny)(druid)
{2894,186147,186150}, --Aberrus RF Shoulders (more shiny)(druid)
{2894,186138,186142}, --Aberrus RF belt (more shiny)(druid)
{2868,184489,186162}, --Aberrus Normal Helm (more shiny)(druid)
{2868,184487,186151}, --Aberrus Normal Shoulders (more shiny)(druid)
{2868,184486,186141}, --Aberrus Normal belt (more shiny)(druid)

--80591 evoker
{2911,186748,186396}, --S2 Elite Helm (less shiny)(evoker)
{2911,186756,186384}, --S2 Elite Shoulders (less shiny)(evoker)
{2911,186760,186375}, --S2 Elite belt (less shiny)(evoker)
{2910,186747,186395}, --S2 Glad Helm (more shiny)(evoker)
{2910,186755,186383}, --S2 Glad Shoulders (more shiny)(evoker)
{2910,186759,186374}, --S2 Glad belt (more shiny)(evoker)
{2905,186390,186394}, --Aberrus Mythic Helm (less shiny)(evoker)
{2905,186378,186382}, --Aberrus Mythic Shoulders (less shiny)(evoker) --80812
{2905,186369,186373}, --Aberrus Mythic belt (less shiny)(evoker)
{2904,186389,186393}, --Aberrus Heroic Helm (more shiny)(evoker)
{2904,186377,186381}, --Aberrus Heroic Shoulders (more shiny)(evoker)
{2904,186368,186372}, --Aberrus Heroic belt (more shiny)(evoker)
{2906,186388,186392}, --Aberrus RF Helm (more shiny)(evoker)
{2906,186376,186379}, --Aberrus RF Shoulders (more shiny)(evoker)
{2906,186367,186370}, --Aberrus RF belt (more shiny)(evoker)
{2867,184462,186391}, --Aberrus Normal Helm (more shiny)(evoker)
{2867,184460,186380}, --Aberrus Normal Shoulders (more shiny)(evoker)
{2867,184459,186371}, --Aberrus Normal belt (more shiny)(evoker)

--79903 hunter
{2928,187026,186089}, --S2 Elite Helm (less shiny)(hunter)
{2928,187034,186077}, --S2 Elite Shoulders (less shiny)(hunter)
{2927,187025,186088}, --S2 Glad Helm (more shiny)(hunter)
{2927,187033,186088}, --S2 Glad Shoulders (more shiny)(hunter)
{2890,186083,186087}, --Aberrus Mythic Helm (less shiny)(hunter)
{2890,186071,186075}, --Aberrus Mythic Shoulders (less shiny)(hunter)
{2889,186082,186086}, --Aberrus Heroic Helm (more shiny)(hunter)
{2889,186070,186074}, --Aberrus Heroic Shoulders (more shiny)(hunter)
{2891,186081,186085}, --Aberrus RF Helm (more shiny)(hunter)
{2891,186069,186072}, --Aberrus RF Shoulders (more shiny)(hunter)
{2866,184453,186084}, --Aberrus Normal Helm (more shiny)(hunter)
{2866,184451,186073}, --Aberrus Normal Shoulders (more shiny)(hunter)

--78948 shaman
{2930,187058,186050}, --S2 Elite Helm (less shiny)(shaman)
{2930,187066,186038}, --S2 Elite Shoulders (less shiny)(shaman)
{2930,187070,186029}, --S2 Elite belt (less shiny)(shaman)
{2929,187057,186049}, --S2 Glad Helm (more shiny)(shaman)
{2929,187065,186037}, --S2 Glad Shoulders (more shiny)(shaman)
{2929,187069,186028}, --S2 Glad belt (more shiny)(shaman)
{2878,186044,186048}, --Aberrus Mythic Helm (less shiny)(shaman)
{2878,186032,186036}, --Aberrus Mythic Shoulders (less shiny)(shaman)
{2878,186022,186027}, --Aberrus Mythic belt (less shiny)(shaman)
{2877,186043,186047}, --Aberrus Heroic Helm (more shiny)(shaman)
{2877,186031,186035}, --Aberrus Heroic Shoulders (more shiny)(shaman)
{2877,186021,186025}, --Aberrus Heroic belt (more shiny)(shaman)
{2879,186042,186046}, --Aberrus RF Helm (more shiny)(shaman)
{2879,186030,186033}, --Aberrus RF Shoulders (more shiny)(shaman)
{2879,186023,186026}, --Aberrus RF belt (more shiny)(shaman)
{2861,184444,186045}, --Aberrus Normal Helm (more shiny)(shaman)
{2861,184442,186034}, --Aberrus Normal Shoulders (more shiny)(shaman)
{2861,184441,186024}, --Aberrus Normal belt (more shiny)(shaman)
--79528 more helm/shoulds non-shinyness

{2830,184603,185842}, --Human Heritage Armor (blue) Helm
{2830,184604,184622}, --Human Heritage Armor (blue) chest
{2830,184607,185847}, --Human Heritage Armor (blue) belt

{2832,184599,185844}, --Human Heritage Armor (red) Helm
{2832,184605,184623}, --Human Heritage Armor (red) chest
{2832,184608,185846}, --Human Heritage Armor (red) belt

{2831,184600,185843}, --Human Heritage Armor (grey) Helm
{2831,184606,184624}, --Human Heritage Armor (grey) chest
{2831,184609,185845}, --Human Heritage Armor (grey) belt

{3086,189767,191878}, --Forsaken's Champion (chest)
{3086,189802,189782}, --Forsaken Heritage Armor (maskless helm)

{3362, 195209, 195204}, --Dark Ranger General's chest skimpy vs more covered
{3362, 195212, 195213}, --Dark Ranger General's cloak and quiver backpieces

----
-- vault of the incarnates/s1
----

--dk 76218
{2737,183542,184193}, --S1 Elite Helm (less shiny)(DK)
{2737,183550,184187}, --S1 Elite Shoulders (less shiny)(DK)
{2736,183541,184192}, --S1 Glad Helm (more shiny)(DK)
{2736,183549,184186}, --S1 Glad Shoulders (more shiny)(DK)
{2615,182822,184191}, --Vault Mythic Helm (less shiny)(DK)
{2615,182830,184185}, --Vault Mythic Shoulders (less shiny)(DK)
{2614,182821,184190}, --Vault Heroic Helm (more shiny)(DK)
{2614,182829,184184}, --Vault Heroic Shoulders (more shiny)(DK)
{2616,182820,184188}, --Vault RF Helm (more shiny)(DK)
{2616,182828,183363}, --Vault RF Shoulders (more shiny)(DK)
{2601,182819,184189}, --Vault Normal Helm (more shiny)(DK)
{2601,182827,184183}, --Vault Normal Shoulders (more shiny)(DK)

--paladin 76013
{2739,183836,184259}, --S1 Elite shoulders (less shiny)(paladin)
{2738,183835,184258}, --S1 Glad shoulders (more shiny)(paladin)
{2738,183815,184252}, --S1 Glad chest (more shiny)(paladin) --78265
{2636,182866,184257}, --Vault Mythic shoulders (less shiny)(paladin)
{2635,182865,184256}, --Vault Heroic shoulders (more shiny)(paladin)
{2637,182864,184254}, --Vault RF shoulders (more shiny)(paladin)
{2608,182863,184255}, --Vault Normal shoulders (more shiny)(paladin)

--warrior 76467
{2741,183860,184313}, --S1 Elite Helm (less shiny)(warrior)
{2741,183868,184319}, --S1 Elite Shoulders (less shiny)(warrior)
{2740,183859,184312}, --S1 Glad Helm (more shiny)(warrior)
{2740,183867,184318}, --S1 Glad Shoulders (more shiny)(warrior)
--{,,}, --Vault Mythic Helm (less shiny)(warrior) --missing
{2651,182902,184317}, --Vault Mythic Shoulders (less shiny)(warrior)
{2650,182893,184310}, --Vault Heroic Helm (more shiny)(warrior)
{2650,182901,184316}, --Vault Heroic Shoulders (more shiny)(warrior)
{2652,182892,184308}, --Vault RF Helm (more shiny)(warrior)
{2652,182900,184314}, --Vault RF Shoulders (more shiny)(warrior)
{2613,182891,184309}, --Vault Normal Helm (more shiny)(warrior)
{2613,182899,184315}, --Vault Normal Shoulders (more shiny)(warrior)

--warlock 75523
{2721,183606,184301}, --S1 Elite Helm (less shiny)(warlock)
{2721,183614,184307}, --S1 Elite Shoulders (less shiny)(warlock)
{2720,183605,184300}, --S1 Glad Helm (more shiny)(warlock)
{2720,183613,184306}, --S1 Glad Shoulders (more shiny)(warlock)
{2648,182534,184299}, --Vault Mythic Helm (less shiny)(warlock)
{2648,182542,184305}, --Vault Mythic Shoulders (less shiny)(warlock)
{2647,182533,184298}, --Vault Heroic Helm (more shiny)(warlock)
{2647,182541,184304}, --Vault Heroic Shoulders (more shiny)(warlock)
{2649,182532,184296}, --Vault RF Helm (more shiny)(warlock)
{2649,182540,184302}, --Vault RF Shoulders (more shiny)(warlock)
{2612,182531,184297}, --Vault Normal Helm (more shiny)(warlock)
{2612,182539,184303}, --Vault Normal Shoulders (more shiny)(warlock)

--mage 75598
{2717,183446,184154}, --S1 Elite helm (less shiny)(mage)
{2717,183454,184170}, --S1 Elite Shoulders (less shiny)(mage)
{2716,183445,184153}, --S1 Glad helm (more shiny)(mage)
{2716,183453,184171}, --S1 Glad Shoulders (more shiny)(mage)
{2630,182462,183362}, --Vault Mythic helm (less shiny)(mage)
{2630,182470,184169}, --Vault Mythic Shoulders (less shiny)(mage)
{2629,182461,183361}, --Vault Heroic helm (more shiny)(mage)
{2629,182469,184168}, --Vault Heroic Shoulders (more shiny)(mage)
{2631,182460,183360}, --Vault RF helm (more shiny)(mage)
{2631,182468,184166}, --Vault RF Shoulders (more shiny)(mage)
{2606,182459,183359}, --Vault Normal helm (more shiny)(mage)
{2606,182467,184167}, --Vault Normal Shoulders (more shiny)(mage)

--priest 75333
{2719,183574,184265}, --S1 Elite helm (less shiny)(priest)
{2719,183582,184271}, --S1 Elite Shoulders (less shiny)(priest)
{2718,183573,184264}, --S1 Glad helm (more shiny)(priest)
{2718,183581,184270}, --S1 Glad Shoulders (more shiny)(priest)
{2639,182498,184263}, --Vault Mythic helm (less shiny)(priest)
{2639,182506,184269}, --Vault Mythic Shoulders (less shiny)(priest)
{2638,182497,184262}, --Vault Heroic helm (more shiny)(priest)
{2638,182505,184268}, --Vault Heroic Shoulders (more shiny)(priest)
{2640,182496,184260}, --Vault RF helm (more shiny)(priest)
{2640,182504,184266}, --Vault RF Shoulders (more shiny)(priest)
{2609,182495,184261}, --Vault Normal helm (more shiny)(priest)
{2609,182503,184267}, --Vault Normal Shoulders (more shiny)(priest)

--rogue 78006 
{2729,183734,184277}, --S1 Elite helm (less shiny)(rogue)
{2729,183742,184283}, --S1 Elite shoulder (less shiny)(rogue)
{2728,183733,184276}, --S1 Glad helm (more shiny)(rogue)
{2728,183741,184282}, --S1 Glad shoulder (more shiny)(rogue)
{2642,182678,184275}, --Vault Mythic helm (less shiny)(rogue)
{2642,182686,184281}, --Vault Mythic shoulder (less shiny)(rogue)
{2641,182677,184274}, --Vault Heroic helm (more shiny)(rogue)
{2641,182685,184280}, --Vault Heroic shoulder (more shiny)(rogue)
{2643,182676,184272}, --Vault RF helm (more shiny)(rogue)
{2643,182684,184278}, --Vault RF shoulder (more shiny)(rogue)
{2610,182675,184273}, --Vault Normal helm (more shiny)(rogue)
{2610,182683,184279}, --Vault Normal shoulder (more shiny)(rogue)

--DH 75908  <-----------
{2725,183638,184199}, --S1 Elite helm (less shiny)(DH)
{2725,183646,184205}, --S1 Elite Shoulders (less shiny)(DH)
{2724,183637,184198}, --S1 Glad helm (more shiny)(DH)
{2724,183645,184204}, --S1 Glad Shoulders (more shiny)(DH)
{2618,182570,184197}, --Vault Mythic helm (less shiny)(DH)
{2618,182578,184203}, --Vault Mythic Shoulders (less shiny)(DH)
{2617,182569,184196}, --Vault Heroic helm (more shiny)(DH)
{2617,182577,184202}, --Vault Heroic Shoulders (more shiny)(DH)
{2619,182568,184194}, --Vault RF helm (more shiny)(DH)
{2619,182576,184200}, --Vault RF Shoulders (more shiny)(DH)
{2602,182567,184195}, --Vault Normal helm (more shiny)(DH)
{2602,182575,184201}, --Vault Normal Shoulders (more shiny)(DH)

--75713 monk
{2727,183710,184247}, --S1 Elite Shoulders (less shiny)(monk)
{2726,183709,184246}, --S1 Glad Shoulders (more shiny)(monk)
{2633,182650,184245}, --Vault Mythic Shoulders (less shiny)(monk)
{2632,182649,184244}, --Vault Heroic Shoulders (more shiny)(monk)
{2634,182648,184242}, --Vault RF Shoulders (more shiny)(monk)
{2607,182647,184243}, --Vault Normal Shoulders (more shiny)(monk)

--76103 druid
{2723,183670,184211}, --S1 Elite Helm (less shiny)(druid)
{2723,183678,184217}, --S1 Elite Shoulders (less shiny)(druid)
{2722,183669,184210}, --S1 Glad Helm (more shiny)(druid)
{2722,183677,184216}, --S1 Glad Shoulders (more shiny)(druid)
{2621,182606,184209}, --Vault Mythic Helm (less shiny)(druid)
{2621,182614,184215}, --Vault Mythic Shoulders (less shiny)(druid)
{2620,182605,184208}, --Vault Heroic Helm (more shiny)(druid)
{2620,182613,184214}, --Vault Heroic Shoulders (more shiny)(druid)
{2622,182604,184206}, --Vault RF Helm (more shiny)(druid)
{2622,182612,184212}, --Vault RF Shoulders (more shiny)(druid)
{2603,182603,184207}, --Vault Normal Helm (more shiny)(druid)
{2603,182611,184213}, --Vault Normal Shoulders (more shiny)(druid)

--76853 evoker
{2731,183510,184223}, --S1 Elite Helm (less shiny)(evoker)
{2731,183518,184229}, --S1 Elite Shoulders (less shiny)(evoker)
{2730,183509,184222}, --S1 Glad Helm (more shiny)(evoker)
{2730,183517,184228}, --S1 Glad Shoulders (more shiny)(evoker)
{2624,182714,184221}, --Vault Mythic Helm (less shiny)(evoker)
{2624,182722,184227}, --Vault Mythic Shoulders (less shiny)(evoker)
{2623,182713,184220}, --Vault Heroic Helm (more shiny)(evoker)
{2623,182721,184226}, --Vault Heroic Shoulders (more shiny)(evoker)
{2625,182712,184218}, --Vault RF Helm (more shiny)(evoker)
{2625,182720,184224}, --Vault RF Shoulders (more shiny)(evoker)
{2604,182711,184219}, --Vault Normal Helm (more shiny)(evoker)
{2604,182719,184225}, --Vault Normal Shoulders (more shiny)(evoker)

--76163 hunter
{2733,183766,184235}, --S1 Elite Helm (less shiny)(hunter)
{2733,183774,184241}, --S1 Elite Shoulders (less shiny)(hunter)
{2732,183765,184234}, --S1 Glad Helm (more shiny)(hunter)
{2732,183773,184240}, --S1 Glad Shoulders (more shiny)(hunter)
{2627,182750,184233}, --Vault Mythic Helm (less shiny)(hunter)
{2627,182758,184239}, --Vault Mythic Shoulders (less shiny)(hunter)
{2626,182749,184232}, --Vault Heroic Helm (more shiny)(hunter)
{2626,182757,184238}, --Vault Heroic Shoulders (more shiny)(hunter)
{2628,182748,184230}, --Vault RF Helm (more shiny)(hunter)
{2628,182756,184236}, --Vault RF Shoulders (more shiny)(hunter)
{2605,182747,184231}, --Vault Normal Helm (more shiny)(hunter)
{2605,182755,184237}, --Vault Normal Shoulders (more shiny)(hunter)

--76397 shaman
{2735,183798,184289}, --S1 Elite Helm (less shiny)(shaman)
{2735,183806,184295}, --S1 Elite Shoulders (less shiny)(shaman)
{2734,183797,184288}, --S1 Glad Helm (more shiny)(shaman)
{2734,183805,184294}, --S1 Glad Shoulders (more shiny)(shaman)
{2645,182786,184287}, --Vault Mythic Helm (less shiny)(shaman)
{2645,182794,184293}, --Vault Mythic Shoulders (less shiny)(shaman)
{2644,182785,184286}, --Vault Heroic Helm (more shiny)(shaman)
{2644,182793,184292}, --Vault Heroic Shoulders (more shiny)(shaman)
{2646,182784,184284}, --Vault RF Helm (more shiny)(shaman)
{2646,182792,184290}, --Vault RF Shoulders (more shiny)(shaman)
{2611,182783,184285}, --Vault Normal Helm (more shiny)(shaman)
{2611,182791,184291}, --Vault Normal Shoulders (more shiny)(shaman)

{2645, 182774, 181635},--Shaman, Vault of the Incarnates, Mythic Vest, 76112
{2611, 182771, 181146},--Shaman, Vault of the Incarnates, Normal Vest, 76416
{2646, 182772, 181636},--Shaman, Vault of the Incarnates, LFR Vest, 76438
{2644, 182773, 181634},--Shaman, Vault of the Incarnates, Heroic Vest, 76449

{2701, 179945, 182935},--Cloth Titan Keeper's Vestments, WQ (blue)
}

function AddToCollection()
  for i = 1, #db do
    if (C_TransmogCollection.GetSourceInfo(db[i][6][1])) then --checks if this is an actual set. Only needed for checking sets that are only viewable on the ptr but not yet live.
      local data = {};
      data.classMask = db[i][4];
      data.note = db[i][2];
      data.label = db[i][3];
      data.uiOrder = #db - i;
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
      
      data.description = data.note; --remove this later
      
      app.SetsFrame.AddSetToTables(data);
    end
  end
  
  for i = 1, #altAppearancesDB do
    app.SetsFrame.AddAltAppearancesToTables(altAppearancesDB[i][1],altAppearancesDB[i][2],altAppearancesDB[i][3]);
  end
end

app.ExpandedCallbacks[expansionID] = AddToCollection;
app.altAppearancesDB[expansionID] = altAppearancesDB;
app.altLabelDB[expansionID] = altLabelDB;
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