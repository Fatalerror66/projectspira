-- CoP mission 3.3A and castle zone-in code by Reaperx
-- cosmetic bug: when you zone into the castle, the animation where you come
-- to a stop first (that plays for usual zone events) is not shown.

require("/scripts/globals/common");
require("/scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
require("/scripts/globals/fishing")
textIdOffset = 836 -- fishing text block

WarlocksChapeau = 12513;

---------------------------------
---  onFishCancel
---------------------------------

function onFishCancel(player,resultType,loc0x08)
	if loc0x08 == 0xc9 then -- cancel fishing before fighting starts
		--print("You did not catch anything")
		player:specialMessage(textIdOffset + 4)
	elseif loc0x08 == 0xc8 then -- cancel fishing after fighting starts
		--print("You give up and reset your line")
		player:specialMessage(textIdOffset + 36)
	elseif loc0x08 == 0 and resultType == 4 then
		player:specialMessage(textIdOffset + 1) -- no rod equipped
	elseif loc0x08 == 0 and resultType == 5 then
		player:specialMessage(textIdOffset + 2) -- no bait equipped
	elseif loc0x08 == 0x06 then -- cancel fishing after taking too long to reel in fish
		--print("You lost your catch")
		player:specialMessage(textIdOffset + 9)
	end
end;
---------------------------------
---  onFishBite
---------------------------------

function onFishBite(player)
	rod = player:getEquip(3)
	bait = player:getEquip(4)
	zone = player:getZone()
	fishingSkill = player:getSkill(48)
	--print("Fishing Skill:",fishingskill)
	fishId = 0
	itemId = 0
	catchId = 0
	qty = 1
	level = 0
	size = 0
	stamina = 0
	take = 0x10
	give = 0x10
	time = 0x19
	music = 0
	length = 0
	weight = 0
	tricolorCarp = 4426
	moatCarp = 4401
	goldCarp = 4427
	crayfish = 4472
	localFishPool = {4,crayfish,moatcarp,tricolorcarp,goldcarp}
	globalFishPool = getFishByBait(bait,zone)
	n = 1
	fp = 0
	fishPool = {}
	fishPool[1] = 0
	while n < localFishPool[1] do
		n = n+1
		i = 1
		while i < globalFishPool[1] do
			i = i+1
			if localFishPool[n] == globalFishPool[i] then
				fp = fp+1
				fishPool[(fp+1)] = localFishPool[n]
			end
		end
	end
	fishPool[1] = fp
	--print("fp",fp)
	
	if fp == 0 then
		--print("No fish defined for this bait in this zone.")
	else
		randomNum = math.random(1,fp)
		fishId = fishPool[randomNum + 1]
		--print("Something caught the hook!")
	end
	
	if fishId == crayfish then
		level = (math.random(3,6))
		stamina = (level * 1.5)
	elseif fishId == moatcarp then
		level = (math.random(6,11))
		stamina = (level * 1.5)
	elseif fishId == tricolorcarp then
		level = (math.random(11,21))
		stamina = (level * 1.1)
	elseif fishId == goldcarp then
		level = (math.random(30,40))
		stamina = (level * 1.5)
	end
	
	if fishId > 0 then
		catchId = fishId
	elseif itemId > 0 then
		catchId = itemId
	elseif fishId == 0 and itemId == 0 then
		--caught mob or nothing
	end
	player:sendFishingInfo(catchId,qty,level,size,stamina,take,give,time,music,length,weight)
	
	if catchId > 0 then
			-- 08 something caught the hook! 
			-- 50 something caught the hook!!!
			-- 40 not sure how long you can keep it on the line
			-- 41 good feeling
			-- 42 bad feeling
			-- 43 terrible feeling - special/monster
			-- 44 don't know if you have enough skill
			-- 45 fairly sure you don't have enough skill
			-- 46 possitive you don't have enough skill
		if music == 0 then
			player:specialMessage(textIdOffset + 8) 
			player:specialMessage(textIdOffset + 41) 
		else
			player:specialMessage(textIdOffset + 50) 
			player:specialMessage(textIdOffset + 43)
		end
	else
		--print("You did not catch anything")
		player:specialMessage(textIdOffset + 4)
	end
end;
---------------------------------
---  onFishFinish
---------------------------------

function onFishFinish(player,resultId,resultQty,resultType,stamina)
	if resultType == 0 then
		--print("You caught a fish!")
		player:specialMessage(textIdOffset + 14,resultId,resultQty)
	elseif resultType == 6 then
		--print("You regretfully release the fish")
		player:specialMessage(textIdOffset + 10,resultId,resultQty)
	elseif resultType == 3 then
		--print("Line broke")
		player:specialMessage(textIdOffset + 6)
	elseif resultType == 4 then
		--print("Rod broke")
		player:specialMessage(textIdOffset + 7)
	end
end;
---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
-- reset variables that stop the server from spamming the special message
if player:getQuestStatus(0,16) == 1 then
	player:setVar("coulleneMess",0)
	player:setVar("guilberdrierMess",0)
	player:setVar("boncortMess",0)
	player:setVar("capiriaMess",0)
	player:setVar("villionMess",0)
end
cs = -1;

cop_status1 = player:getMissionStatus(6,13);                               -- on CoP Mission 3.3 "The Road Forks"?
cop_status2 = player:getMissionStatus(6,14);                               -- on CoP Mission 3.3-A "Emerald Waters"?

if (cop_status1 == 1) and (cop_status2 == 0) then
  cs = 0x0e;																															 -- Ulmia CS that opens 3.3-A
  player:currentMission(6,14);                                             -- 3.3-A "Emerald Waters"
  player:currentMission(6,15);																						 -- 3.3-A1 "Vicissitudes"

elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 6) then
	cs = 0x31;

