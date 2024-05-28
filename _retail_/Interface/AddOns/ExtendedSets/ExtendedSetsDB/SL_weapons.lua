local app = select(2,...);

local expansionID = 9;

--Name, Label, Difficulty, patchID, sources, requiredFact, isPvP, noLongerObtainable
----sources(17):
--1) Axe
--2) 2hAxe
--3) Bow
--4) XBow
--5) Dagger
--6) Fist
--7) Gun
--8) Mace
--9) 2hMace
--10) Off-hand
--11) Polearm
--12) Shield
--13) Staff
--14) Sword
--15) 2hSword
--16) Wand
--17) Warglaive

--Item Quality Colors (for item link source)
--0 - Grey/Trash
--1 - White/Common
--2 - Green/Uncommon
--3 - Blue/Rare
--4 - Purple/Epic
--5 - Orange/Legendary
--6 - Artifact
--7 - Heirloom

local covColors = {
  ["Kyrian"] = "|cff5BAFD9",
  ["NightFae"] = "|cff4650DD",
  ["Venthyr"] = "|cffB12B2D",
  ["Necro"] = "|cff417547"
}

--Start of SL: 41233
local db = {
--Dark Iron Dwarf and Blood Elf Heritage Quest Weapons
{"Lavaforge","Heritage","Dark Iron Dwarf",90205,"q:63502",nil,{{13,169686},{1,169687},{12,169690},{9,169686},}},
{"Blood Knight","Heritage","Blood Elf",90205,nil,nil,{{11,169677,"q:63489"},{11,10405,app.GetColoredClassNameString("Paladin").." only loot in Deathholme, Ghostlands after completing","q:63490"},}},

--9.2 Mawsworn
{"Beautiful Death","Mawsworn",nil,90200,"a:15392",nil,{{8,168257},{12,168258},{15,166005,"Sold by Broker in Layer 13+ Adamant Vaults, Torghast"},{11,168600},{9,168259},}},
{"Mortality","Mawsworn",nil,90200,"Dropped by Reanimatrox Marzan in Zereth Mortis",nil,{{8,168256},{12,168255},{15,166003,"Sold by Broker on Layers 13+, Torghast"},{9,168599},}},
{"Atrophy","Mawsworn",nil,90200,"Dropped by Iska, Outrider of Ruin in Zereth Mortis",nil,{{8,168249},{12,168596},{15,168918,"Looted from Domination Cache, Zereth Mortis"},{4,168251},{9,168250},{9,165998,"Sold by Broker on Layers 13+, Torghast"},
                          {13,168254,"Dropped by Any 3 Rares of","a:15392"},{11,168273},{11,166000,"Sold by Broker on Layers 13+, Torghast"},}},
{"Approaching Terror","Mawsworn",nil,90200,"Dropped by High Reaver Damaris in Zereth Mortis",nil,{{8,168252},{12,168597},{15,166004,"Sold by Broker on Layers 13+, Torghast"},{4,165996,"Sold by Broker on Layers 13+, Torghast"},{9,168253},
                          {13,166002,"Sold by Broker on Layers 13+, Torghast"},{11,168598},{9,168167,"Dropped by Corrupted Architect in Zereth Mortis"},}},
{"Guillotine","Mawsworn",nil,90200,"Sold by Broker on Layers 13+, Torghast",nil,{{15,168977,"Dropped by Mawsworn in Desert area of Zereth Mortis"},{4,165994},{9,165997},{13,166001},{11,165999},
                          {11,168274,"Dropped by Reanimatrox Marzan in Zereth Mortis"},}},

--Broker 44454
{"Eternal Guard","Broker",nil,90200,"r:5:2478","Cypher Weapon, Zereth Mortis",{{6,168207,"Dropped by Gluttonous Overgrowth in Zereth Mortis",""},{17,165444},{10,165434},{4,165435},{5,165436},{12,165433},{13,169133},{8,165442},
                          {14,169134,"r:5:2478"},{2,165438},{14,168165,"Dropped by Xy'rath the Covetous in Zereth Mortis",""},}},
{"Enlightened Explorer","Broker",nil,90200,nil,nil,{{2,168154,-1},{14,168155,"Dropped by Vexis in Zereth Mortis","Cypher Weapon, Zereth Mortis"},{8,168156,"Dropped by Sand Matriarch Ileus in Zereth Mortis"},
                          {13,168209,"Dropped by Hadeon the Stonebreaker in Zereth Mortis"},{12,168160,"Dropped by Protector of the First Ones in Zereth Mortis"},{5,168161,"Dropped by Xy'rath the Covetous in Zereth Mortis"},
                          {4,168212,"Dropped by Helmix in Zereth Mortis"},{10,168214,"Dropped by Helmix in Zereth Mortis"},{17,168215,"Dropped by Garudeon in Zereth Mortis"},{14,168164,"Dropped by The Engulfer in Zereth Mortis"},
                          {6,116658,"So'azmi in Tazavesh, the Veiled Market"},}},
{"Fatebreaker","Broker",nil,90200,nil,nil,{{2,116690,"Hylbrande in Tazavesh, the Veiled Market"},{14,116705,"Timecap'n Hooktail in Tazavesh, the Veiled Market"},
                          {8,116700,"Timecap'n Hooktail in Tazavesh, the Veiled Market","Zereth Mortis zone drop"},{13,116699,"So'leah in Tazavesh, the Veiled Market"},{12,116691,"P.O.S.T. Master in Tazavesh, the Veiled Market"},
                          {5,116698,"The Grand Menagerie in Tazavesh, the Veiled Market"},{4,168211,"Dropped by Akkaris in Zereth Mortis"},{10,168213,"Dropped by Tethos in Zereth Mortis"},{17,116697,"So'leah in Tazavesh, the Veiled Market"},
                          {14,168166,"Dropped by Gluttonous Overgrowth in Zereth Mortis"},{6,168208,"Dropped by Any 3 Rares of","a:15392"},}},
{"Riftbreaker","Broker",nil,90200,nil,nil,{{17,168601,"Dropped by Any 3 Rares of","a:15392"},{10,116692,"Myza's Oasis in Tazavesh, the Veiled Market"},{4,116663,"Myza's Oasis in Tazavesh, the Veiled Market"},
                          {5,116657,"The Grand Menagerie in Tazavesh, the Veiled Market"},{12,168159,"Dropped by Gorkek in Zereth Mortis"},{13,116659,"Hylbrande in Tazavesh, the Veiled Market"},
                          {8,168157,"Dropped by Destabilized Core in Zereth Mortis"},{14,169557,"Dropped by enemies in Desert area of Zereth Mortis"},{2,169135,"r:5:2478"},{6,168206,"Dropped by Vexis in Zereth Mortis"},
                          {14,168163,"Dropped by Hirukon in Zereth Mortis"},}},

--Sepulcher of the First Ones (9.2 Raid)
{"Genesis","Sepulcher of the First Ones","Raid Finder",90200,nil,nil,{{12,168848},{12,167513},{10,168041},{13,167829},{13,167950},{15,167833},{13,167796},{14,168009},
                          {9,167897},{11,168045},{5,167893},{5,168013},{8,167719},{6,168852},{1,167857},{7,168017},{9,168840},{4,167926},{14,167930},{17,167993}}},--,{14,168009}
{"Genesis","Sepulcher of the First Ones","Normal",90200,nil,nil,{{12,168845},{12,167510},{10,168040},{13,167827},{13,167948},{15,167831},{13,167794},
                          {9,167895},{11,168044},{5,167891},{5,168012},{14,168008},{8,167717},{6,168849},{1,167855},{7,168016},{9,168840},{4,146369},{14,146361},{17,167992}}},--crossbow/sword might not be right? show 2 diff pvp ones
{"Genesis","Sepulcher of the First Ones","Heroic",90200,nil,nil,{{12,168846},{12,167511},{10,168042},{13,167830},{13,167951},{15,167834},{13,167797},{8,167761},
                          {9,167898},{11,168046},{5,167894},{5,168014},{14,168010},{6,168850},{1,167858},{7,168018},{9,168840},{4,167927},{14,167931},{17,167994}}},
{"Genesis","Sepulcher of the First Ones","Mythic",90200,nil,nil,{{12,168847},{12,167512},{10,168043},{13,167828},{13,167949},{15,167832},{13,167795},
                          {9,167896},{11,168047},{5,167892},{5,168015},{14,168011},{8,167718},{6,168851},{1,167856},{7,168019},{9,168840},{4,167925},{14,167929},{17,167995}}},
                          
--Season 3
{"Cosmic","Shadowlands Season 3","Gladiator",90200,nil,nil,{{1,146351},{14,146361},{15,167498},{8,167504},{9,146367},{12,146213},{12,167495},{5,146355},{5,146357},{14,146359},
                          {17,146365},{6,116568},{4,146369},{7,167496},{11,146371},{13,146373},{13,167502},{13,167500},{10,146211},},nil,true},
{"Cosmic","Shadowlands Season 3","Elite",90200,nil,nil,{{1,146352},{14,146362},{15,167499},{8,167505},{9,146368},{12,146214},{12,167494},{5,146356},{5,146358},{14,146360},
                          {17,146366},{6,116567},{4,146370},{7,167497},{11,146372},{13,146374},{13,167503},{13,167501},{10,146212},},nil,true},

--Sanctum of Domination (9.1 Raid)
{"Domination","Sanctum of Domination","Raid Finder",90100,nil,nil,{{13,146679},{13,146681},{5,146645},{10,146663},{2,146675},{15,146669},{11,146685},{13,146683},
                          {5,146647},{6,146667},{8,146657},{17,146655},{14,146689},{1,146673},{14,146583},{7,146671},{3,146677},{12,146651},{12,146649}}},
{"Domination","Sanctum of Domination","Normal",90100,nil,nil,{{13,145971},{2,145975},{15,145979},{11,145967},{13,145973},{13,145977},{5,145953},{6,145957},{8,145955},
                          {17,145945},{14,145947},{5,145951},{1,145949},{14,146519},{7,145983},{3,145981},{12,145989},{12,145987},{10,145993},{5,145965},{3,145985},}},
{"Domination","Sanctum of Domination","Heroic",90100,nil,nil,{{13,146680},{2,146676},{15,146670},{11,146686},{13,146682},{13,146684},{5,146648},{6,146668},
                          {17,146656},{14,146690},{8,146658},{5,146646},{1,146674},{14,146584},{7,146672},{3,146678},{12,146652},{12,146650},{10,146664},{3,145985},{5,145965},}},
{"Domination","Sanctum of Domination","Mythic",90100,nil,nil,{{13,145972},{2,145976},{15,145980},{11,145968},{13,145974},{13,145978},{5,145954},{6,145958},
                          {8,145956},{17,145946},{14,145948},{5,145952},{1,145950},{14,146585},{7,145984},{3,145982},{12,145990},{12,145988},{10,145994},{5,145965},{3,145985}}},
                          
--Season 2
{"Unchained","Shadowlands Season 2","Gladiator",90100,nil,nil,{{1,116107},{5,116215},{5,116352},{14,116209},{14,165933},{17,116344},{6,165939},{8,165927},{2,116338},
                          {15,165941},{3,116213},{7,165937},{11,116354},{13,165929},{13,116336},{13,165931},{10,116217},{12,116109},{12,165925}},nil,true,true},
{"Unchained","Shadowlands Season 2","Elite",90100,nil,nil,{{1,116108},{5,116216},{5,116353},{14,116210},{14,165934},{17,116345},{6,165940},{8,165928},{2,116339},
                          {15,165942},{3,116214},{7,165938},{11,116355},{13,165930},{13,116337},{13,165932},{10,146059},{12,146060},{12,165926}},nil,true,true},
                 
--Castle Nathria (9.0 Raid)    ,"i:183889:4:Thaumaturgic Anima Bead"          
{"Polemarch","Castle Nathria",covColors["Kyrian"].."Kyrian (Normal)|r",90002,"i:183891:4:Venerated Anima Spherule:3","LFR/Normal/Heroic Class-based Token",{{1,108552},{5,108908},{14,110998},{14,108930},{3,109545},{9,112964},
                          {11,115499},{13,111619},{17,115526},{10,108910,"i:183889:4:Thaumaturgic Anima Bead:3"},{12,108564,"i:183889:4:Thaumaturgic Anima Bead:3"}}},
{"Archon","Castle Nathria",covColors["Kyrian"].."Kyrian (Mythic)|r",90002,"i:183891:4:Venerated Anima Spherule:6","Mythic Class-based Token",{{1,115498},{5,115500},{14,115501},{14,115502},{3,115503},{9,115504},
                          {11,115505},{13,115508},{17,115527},{10,115506,"i:183889:4:Thaumaturgic Anima Bead:6"},{12,115507,"i:183889:4:Thaumaturgic Anima Bead:6"}}},
{"Invoker","Castle Nathria",covColors["Necro"].."Necrolord (Normal)|r",90002,"i:183891:4:Venerated Anima Spherule:3","LFR/Normal/Heroic Class-based Token",{{10,115539,"i:183889:4:Thaumaturgic Anima Bead:3"},
                          {12,115538,"i:183889:4:Thaumaturgic Anima Bead:3"},{2,115544},{1,115546},{5,115537},{5,115547},{7,115543},{8,115540},{11,115545},{13,115542},{17,115541}}},
{"Lichsworn","Castle Nathria",covColors["Necro"].."Necrolord (Mythic)|r",90002,"i:183891:4:Venerated Anima Spherule:6","Mythic Class-based Token",{{10,115567,"i:183889:4:Thaumaturgic Anima Bead:6"},
                          {12,115569,"i:183889:4:Thaumaturgic Anima Bead:6"},{2,115561},{1,115562},{5,115563},{5,115564},{7,115565},{8,115566},{11,115568},{13,115570},{17,115572}}},
{"Nightwatch","Castle Nathria",covColors["NightFae"].."Night Fae (Normal)|r",90002,"i:183891:4:Venerated Anima Spherule:3","LFR/Normal/Heroic Class-based Token",{{5,112282},{6,112361},{17,112959},{8,112341},{16,112842},
                          {3,112862},{9,112328},{13,112825},{13,112312},{10,112354,"i:183889:4:Thaumaturgic Anima Bead:3"},{12,112394,"i:183889:4:Thaumaturgic Anima Bead:3"}}},
{"Faeweald","Castle Nathria",covColors["NightFae"].."Night Fae (Mythic)|r",90002,"i:183891:4:Venerated Anima Spherule:6","Mythic Class-based Token",{{5,115005},{6,115006},{17,115007},{8,115008},{16,115013},
                          {3,115004},{9,115003},{13,115012},{13,115011},{10,115010,"i:183889:4:Thaumaturgic Anima Bead:6"},{12,115002,"i:183889:4:Thaumaturgic Anima Bead:6"}}},
{"Duelist","Castle Nathria",covColors["Venthyr"].."Venthyr (Normal)|r",90002,"i:183891:4:Venerated Anima Spherule:3","LFR/Normal/Heroic Class-based Token",{{8,114133},{14,114138},{13,114134},{14,114136},{15,114131},
                          {5,114130},{6,114132},{17,114139},{4,114140},{10,114142,"i:183889:4:Thaumaturgic Anima Bead:3"},{12,114141,"i:183889:4:Thaumaturgic Anima Bead:3"}}},
{"Inquisitor","Castle Nathria",covColors["Venthyr"].."Venthyr (Mythic)|r",90002,"i:183891:4:Venerated Anima Spherule:6","Mythic Class-based Token",{{8,114860},{14,114861},{13,114862},{14,114863},{15,115056},
                          {5,114864},{6,114865},{17,114867},{4,114868},{10,114859,"i:183889:4:Thaumaturgic Anima Bead:6"},{12,114869,"i:183889:4:Thaumaturgic Anima Bead:6"}}},

--Season 1
{"Sinful","Shadowlands Season 1",covColors["Kyrian"].."Kyrian|r",90002,nil,nil,{{3,111004},{5,111009},{10,111014},{1,108553},{14,110999},
                          {14,110994},{11,115703},{12,108565},{13,111617},{9,112965},{17,115528},},nil,true,true},
{"Sinful","Shadowlands Season 1",covColors["Necro"].."Necrolord|r",90002,nil,nil,{{5,114609},{5,114604},{7,114611},{10,114606},{1,114607},
                          {8,114615},{11,114613},{12,114605},{13,115758},{2,114612},{17,114608},},nil,true,true},
{"Sinful","Shadowlands Season 1",covColors["NightFae"].."Night Fae|r",90002,nil,nil,{{3,112870},{5,112280},{6,112362},{10,112353},
                          {8,112343},{12,112393},{13,112829},{13,112311},{9,112327},{16,112838},{17,112960},},nil,true,true},
{"Sinful","Shadowlands Season 1",covColors["Venthyr"].."Venthyr|r",90002,nil,nil,{{4,114127},{5,114117},{6,114119},{10,114129},{8,114120},
                          {14,114123},{14,114125},{12,114128},{13,114121},{15,114118},{17,114126},},nil,true,true},

--Covenant (Kyrian)
{"Selfless",covColors["Kyrian"].."Kyrian|r",covColors["Kyrian"].."Quartermaster|r",90002,nil,nil,{{1,108555},{5,111011},{14,111001},{14,115692},{11,108906},
                          {12,108567},{17,115531},{3,111006},{10,111016},{13,111616},{9,112963}}},
{"Harmonious",covColors["Kyrian"].."Kyrian|r",covColors["Kyrian"].."Renown|r",90002,nil,nil,{{1,115696},{5,115698},{14,110996},{11,115699},{9,112968},
                          {12,108568},{13,111620},{14,111002},{3,111007},{10,111017},{17,115532}}},
{"Doubt",covColors["Kyrian"].."Kyrian|r",covColors["Kyrian"].."Path of Ascension|r",90002,"Available for purchase after completing","a:14862",{{1,108554},{14,111000},{14,115695},{3,111005},
                          {5,115694},{11,111019},{13,111618},{9,112966},{10,111015},{12,108566},{17,115530}}},

--Covenant (Necrolord)
{"Goreforged",covColors["Necro"].."Necrolord|r",covColors["Necro"].."Quartermaster|r",90002,nil,nil,{{2,114623},{5,114616},{7,114622},{10,114618},{12,114617},
                          {1,115043},{5,114626},{8,114619},{11,114624},{13,114621},{17,114620}}}, 
{"Plaguetouched",covColors["Necro"].."Necrolord|r",covColors["Necro"].."Renown|r",90002,nil,nil,{{1,115350},{5,115351},{8,115344},{11,115349},{13,115346},
                          {17,115345},{2,115348},{5,115341},{7,115347},{10,115343},{12,115342}}},
{"Stitchmasters'",covColors["Necro"].."Necrolord|r",covColors["Necro"].."Abomination Stitching|r",90002,"i:184303:4:Arsenal Stitchmasters' Weapons",nil,{{5,115353},{5,115363},{8,115356},{1,115362},{17,115357},
                          {13,115358},{2,115360},{11,115361},{7,115359},{12,115354},{10,115355}}},

--Covenant (Night Fae)
{"Wild Hunt",covColors["NightFae"].."Night Fae|r",covColors["NightFae"].."Quartermaster|r",90002,nil,nil,{{6,112364},{8,112344},{16,112840},{9,112326},{13,112830},
                          {12,112386},{5,112278},{17,112958},{3,112868},{13,112314},{10,112351}}},
{"Night Courtier's",covColors["NightFae"].."Night Fae|r",covColors["NightFae"].."Renown|r",90002,nil,nil,{{5,112279},{17,112956},{8,114089},{3,112866},{13,112828},
                          {13,112313},{10,112352},{6,112365},{16,112839},{9,112324},{12,112392}}},
{"Winterborn",covColors["NightFae"].."Night Fae|r",covColors["NightFae"].."Travel Network|r",90002,"i:184118:4:Arsenal Winterborn Weapons",nil,{{5,112281},{8,112340},{6,112366},{17,112955},{9,112329},
                          {13,112826},{13,112310},{10,112355},{12,112391},{16,112837},{3,112864}}},

--Covenant (Venthyr)
{"Repetant",covColors["Venthyr"].."Venthyr|r",covColors["Venthyr"].."Quartermaster|r",90002,nil,nil,{{10,113479},{4,113477},{8,113470},{13,113471},{14,113474},
                          {6,113469},{17,113476},{5,113467},{12,113478},{14,113475},{15,113468}}},
{"Selfless",covColors["Venthyr"].."Venthyr|r",covColors["Venthyr"].."Renown|r",90002,nil,nil,{{8,114146},{10,114155},{14,114149},{15,114144},{5,114143},
                          {13,114148},{4,114153},{14,114151},{5,115067},{6,114145},{17,114152},{12,114154}}},
{"Court",covColors["Venthyr"].."Venthyr|r",covColors["Venthyr"].."Ember Court|r",90002,"Purchased from Freeman","(East Gate of non-instanced Ember Court area).",{{8,114094},{10,114103},{14,114097},{15,114092},{6,114093},
                          {17,114100},{12,114102},{14,114099},{13,114095},{5,114091},{4,114101},{5,115066}}},

--Oribos
{"Ceremonious","Oribos",nil,90002,"Crafted",nil,{{5,105971},{5,105976},{17,105978},{1,105974},{15,105969},{2,105975,nil,"Maw/Korthia World Drop"},{11,105972},{14,105968,nil,"Dungeon Drop"},{3,106715,nil,"Maw/Korthia World Drop"},
                          {13,111664,nil,"Dungeon and Maw/Korthia Drop"},{10,109356},{15,111650,"Dungeon Drop"},{12,111455,"Ylva (Maw)","Dungeon Drop"},{8,112853,"Dungeon Drop"},{8,111659,"Dungeon Drop"},}},
{"Korthian","Oribos",nil,90002,nil,"Dungeon Drop",{{1,111554,"Observer Yorik (Korthia)"},{5,111550},{5,111499,"Screaming Shade (Korthia)"},{8,111559,"i:187187:7:Korthian Armaments"},{11,111560},
                          {14,111553,"Deomen the Vortex (Maw), Traitor Balthier (Maw)"},{17,111551},{10,111528,"Korthia Related Quest Reward Boxes"},{13,111529,"Korthia Related Quest Reward Boxes"},
                          {2,146090,"Korthia Related Quest Reward Boxes","i:187187:7:Korthian Armaments"},{8,116747,"Korthia Related Quest Reward Boxes","i:187187:7:Korthian Armaments"},{12,146085,"Korthia Related Quest Reward Boxes","Crafted"},
                          {15,116756,"Korthia Related Quest Reward Boxes","i:187187:7:Korthian Armaments"},{3,116773,"Versya the Damned <Tormentor of Torghast>",""},}},
{"Stygian","Oribos",nil,90002,nil,"Dungeon Drop",{{1,112872},{3,112889,"Dropped by Blinding Shadow in The Maw"},{5,111467,"Intercessor Razzra <Tormentor of Torghast>"},{8,111456,"Dathlane the Herald <Tormentor of Torghast>"},
                          {10,111549,"Naelcrotix (Wrath of the Jailer Event)"},{11,112873,"Eketra (Maw), Guard Orguluus (Maw), Yarxhov (Korthia)"},{12,111473,"Malleus Grakizz  <Tormentor of Torghast>"},
                          {5,116775,"Manifestation of Pain <Tormentor of Torghast>",""},{13,112874,"Shadeweaver Zeris (Maw), Gruukuuek the Elder <Tormentor>"},{14,111462},{15,111497,"World Drop"},{2,116776,"Kazj The Sentinel <Tormentor of Torghast>"},
                          {8,116777,"Mugrem the Soul Devourer <Tormentor of Torghast>","Promathiz <Tormentor of Torghast>"},{15,116745,"Morguliax (Maw)",""},{17,115872,"Lumisende <Tormentor of Torghast>","World Drop"},}},
{"Endless Empire","Oribos",nil,90002,"Dungeon Drop",nil,{{1,111558},{2,111561},{10,111563,nil,"Torglluun (Maw)"},{12,111562},{5,111583,"Korthia Related Quest Reward Boxes"},{5,111475,nil,"i:186196:4:Death's Advance War Chest"},{8,111474},{11,111584},
                          {13,111454,nil,"Crafted"},{8,105973,"Crafted"},{14,111476},{15,116810,"<Tormentor of Torghast>","Only lootable with "..app.ColorStringByClass("Holy Paladin","Paladin").." Loot Spec"},
                          {17,116752,"Korthia Related Quest Reward Boxes"},{3,116742,"Korthia Related Quest Reward Boxes","i:187187:7:Korthian Armaments"},}},
{"Aspirant","Oribos",nil,90002,"PvP Honor Vendor",nil,{{1,111371},{8,111374},{8,111384},{14,111377},{2,111378},{11,111375},{15,111379},{12,111393},
                          {5,111373},{5,114603},{17,111382},{3,111427},{13,111376},{10,111381},}},

--Ardenweald
{"Spring",covColors["NightFae"].."Ardenweald|r",nil,90002,nil,nil,{{13,112301,"From Covenant Special Features"},{13,112929,"Dropped by Deathbinder Hroth in Ardenweald","Only for Casters/Healers"},
                          {2,112919,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},{1,112909,"Dropped by Skuld Vit in Ardenweald","Only For Agility Melee"},{10,112347,"From Covenant Special Features"},{11,112317,"Ardenweald Focused Quests, Callings and Missions","Only For Agility Melee"},
                          {5,112285,"Ardenweald Focused Quests, Callings and Missions","Only for "..app.GetColoredClassNameString("Rogue")},{9,112321,"Ardenweald Focused Quests, Callings and Missions"},{14,112299,"From Covenant Special Features"},
                          {3,112367,"q:63578"},{17,112294,"From Covenant Special Features"},{8,112332,"From Covenant Special Features"},{12,112389,"From Covenant Special Features"},}},
{"Summer",covColors["NightFae"].."Ardenweald|r",nil,90002,nil,nil,{{13,112928,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for Casters/Healers"},
                          {2,112918,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},{1,112908,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},{17,112296,"q:63578"},{8,112330,"q:63578"},{12,112387,"Dropped by Rootwrithe in Ardenweald"},
                          {10,112346,"Ardenweald Focused Quests, Callings and Missions"},{11,112316,"q:63578"},{5,109453,"q:60856","q:59623"},{9,112320,"q:63578"},{14,112300,"q:63578"},{3,112368,"Ardenweald Focused Callings and Missions"},}},
{"Autumn",covColors["NightFae"].."Ardenweald|r",nil,90002,nil,nil,{{13,112302,"Ardenweald Focused Quests, Callings and Missions"},{13,112926,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for Casters/Healers"},
                          {2,112916,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},{1,112906,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for Agility Melee"},{10,112348,"q:63578"},{11,112318,"From Covenant Special Features"},
                          {5,112284,"From Covenant Special Features"},{9,112322,"From Covenant Special Features"},{3,112369,"From Covenant Special Features"},{17,112293,"Ardenweald Focused Quests, Callings and Missions"},
                          {8,112331,"Ardenweald Focused Callings and Missions"},{12,112388,"Ardenweald Focused Callings and Missions"},{14,112297,"Drop in Elusive Faerie Cache in Ardenweald","Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},}},
{"Winter",covColors["NightFae"].."Ardenweald|r",nil,90002,nil,nil,{{13,112303,"Dropped by Astra, As Azshara in Ardenweald","Only for Casters/Healers"},{13,112927,"Dropped by Soultwister Cero in Ardenweald","Only for Casters/Healers"},
                          {2,112917,"Dropped by Valfir the Unrelenting in Ardenweald","Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},
                          {1,112907,"Dropped by Faeflayer in Ardenweald","Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},
                          {10,112349,"Drop from Harmonic Chest in Ardenweald","Only for Casters/Healers"},{11,113582,"Dropped by Wrigglemortis in Ardenweald","Only for "..app.GetColoredClassNameString("Druid")..", "..app.GetColoredClassNameString("Hunter")..", or "..app.GetColoredClassNameString("Monk")},{5,112287,"Dropped by Mymaen in Ardenweald","Only for "..app.GetColoredClassNameString("Rogue")},
                          {9,113581,"Dropped by Dustbrawl in Ardenweald","Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},
                          {3,112370,"Dropped by Mystic Rainbowhorn in Ardenweald","Only for "..app.GetColoredClassNameString("Hunter")},{14,112298,"Ardenweald Quest/Zone Drop","Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},{17,112295,"Drop from Dreamsong Heart in Ardenweald"},
                          {8,112333,"Only for "..app.GetColoredClassNameString("Monk")..", "..app.GetColoredClassNameString("Rogue")..", or "..app.GetColoredClassNameString("Shaman")},{12,113580,"Epic BoE Drop in Shadowlands Zones"},}},
{"Night",covColors["NightFae"].."Ardenweald|r",nil,90002,nil,nil,{{13,109457,"q:60856"},{13,112925,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies","In Ardenweald, Only for Casters/Healers"},
                          {2,111452,"Dungeon Drop","Only for "..app.GetColoredClassNameString("Death Knight")..", "..app.GetColoredClassNameString("Paladin")..", or "..app.GetColoredClassNameString("Warrior")},
                          {1,112905,"Hunter Vivanna, Decayed Husk, or Darkreach Supplies in Ardenweald","Only for "..app.GetColoredClassNameString("Paladin")..", "..app.GetColoredClassNameString("Monk")..", or "..app.GetColoredClassNameString("Shaman")},{10,111060,"q:60856"},{11,109456,"q:60856","q:59623"},{3,109452,"q:60856","q:59623"},{5,112283,"q:63578"},{14,109458,"q:60856","q:59623"},{17,109461,"q:60856","q:59623"},{8,109454,"q:60856","q:59623"},
                          {9,109455,"q:60856","q:59623"},{12,109459,"q:60856"},}},

--Bastion
{"Harmony",covColors["Kyrian"].."Bastion|r",nil,90002,"Dropped by Collector Astorestes in Bastion",nil,{{6,106717,nil,"Crafting"},{8,111534,nil,"Dungeon Drop"},{5,114852},{4,106714,nil,"Crafting"},{10,114850},{8,114856},{15,114853},
                          {11,114849,nil,"Dropped by Aspirant Eolis in Bastion"},{17,112273,"Dropped by Collector Astorestes, Aethon, Embodied Hunger,","Worldfeaster Chronn, or Xixin the Ravening in Bastion"},{12,114848},}},
{"Tranquil",covColors["Kyrian"].."Bastion|r",nil,90002,"From Covenant Special Features",nil,{{6,113534},{8,113537},{5,113535},{4,113529},{10,113533},{8,113539},{15,113536},{11,113532},{17,113530},{12,113531},}},
{"Knell",covColors["Kyrian"].."Bastion|r",nil,90002,"Bastion Focused Quests and Missions",nil,{{6,109794},{8,109797},{5,109795},{4,109789},{10,109793},{8,109862},{15,109796},{11,109792},{17,109790},{12,109791},}},
{"Heroic",covColors["Kyrian"].."Bastion|r",nil,90002,nil,nil,{{6,112274,"Dropped by Cloudtail in Bastion"},{8,112272,"Dropped by Sigilback in Bastion"},{5,112271,"Dropped by Nemaeus in Bastion"},{4,111665,"Dungeon Drop"},
                          {11,115873,"Epic BoE Drop in Shadowlands Zones"},{12,115876,"Epic BoE Drop in Shadowlands Zones"},}},
{"Doubt",covColors["Kyrian"].."Bastion|r",nil,90002,"i:184462:3:Arsenal Doubt's Weapon Cache","Thran'tiok (Wisdom), Path of Ascension",{{6,115665},{8,115668},{5,115666},{4,115661},{10,115664},{8,115670},{15,115667},{11,115663},{17,115662},}},

--Maldraxxus
{"Gore-Smudged",covColors["Necro"].."Maldraxxus|r",nil,90002,"Maldraxxus Zone Drop",nil,{{14,111597},{5,113246},{13,111596},{16,106711,nil,"Crafted"},
                          {1,113763,"Maldraxxus Focused Callings, Missions and Treasures","Dropped by Bloated Lootfly in Maldraxxus"},{1,113764,"Maldraxxus Focused Callings, Missions and Treasures","Dropped by Bloated Lootfly in Maldraxxus"},
                          {8,111595},{15,111600},{12,111601},{10,111602},{17,111603},{4,111598},{5,111594},}},
{"Battle-scarred",covColors["Necro"].."Maldraxxus|r",nil,90002,nil,nil,{{14,115601,"Dropped by Sister Chelicerae in Maldraxxus"},{5,113216,"q:59011","q:60886",},{13,113571,"From Covenant Special Features"},
                          {16,115460,"Dropped by Burnblister in Maldraxxus"},{8,115870,"Epic BoE Drop in Shadowlands Zones"},{15,115463,"Dropped by Devour'us in Maldraxxus"},{12,113235,"Ornate Bone Shield Treasure in Maldraxxus"},
                          {1,115467,"Dropped by Collector Kash in Maldraxxus"},{17,109756,"q:59011","q:57316"},{4,114552,-1},{5,114548,-1},}},
{"Battle Tested",covColors["Necro"].."Maldraxxus|r",nil,90002,nil,nil,{{14,114551,-1},{5,114559,-1},{13,114550,-1},{16,114553,-1},{1,115470,"Dropped by Taskmaster Xox in Maldraxxus"},{1,115469,"Dropped by Taskmaster Xox in Maldraxxus"},{8,114549,-1},
                          {15,115464,"Dropped by Nerissa Heartless in Maldraxxus"},{12,109754,"q:59011:57316","Maldraxxus Focused Callings, Missions and Treasures"},{10,113570,"From Covenant Special Features"},
                          {17,115461,"Dropped by Corpsecutter Moroc in Maldraxxus"},{4,109751,"q:57316:59011:60886","Dropped by Gristlebeak in Maldraxxus"},{5,115468,"Dropped by Ravenomous in Maldraxxus"},}},
{"Marrowfused",covColors["Necro"].."Maldraxxus|r",nil,90002,"From Covenant Special Features",nil,{{14,113575},{5,113573},{1,115462,"Dropped by Corpsecutter Moroc in Maldraxxus"},{8,113574},{15,113576},{12,113578},
                          {10,115606,"Dropped by Gieger in Maldraxxus"},{16,109752,"q:59011:57316","Maldraxxus Focused Callings, Missions and Treasures"},{1,115466,"Dropped by Collector Kash in Maldraxxus"},{17,113577},{4,113568},{5,113572},}},
{"Ruthless",covColors["Necro"].."Maldraxxus|r",nil,90002,nil,nil,{{14,109750,"q:59011:57316:60886","Maldraxxus Focused Callings, Missions and Treasures"},{5,115602,"Dropped by Bubbleblood in Maldraxxus"},
                          {13,109749,"q:57316:59011:60886","Maldraxxus Focused Callings, Missions and Treasures"},{8,109748,"q:59011:57316:60886","Dropped by Deepscar, Maldraxxus Missions and Treasures"},
                          {15,109753,"q:59011:57316:60886","Maldraxxus Focused Callings, Missions and Treasures"},{12,115600,"Dropped by Warbringer Mal'Korak in Maldraxxus"},
                          {10,109755,"q:59011:57316","Maldraxxus Focused Callings, Missions and Treasures"},{16,113569,"From Covenant Special Features"},{17,114557,-1},{4,115875,"Maldraxxus Zone Drop"},
                          {5,109747,"q:59011:57316:60886","Maldraxxus Focused Callings, Missions and Treasures"},}},

--Revendreth
{"Arcanist",covColors["Venthyr"].."Revendreth|r",nil,90002,nil,nil,{{8,111075,"q:57724:59726","Revendreth Zone Drop"},{5,110862,"q:57189:59726","Revendreth Zone Drop, Sold by Ta'rmoro in Revendreth"},
                          {5,113018,"Dropped by Grand Arcanist Dimitri in Revendreth"},{9,110866,"q:57189:59726","Revendreth Zone Drop"},{13,110857,"q:57724:59726","Revendreth Zone Drop"},{12,110850,"q:57189","Revendreth Zone Drop"},
                          {10,113312,"From Covenant Special Features"},{17,110987,"Drop from Vyrtha's Dredglaive Treasure"},{14,112985,"Dropped by Forgemaster Madalav in Revendreth,","Pickpocket Venthyr and Aid Revendreth Treasures"},
                          {11,113515,"q:62778","Revendreth Focused Missions"},{7,110982,"Revendreth Zone Drop"},}},
{"Ritualist",covColors["Venthyr"].."Revendreth|r",nil,90002,nil,nil,{{8,113311,"From Covenant Special Features"},{5,115867,"Epic BoE Drop in Shadowlands Zones"},{5,113310,"From Covenant Special Features"},{5,115060,"Sold by Ta'rmoro in Revendreth"},
                          {9,113309,"From Covenant Special Features"},{13,113009,-1},{12,113513,"q:62778","Revendreth Focused Callings and Missions"},{10,110851,"q:57189","Revendreth Zone Drop"},{17,110863,"q:59726","q:57189"},
                          {14,114304,"Dropped from Rapier of the Fearless in Revendreth"},{11,114306,"Dominance Keep, Revendreth Sub-Zone Drop"},{7,111461,"Dungeon Drop"},}},
{"Stonewright",covColors["Venthyr"].."Revendreth|r",nil,90002,nil,nil,{{8,113523,"Revendreth World Quest"},{5,113308,"From Covenant Special Features"},{5,110984,"Revendreth Zone Drop"},
                          {5,115062,"Dropped by Royal Arcanist in Revendreth","Drop from Forgotten Chest in Revendreth"},{9,110852,"q:57724","Revendreth Focused Callings and Missions"},{7,107304,"Crafted"},
                          {13,110983,"Dropped by Grand Inquisitor Aurica in Revendreth","Dropped by Grand Inquisitor Nicu in Revendreth"},{12,113005,"Dominance Keep, Revendreth Sub-Zone Drop"},{10,113259,"Archivam, Revendreth Sub-Zone Drop"},
                          {17,113008,"Dropped by Soulstalker Doina in Revendreth"},{14,110864,"q:57189:59726","Revendreth Zone Drop, Sold by Ta'rmoro in Revendreth"},{11,112983,"Drop from Stone Legion Supplies and Bleakwood Chest","in Revendreth"},}},
{"Crypt Watcher",covColors["Venthyr"].."Revendreth|r",nil,90002,nil,nil,{{8,115871,"Revendreth Zone Drop"},{5,110859,"q:57724","Pickpocketed from Venthyr NPCs in Revendreth"},{5,112984,"Drop from Aid Revendreth Treasures","Only for Casters/Healers"},
                          {5,115061,"Sold by Master Clerk Salorn in Ardenweald"},{9,114303,"Drop from Pugilist's Prize (Aid Revendreth) Treasure"},{13,113303,"From Covenant Special Features"},
                          {12,112986,"Drop from Reliquary of Remembrance in Revendreth"},{10,112987,"Drop from Reliquary of Remembrance in Revendreth"},{17,113306,"From Covenant Special Features"},
                          {14,110856,"q:57724","Revendreth Focused Callings and Missions"},{11,113304,"From Covenant Special Features"},{7,113305,"From Covenant Special Features"},}},
{"Inquisitor",covColors["Venthyr"].."Revendreth|r",nil,90002,nil,nil,{{8,114301,"Dropped by Grand Inquisitor Aurica in Revendreth","Dropped by Grand Inquisitor Nicu in Revendreth"},{5,115868,"Epic BoE Drop in Shadowlands Zones"},
                          {5,110858,"q:57724","Revendreth Focused Callings, Missions and Treasures"},{5,115063,"Revendreth Zone Drop"},{9,105970,"Crafted","Halls of Atonement Sub-Zone Drop"},
                          {13,110853,"q:57724","Revendreth Focused Callings and Treasures"},{12,113313,"From Covenant Special Features"},{10,113514,"Revendreth World Quests","q:62778"},{17,110855,"q:57724"},
                          {14,113307,"From Covenant Special Features"},{11,110981,"Revendreth Zone Drop"},{7,110854,"q:57724","Revendreth Focused Missions"},}},

--NPE
{"Expedition","Exile's Reach","Base",90000,nil,nil,{{2,114252,-1},{3,114285,-1},{15,114263,-1},{15,114253,-1},{14,108836},{14,114258,-1},{14,114251,-1},{13,108829},{13,114250,-1},{5,108838},{5,114248,-1},{9,114249,-1},{8,114278,-1},{17,114281,-1},
                                            {1,114246,-1},{1,114261,-1},{12,114254,-1},{12,114299,-1},}},
{"Expedition","Exile's Reach","Improved",90000,nil,nil,{{2,108831},{3,108828},{15,108832},{15,114293,-1},{14,114276,-1},{14,114275,-1},{14,114273,-1},{13,114290,-1},{13,114289,-1},{5,108837},{5,114257,-1},{9,114287,-1},{8,108839},{17,114255,-1},
                                                {1,108827},{1,114266,-1},{12,114296,-1},{12,114298,-1},{12,114260,-1},}},
{"Expedition","Exile's Reach","Reinforced",90000,nil,nil,{{2,114282,-1},{3,114247,-1},{15,114295,-1},{15,114292,-1},{14,114277,-1},{14,114274,-1},{14,114272,-1},{13,108830},{13,114291,-1},{5,114271,-1},{5,114268,-1},{9,114286,-1},{8,114279,-1},
                                                  {17,114280,-1},{1,114267,-1},{1,114265,-1},{12,114297,-1},{12,114300,-1},}},
};

local function GetFormattedLabel(label)
  if not label then return "" end
  local labelTable = {}
  for out in gmatch(label,"[^:]+") do
    tinsert(labelTable,out);
  end
  if labelTable[1] == "a" then
    return "Achievement: "..GetAchievementLink(labelTable[2]);
  elseif labelTable[1] == "i" then
    local itemID = labelTable[2];
    local itemLink = select(2,GetItemInfo(itemID));
    if itemLink then
      return "Item: "..itemLink;
    else
      local _,_,_,color = GetItemQualityColor(labelTable[3]);
      local retLabel = "Item: \124c"..color.."\124Hitem:"..itemID;
      if labelTable[5] then
        retLabel = retLabel..":::::::::::"..labelTable[5];
      end
      retLabel = retLabel.."\124h["..labelTable[4].."]\124h\124r"
      return retLabel;
    end
  elseif labelTable[1] == "q" then
    local str = "Quest:"
    for i = 2,#labelTable do
      local questID = labelTable[i];
      local questName = QuestUtils_GetQuestName(questID);
      str = str.." \124cffffff00\124Hquest:"..questID.."\124h["..questName.."]\124h\124r";
    end
    return str;
  elseif labelTable[1] == "r" then
    local tier = tonumber(labelTable[2]);
    local factionName = GetFactionInfoByID(labelTable[3]);
    local repStr = "";
    if tier == 1 then repStr = "Friendly with "
    elseif tier == 2 then repStr = "Honored with "
    elseif tier == 3 then repStr = "Revered with "
    elseif tier == 4 then repStr = "Exalted with "
    elseif tier == 5 then repStr = "Paragon Box from "
    end
    return repStr.."\124cffffff00"..factionName.."\124r";
  else
    return label; --moving the description to the previously unused 5th slot
  end
end

local function AddToCollection()
  local patch = select(4,GetBuildInfo());
  for i = 1, #db do
    if (db[i][4] <= patch) then
      local data = {};
      data.name = db[i][1];
      data.label = db[i][2];
      data.difficulty = db[i][3];
      data.patchID = db[i][4];
      data.sources = db[i][7];
      data.requiredFaction = db[i][8];
      data.isPvP = db[i][9];
      data.noLongerObtainable = db[i][10];
      data.favorite = false;
      data.expansionID = expansionID;
      
      data.setID = expansionID * 1000 + (#db - i);
      
      for j=1,#data.sources do
        local _,appID,_,icon = C_TransmogCollection.GetAppearanceSourceInfo(data.sources[j][2])
        local s = C_TransmogCollection.GetAllAppearanceSources(appID);
        local isCollected = false;
        for i=1,#s do
          if C_TransmogCollection.GetSourceInfo(s[i]).isCollected then
            isCollected = true;
            break;
          end
        end
        
        if not data.icon then data.icon = icon; end
        
        if not data.sources[j][3] and db[i][5] then data.sources[j][3] = db[i][5]; end
        data.sources[j][5] = GetFormattedLabel(data.sources[j][3]);
        if not data.sources[j][4] and db[i][6] then data.sources[j][4] = db[i][6]; end
        data.sources[j][6] = GetFormattedLabel(data.sources[j][4]);
        
        data.sources[j][3] = isCollected;
        data.sources[j][4] = appID;
      end
      
      app.AddWeaponSetToTables(data);
    end
  end
end

app.WeaponCallbacks[expansionID] = AddToCollection;