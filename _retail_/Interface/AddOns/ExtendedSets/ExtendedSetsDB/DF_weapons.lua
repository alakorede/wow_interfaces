local app = select(2,...);

local expansionID = 10;

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
--70514
--Start of SL: 69434
local db = {
{"Voidtouched","Hunt the Harbinger","",100207,nil,nil,{{14,200451},{8,200448},{10,200449},{12,200450},}},

{"Keg Leg's Crew","Plunderstorm",nil,100206,nil,nil,{{5,198652},{14,198653},{7,198656},{14,198654},{7,198657},{1,198655},{13,198641},{1,198650},{14,198642},{7,198651},{15,198649}},nil,nil,true},

{"Kaldorei","Bel'ameth","",100205,nil,nil,{{11,195178},{5,195174},{3,195215},{12,195177},{10,195179},{10,195176},{10,195175},{10,195173},{10,195172},}},

{"Archivist's","Azerothian Archives","",100205,nil,nil,{{13,195225},{8,195227},{14,195226},{5,195149},{9,180938},{10,180926},{7,195158},{9,189759},{8,189757},{1,189756},{8,189755},{10,189752},}},

--Amirdrassil
{"Amirdrassil","The Dream's Hope","Raid Finder",100200,nil,nil,{{13,191086},{9,191047},{15,191077},{11,191098},{11,191068},{13,191034},{5,191050},{5,191037},{1,191043},{14,191065},{17,191080},{6,191062},{8,191095},{14,191053},{3,191089},{7,191056},{13,189940},{12,191040},{12,191074},{10,191059},}},
{"Amirdrassil","The Dream's Hope","Normal",100200,nil,nil,{{12,188899},{12,188900},{10,188898},{13,188897},{9,188902},{15,188901},{11,188895},{11,188894},{13,188896},{5,188883},{5,188884},{1,188888},{14,188892},{17,188893},{6,188886},{8,188890},{14,188891},{3,188882},{7,188887},{13,189940},}},
{"Amirdrassil","The Dream's Hope","Heroic",100200,nil,nil,{{13,191087},{9,191048},{15,191078},{11,191099},{11,191069},{13,191035},{5,191051},{5,191038},{1,191044},{14,191066},{17,191081},{6,191063},{8,191096},{14,191054},{3,191090},{7,191057},{13,189940},{12,191041},{12,191075},{10,191060},}},
{"Amirdrassil","The Dream's Hope","Mythic",100200,nil,nil,{{12,191042},{12,191076},{10,191061},{13,191088},{9,191049},{15,191079},{11,191100},{11,191070},{13,191036},{5,191052},{5,191039},{1,191045},{14,191067},{17,191082},{6,191064},{8,191097},{14,191055},{3,191091},{7,191058},{13,189940},}},

--Season 3 & 4
{"Verdant","Dragonflight Season 3 & 4","Gladiator",100200,nil,nil,{{13,190821},{5,190827},{14,190837},{14,190835},{13,190830},{13,190839},{15,190832},{9,190833},{11,190820},{3,190829},{7,190822},{6,190828},{8,190823},{1,190817},{5,190818},{12,190825},{12,190831},{10,190824},},nil,true,false},
{"Verdant","Dragonflight Season 3 & 4","Elite",100200,nil,nil,{{10,193050},{12,193051},{12,193052},{1,193040},{14,193058},{14,193057},{8,193049},{5,193042},{5,193041},{6,193053},{15,193055},{9,193056},{13,193046},{13,193045},{11,193044},{3,193054},{7,193048},},nil,true,false},

--Emerald Dream --start at 81769 --ends at 81994
{"Arctic Warden's","Emerald Dream",nil,100200,"Weekly Quest Loot Drop","Superbloom, Worthy Ally, Blooming Dreamseeds",{{15,193017},{5,193005},{16,193018},{10,193000},{8,193011},{13,193001},{3,193012},{11,189692},{8,193015},{17,193002},{1,193013},{14,193003},{12,192999},}},
{"Flame Endowed","Emerald Dream",nil,100200,"PvP World Quests and Honor",nil,{{10,191948},{16,192954},{5,191103},{15,189711},{8,191944},{13,189688},{3,191953},{11,191945},{8,191950},{12,191951},{1,191942},{14,191957},{17,191949},}},
{"Summer Soother's","Emerald Dream",nil,100200,"Quest Rewards",nil,{{12,191135},{17,193861,"Secret 'Quest' for Demon Hunters","Starts with Landeron Felfury"},{14,191139},{1,191149},{17,191138},{8,191151},{11,191140},{3,191102},{13,191137},{8,191147},{15,191153},{5,191141},{16,191154},{10,191136},}},
{"Sunset's","Emerald Dream",nil,100200,"Zone and Rares Drop",nil,{{10,189686},{16,189714},{5,189694},{15,191104},{8,189701},{13,189700},{3,189702},{11,189715},{8,189707},{17,189690},{1,189705},{14,189691},{12,189685},}},
{"Ceremonial Jacaranda","Emerald Dream",nil,100200,"Purchased from Talisa Whisperbloom","Chance to drop from Dreamseeds",{{14,191207},{1,191200},{17,191210},{8,191204},{11,191159},{3,191201},{13,191206},{8,191203},{15,191208},{5,191202},{16,191209},}},

--BMAH
{"Gilded","Dragonflight Black Market",nil,100200,nil,nil,{{12,193989},{7,193986},{11,194086},{2,193987},{12,194006},{14,194088,"i:211300:4:Arsenal Whispering Temple Blades"},{14,194089,"i:211300:4:Arsenal Whispering Temple Blades"},}},

--Time Rifts
{"Plague-Touched","Time Rifts",nil,100105,"Purchased from Baron Silver",nil,{{4,188495},{2,188500},{3,188501},{8,188510},{13,188514},{13,188519},{14,188520},}},
{"Clockwork","Time Rifts",nil,100105,"Purchased from Gill the Drill",nil,{{5,188513},{8,188521},{14,188523},{16,188494},{7,188497},{15,188502},{12,188496},}},
{"Fel-Infused","Time Rifts",nil,100105,"Purchased from Falara Nightsong",nil,{{17,188488},{2,188507},{9,188498},{9,188508},{11,188486},{13,188518},{15,188506},}},
{"Unknown Horror","Time Rifts",nil,100105,"Purchased from Provisioner Qorra",nil,{{5,188490},{6,188492},{8,188493},{14,188491},{13,188487},{12,188509},}},
{"Warmonger's","Time Rifts",nil,100105,"Purchased from Warden Krizzik","Note: Buying 1 unlocks both faction colors.",{{1,188652},{1,188651},}},
{"Valhalas","Time Rifts",nil,100105,"Purchased from Sorotis",nil,{{1,188489},{6,188511},{14,188512},{11,188515},{10,188499},}},

--Dawn of the Infinite
{"The Timeways","Dawn of the Infinite","",100105,nil,nil,{{11,189055},{2,189606},{13,189654},{9,189716},{14,189063},{8,189067},{8,189068},{17,189059},{1,189060},{5,189065},{5,189064},{14,189062},{7,189054},{12,189046},{10,189051},}},

--Aberrus
{"Aberrus","The Shadowed Crucible","Raid Finder",100100,nil,nil,{{15,185542},{13,187670},{11,185480},{13,185506},{8,185527},{6,185491},{5,185497},{5,185494},{8,185474},{1,185534},{17,185517},{8,185503},{1,185509},{3,185514},{7,185538},{11,185477},{12,185549},{12,185524},{10,185545},{10,185520},}},
{"Aberrus","The Shadowed Crucible","Normal",100100,nil,nil,{{15,184579},{13,184539},{11,184533},{13,184537},{8,185528},{6,184534},{5,184538},{5,184529},{8,184544},{1,185535},{17,184540},{8,184542},{1,185510},{3,184580},{7,185539},{11,184543},{12,184532},{12,184545},{10,185546},{10,185521},}},
{"Aberrus","The Shadowed Crucible","Heroic",100100,nil,nil,{{15,185543},{13,187668},{11,185481},{13,185507},{8,185529},{6,185492},{5,185498},{5,185495},{8,185475},{1,185536},{17,185518},{8,185504},{1,185511},{3,185515},{7,185540},{11,185478},{12,185550},{12,185525},{10,185547},{10,185522},}},
{"Aberrus","The Shadowed Crucible","Mythic",100100,nil,nil,{{15,185544},{13,187669},{11,185482},{13,185508},{8,185530},{6,185493},{5,185499},{5,185496},{8,185476},{1,185537},{17,185519},{8,185505},{1,185512},{3,185516},{7,185541},{11,185479},{12,185551},{12,185526},{10,185548},{10,185523},}},

--Season 2
{"Obsidian","Dragonflight Season 2","Gladiator",100100,"","",{{13,187706},{12,187711},{6,187732},{7,187707},{1,187712},{17,187704},{10,187710},{8,187709},{11,187705},{5,187703},{3,187736},},nil,true,true},
{"Obsidian","Dragonflight Season 2","Elite",100100,"","",{{13,187852},{12,187856},{6,187857},{7,187853},{1,187761},{17,187850},{10,187855},{8,187854},{11,187851},{5,187849},{3,187858},},nil,true,true},

--Draconic2
{"Suffused","Draconic Surge",nil,100100,nil,nil,{{12,185822},{10,185823},{16,185824},{11,185825},{7,185830},{14,185831},{5,185836},{15,185829},{1,185838},{8,186449},{8,185834},{13,185828},{17,185827},}},
{"Zaralek Surveyor's","Draconic Surge",nil,100100,nil,nil,{{10,185958},{14,185962},{1,185968},{8,185970},{5,185963},{8,186448},{17,185974},{7,185961},{16,185959},{12,185957},{13,185973},{15,185967},{11,185960},}},
{"Timewalker's","Draconic Surge",nil,100100,nil,nil,{{1,189060},{12,189050},{17,189059},{5,189064},{8,189069},{10,189051},{14,189063},{13,189058},{7,189053},{11,189056},{15,189049},{8,189067},}},
{"Hoursteel","Draconic Surge",nil,100100,nil,nil,{{8,189068},{15,189048},{11,189055},{7,189054},{13,189057},{16,189044},{10,189047},{8,189066},{5,189065},{17,189045},{12,189046},{1,189061},}},
{"Neltharic","Draconic Surge",nil,100100,nil,nil,{{1,185602},{12,185603},{17,185595},{5,185601},{8,185600},{10,185604},{14,185597},{16,185605},{13,185598},{7,185594},{11,185599},{15,185596},{8,185893},}},

--Vault of the Incarnates
{"Incarnate","Vault of the Incarnates","Raid Finder",100000,nil,nil,{{11,183253},{13,183402},{9,183417},{2,183429},{13,183399},{14,183405},{5,183265},{6,183411},{17,183158},{8,183256},{8,183259},{5,183423},{4,183161},{3,183426},{13,181178},{10,183414},{10,183396},{12,183420},{12,183388}}},
{"Incarnate","Vault of the Incarnates","Normal",100000,nil,nil,{{11,181142},{13,181163},{9,181177},{2,181187},{13,181156},{14,181164},{5,181162},{6,181171},{17,181150},{8,181148},{8,181140},{5,181180},{4,181149},{3,181186},{13,181178},{10,181172},{10,181143},{12,181179},{12,181134}}},
{"Incarnate","Vault of the Incarnates","Heroic",100000,nil,nil,{{11,183251},{13,183400},{9,183415},{2,183427},{13,183397},{14,183403},{5,183263},{6,183409},{17,183156},{8,183254},{8,183257},{5,183421},{4,183159},{3,183424},{13,181178},{10,183412},{10,183394},{12,183418},{12,183389}}},
{"Incarnate","Vault of the Incarnates","Mythic",100000,nil,nil,{{11,183252},{13,183401},{9,183416},{2,183428},{13,183398},{14,183404},{5,183264},{6,183410},{17,183157},{8,183255},{8,183258},{5,183422},{4,183160},{3,183425},{13,181178},{10,183413},{10,183395},{12,183419},{12,183390}}},

--Primal Elements
{"Raging Tempests","Primal Elements",nil,100000,"Purchased from Mythressa in Valdrakken","(Primal Storm Vendor)",{{7,181927},{16,181942},{10,181931},{15,181934},{13,181932},{11,181940},{12,181939},{8,181936},{1,181924},{8,181943},{5,181929},{17,181928},}},--Blue
{"Drakebreaker's","Primal Elements",nil,100000,"Purchased from Fieldmaster Emberath in Valdrakken","(PvP Vendor)",{{1,181901},{5,181906},{7,181904},{8,181920},{8,181913},{11,181917},{12,181916},{13,181909},{15,181911},{16,181919},{17,181905},{10,181908}}},--Bronze
{"Verdant Drakefire","Primal Elements",nil,100000,"World Drop","",{{16,167164},{7,183233},{1,183240},{17,183234},{5,183236},{13,183232},{15,183007},{8,183239},{8,182920},{11,183235},{12,183249},{10,182413}}},--Green
{"Primal Molten","Primal Elements",nil,100000,"Crafted","",{{1,168763},{17,168753},{5,168750},{15,168759},{16,182990},{11,168760},{12,168749},{8,168754},{16,182990}}},--Red

--Season 1
{"Crimson","Dragonflight Season 1","Gladiator",100000,nil,nil,{{7,184023},{1,184035},{17,184017},{5,184015},{13,184021},{15,184025},{8,184027},{16,184044},{8,184045},{11,184019},{12,184031},{10,184029}},nil,true,true},--Obisidian
{"Crimson","Dragonflight Season 1","Aspirant",100000,nil,nil,{{1,183885},{17,183892},{5,183886},{10,183891},{13,183889},{15,183890},{8,183893},{16,183900},{8,183887},{11,183888},{12,183894}},nil,true,true},--Obisidian
{"Crimson","Dragonflight Season 1","Elite",100000,nil,nil,{{5,184105},{12,184101},{12,184102},{10,184099},{6,184112},{4,184096},{17,184106},{2,184109},{3,184095},{9,168761},{13,184097},{11,184107},{13,184108},{10,184100},{8,184111},{5,184098},{14,184103},{8,184104},},nil,true,true},

--Mawy steel weapons
{"Treasure Seeker's","Explorer's",nil,100000,"","",{{1,182007},{4,181998},{8,182002},{11,180976},{12,182000},{14,182004},{15,181996},{7,183288},{13,183304},{6,183291},{5,183312},{5,182003},{8,181999},{14,182005},{13,182001},{10,181997}}},
{"Expedition","Explorer's",nil,100000,"","",{{1,180988},{2,180993},{4,180986},{5,180978},{5,181015},{6,180995},{7,180974},{8,180992},{11,181887},{11,181260},{12,180971},{13,180973},{14,180975},{15,180994},{14,180979},{13,180984},{10,181230},{8,180985},{5,181013},{1,180987},{1,180989},{10,180972}}},
{"Isle Trapper's","Explorer's",nil,100000,"","",{{1,181877},{2,181896},{4,181892},{6,181897},{7,181873},{8,181895},{11,181881},{12,181882},{13,181885},{14,181874},{15,181880},{5,181888},{1,181893},{1,181894},{5,181875},{10,180663},{13,181889},{14,181879},{8,181878},{10,181883}}},
{"Draconium","Explorer's",nil,100000,"","",{{2,181067},{4,181247},{8,181071},{11,181068},{12,181074},{13,181066},{15,181255},{5,168729},{1,168733},{6,168731},{14,168730},{5,168728},{8,181245},{10,183309},{13,181232},{14,180991},{10,181075}}},

--Draconic
{"Dragonflame","Draconic","Ruby",100000,"","",{{14,182247},{2,180836},{11,180766},{12,180860},{13,180834},{14,180761},{17,180835},{14,180779},{13,180651},{10,180824},{6,183902}}},
{"Dragonflame","Draconic","Onyx",100000,"","",{{14,182249},{2,183087},{17,182397},{14,183088},{14,182927},{13,183085},{13,183086},{10,183089},{11,183083},{11,183084},{12,183090},{12,181229},{6,183092}}},
{"Dragonflame","Draconic","Cobalt",100000,"","",{{14,182246},{2,182211},{14,182244},{14,182983},{17,182242},{13,181028},{13,182240},{10,182236},{11,182215},{12,182213},{6,183334}}},
{"Dragonflame","Draconic","Emerald",100000,"","",{{14,182248},{2,183352},{14,183354},{14,183357},{17,183353},{13,166026},{13,183350},{10,183355},{11,183349},{11,183348},{12,183356},{6,183358}}},
{"Dragonflame","Draconic","Amber",100000,"","",{{2,182210},{14,182245},{14,182243},{14,182398},{17,182241},{13,182237},{13,182239},{10,182235},{11,182216},{11,182214},{12,182212},{6,183903}}},
--Valdrakken Guard
{"Valdrakken Guard's","Valdrakken Guard",nil,100000,"","",{{11,182279},{14,182278},{2,182277},{12,182271},{5,182280}}},

----Primalist Tomorrow (don't think 2 weapons a set makes)
--{"","Blue Fire","",100000,"","",{{14,183370},{12,182357}}},
--{"","Yellow Fire","",100000,"","",{{14,183372},{12,182355}}},
--{"","Red Fire","",100000,"","",{{14,182368},{12,183374}}},
--{"","Yellow Fire 2","",100000,"","",{{14,183375},{12,183376}}},

--Titan-forged
--{"","Titan Green","",100000,"","",{{14,184012},{15,183890},{10,183891}}},--sword doesn't match, and 2 does not a set make
{"Stone Sentinel's","Titan-Forged",nil,100000,"","",{{7,179981},{10,179979},{12,181402},{14,181403},{15,181400}}},
{"Undertow","Titan-Forged",nil,100000,"","",{{7,180855},{10,180853},{12,180778},{15,180851}}},
{"Burnished","Titan-Forged",nil,100000,"","",{{10,182266},{12,182399},{14,182435},{15,182344},{7,182267}}},
{"Earthpact","Titan-Forged",nil,100000,"","",{{12,180026},{7,182410},{14,182268},{10,182425},{15,182269}}},

--Tuskarr
{"Navigator's","Tuskarr",nil,100000,"","",{{5,181389},{9,181393},{11,181391},{13,181395},{4,181397},{1,168757}}},
{"Reclaimed","Tuskarr",nil,100000,"","",{{5,182340},{1,182402},{4,183341},{11,182436}}},
{"Elder's","Tuskarr",nil,100000,"","",{{9,182406},{13,182377},{8,183339}}},--{5,183899},{1,183885} was replaced on live
{"Searing Tusk","Tuskarr",nil,100000,"","",{{5,180795},{9,180800},{11,180801},{13,180866},{1,180760}}},
{"Mystic's","Tuskarr",nil,100000,"","",{{9,182312},{5,182311},{13,182314},{4,182315},{1,182310}}},--{11,183897}, was replaced on live

----Gnoll, not enough to warrant being sets
--{"","gnollBrown","",100000,"","",{{9,167489},{12,182415},{12,183329},{8,180790}}},
--{"","gnollDark","",100000,"","",{{9,167492},{4,180791},{9,181257},{8,167484}}},
--{"","gnollGrey","",100000,"","",{{9,167491},{4,182417},{9,183327}}},
--{"","gnollGreen","",100000,"","",{{9,167490},}},
--{"","gnollLight","",100000,"","",{{9,167493},{4,183331},{8,183333}}},

--Centaur
{"Zephyr's","Centaur",nil,100000,"","",{{3,181069},{11,180815},{13,180817},{17,180809},{5,182339}}},
{"Nokuhd","Centaur",nil,100000,"","",{{3,181398},{11,179980},{11,181379},{13,179990},{17,179994},{5,179982}}},
{"Savage","Centaur",nil,100000,"","",{{3,180662},{11,180906}}},--,{11,183888},{13,183889},{17,183892},{5,183886} was replaced on live
{"Ancient Dancer's","Centaur",nil,100000,"","",{{11,182347},{11,182403},{17,182430}}},--,{5,183343} was missing on live
{"First Khanam","Centaur",nil,100000,"","",{{3,180633},{5,180808}}},

--Primal Molten
{"Primal Molten","Molten",nil,100000,"","",{{6,180878},{8,180889},{8,180871},{9,180883},{12,180882},{14,180818}}},--,{15,168752} (is the 2hander with the 1hander appearance)
{"Searing Wyvern","Molten",nil,100000,"","",{{6,181399},{8,179988},{8,181382},{9,179983},{12,179978},{14,179985}}},
{"Seamist","Molten",nil,100000,"","",{{6,183364},{9,168732},{12,183369},{8,182374},{14,182353}}},
{"Black Dragon Seared","Molten",nil,100000,"","",{{14,168756}}},--{6,183895},{9,184011},{12,183894},{8,183887} missing/replaced on live
{"Volcanic","Molten",nil,100000,"","",{{6,182343},{9,183368},{14,183367},{8,182352}}},

--Not really sets
--{"","Profession","",100000,"","",{{1,169618},{1,180921},{5,182969},{8,180935},{8,180936},{10,181014},{9,180938},{5,181774},{5,181773},{5,182169},{5,182255},{8,182254},{5,180917},{10,181449},{5,180916},{5,180915},{7,183302},{7,183303}}},
--Uniques {"","Rough Blade","",100000,"","",{{1,182359},{2,182973},{3,181246},{8,182970},{8,182971},{9,182365},{11,182963},{11,183330},{5,182346},{5,182342},{12,182976},{12,182977},{12,182978},{13,181831},{13,181832},{13,181830},{6,183054},{8,181697}}},
--Uniques {"","Ditch","",100000,"","",{{9,181277},{13,181830},{13,181832},{13,181831},{10,180926},{10,180928},{10,180930},{10,180932},{10,180940},{10,181698},{10,182250},{10,182251},{10,182252},{10,182253},{10,181699},{3,181246},{13,181285}}},
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
      --data.sources = db[i][7];
      data.sources = {};
      data.requiredFaction = db[i][8];
      data.isPvP = db[i][9];
      data.noLongerObtainable = db[i][10];
      data.favorite = false;
      data.expansionID = expansionID;
      
      data.setID = expansionID * 1000 + (#db - i);
      
      data.sources={}
      for j=1,#db[i][7] do
        local _,appID,_,icon = C_TransmogCollection.GetAppearanceSourceInfo(db[i][7][j][2])
        if appID then
          tinsert(data.sources, db[i][7][j]);
          local index = #data.sources;
          local s = C_TransmogCollection.GetAllAppearanceSources(appID);
          local isCollected = false;
          for i=1,#s do
            if C_TransmogCollection.GetSourceInfo(s[i]).isCollected then
              isCollected = true;
              break;
            end
          end
          
          data.icon = icon;
          
          if not data.sources[index][3] and db[i][5] then data.sources[index][3] = db[i][5]; end
          data.sources[index][5] = GetFormattedLabel(data.sources[index][3]);
          if not data.sources[index][4] and db[i][6] then data.sources[index][4] = db[i][6]; end
          data.sources[index][6] = GetFormattedLabel(data.sources[index][4]);
          
          data.sources[index][3] = isCollected;
          data.sources[index][4] = appID;
        end
      end
      
      if #data.sources > 0 then
        app.AddWeaponSetToTables(data);
      end
    end
  end
end

app.WeaponCallbacks[expansionID] = AddToCollection;