elseif (player:getMissionStatus(0,20) == 2) and (player:getMissionStatus(0,21) == 0) and (player:getVar("mission_status") == 5) then
  if (os.time()-player:getVar("COMING_OF_AGE_CEREMONY") > WAIT_TIME_FOR_COMING_OF_AGE) then
  	cs = 0x10;
  	--print("Coming of Age Ceremony starting at the Cathedral.");
  	player:setVar("may_watch_coming_of_age_trion",0);
    player:setVar("may_watch_coming_of_age_pieuje",0);
  	player:setVar("mission_status",0);
  	player:setVar("COMING_OF_AGE_CEREMONY",0)
  end;

elseif (player:getMissionStatus(0,23) == 1) and (player:getVar("mission_status") == 1) then
  cs = 0x01;
  player:setVar("mission_status",2);  -- Rites of Succession Ceremony

elseif (player:getMissionStatus(0,23) == 1) and (player:getVar("mission_status") == 5) then
	cs = 0x0;
	player:setVar("mission_status",6);  -- return from Fe'Yin
end;

--- New Character Cut-Scene---
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(0,0,-11,191);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
   cs = 0x217;
   player:setPos(0,0,-11,191);
   player:setVar("firstLogin",-1);
   player:setHomePoint();
   --print("Firstlogin now set to -1");
end
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
	currZone = 0xe7;
--	coullene
	POS1 = {146.221,0,127.891}
	--print("Initializing Northern San d'Oria");
	registerRegion(currZone,1,(POS1[1] - 4),(POS1[1] + 4),(POS1[2] - 4),(POS1[2] + 4),(POS1[3] - 4),(POS1[3] + 4));
--	guilberdrier
	POS2 = {-159.2,12,254}
	registerRegion(currZone,2,(POS2[1] - 4),(POS2[1] + 4),(POS2[2] - 4),(POS2[2] + 4),(POS2[3] - 4),(POS2[3] + 4));
--	boncort
	POS3 = {-155.6,-5.199,49.382}
	registerRegion(currZone,3,(POS3[1] - 4),(POS3[1] + 4),(POS3[2] - 4),(POS3[2] + 4),(POS3[3] - 4),(POS3[3] + 4));
--	capiria
	POS4 = {-127.495,0,130.372}
	registerRegion(currZone,4,(POS4[1] - 4),(POS4[1] + 4),(POS4[2] - 4),(POS4[2] + 4),(POS4[3] - 4),(POS4[3] + 4));
--	villion
	POS5 = {-157.7,4,264}
	registerRegion(currZone,5,(POS5[1] - 4),(POS5[1] + 4),(POS5[2] - 4),(POS5[2] + 4),(POS5[3] - 4),(POS5[3] + 4));
-- castle entrance
	registerRegion(currZone,6, -6.3, 6.3, -3, -1, 110, 131); 
end;
 
 
function onRegionEnter(player, regionID)
-- debug print messages, can be deleted once this script is confirmed working
--print("Entered defined region >> ",player:getName())
--print("Region ID: ",regionID)

if player:getQuestStatus(0,16) == 1 and player:hasItem(532) == 1 then

-- Quest related variables, disables message if you have already traded the item
	coullene = player:getVar("coullene")
	guilberdrier = player:getVar("guilberdrier")
	boncort = player:getVar("boncort")
	capiria = player:getVar("capiria")
	villion = player:getVar("villion")
-- Zone related variables, checks to see if you have already heard the message at least once
	coulleneMess = player:getVar("coulleneMess")
	guilberdrierMess = player:getVar("guilberdrierMess")
	boncortMess = player:getVar("boncortMess")
	capiriaMess = player:getVar("capiriaMess")
	villionMess = player:getVar("villionMess")


	switch (regionID): caseof {
	---------------------------------
	[1] = function (x)  -- coullene
	---------------------------------
		if coulleneMess == 0 and coullene == 0 then
			--print("coullene")
			player:setVar("coulleneMess",1)
			player:specialMessage(3600);
		end
	end,
	---------------------------------
	[2] = function (x)  -- guilberdrier
	---------------------------------
		if guilberdrierMess == 0 and guilberdrier == 0 then
			--print("guilberdrier")
			player:setVar("guilberdrierMess",1)
			player:specialMessage(3601);
		end
	end,
	---------------------------------
	[3] = function (x)  -- boncort
	---------------------------------
		if boncortMess == 0 and boncort == 0 then
			--print("boncort")
			player:setVar("boncortMess",1)
			player:specialMessage(3602);
		end
	end,
	---------------------------------
	[4] = function (x)  -- capiria
	---------------------------------
		if capiriaMess == 0 and capiria == 0 then
			--print("capiria")
			player:setVar("capiriaMess",1)
			player:specialMessage(3603);
		end
	end,
	---------------------------------
	[5] = function (x)  -- villion
	---------------------------------
		if villionMess == 0 and villion == 0 then
			--print("villion")
			player:setVar("villionMess",1)
			player:specialMessage(3604);
		end
	end,
	default = function (x) end,}
	end;

if (regionID == 6) then  -- Castle Access
	has_castle_access = 0;
	mission_status = player:getVar("mission_status");
	if (player:getNation() == 0) and (player:getRank()>=2) then
	  has_castle_access =1;
	elseif (((player:getMissionStatus(1,5) > 0) or (player:getMissionStatus(1,6) > 0)) and (mission_status >= 3)) or ((player:getMissionStatus(1,8) > 0) and (mission_status > 15)) or (player:getRank() >=3) then
	  has_castle_access =1;
	elseif ((player:getMissionStatus(2,6) > 0) and (mission_status >= 3)) or ((player:getMissionStatus(2,8) > 0) and (mission_status > 15)) or (player:getRank() >=3) then
	  has_castle_access =1;
	end
	if (has_castle_access == 1) then
		player:startEvent(Event(0x0239));
		player:setPos(0,0,-13,192,0xe9); -- zone into castle
	else
	  player:startEvent(Event(0x0238)) -- can't go in!
  end
end;
end

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("Option:",option);

if(csid == 0x217) then
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
elseif (csid == 0x31) then
	player:completeQuest(0,86);
	player:addItem(WarlocksChapeau);
	player:specialMessage(ITEM_OBTAINED,WarlocksChapeau);
	player:addFame(0,SAN_FAME*AF3_FAME);
	player:setVar("peace_for_the_spirit_status",0);
	player:setTitle(220);
end;
end;
 