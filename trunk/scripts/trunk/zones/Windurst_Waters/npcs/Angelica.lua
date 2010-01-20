-----------------------------------
--	Author: Tenjou
-- 	Angelica
-- 	Starts and ends quest "A Pose by Any Other Name".  Unable to implement at this time.  She uses events 0x56 to 0x66.
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
body = player:getEquip(6);
request = player:getVar("aPoseByAny-Timer");
pose = player:getVar("aPoseByAnyOtherName");
if (pose == 0 or pose == 3) then
	--Offer quest; different event for non-humes.
	race = player:getRace();
	if (race <= 2) then
		player:startEvent(Event(0x5b));
	else
		player:startEvent(Event(0x5a));
	end
elseif (pose == 1) then
	--Needed body piece, based on job.
	job = player:getMainJob();
	switch (job) : caseof {
	[1] = function (x) item = 0x3120; end, --Warrior
	[2] = function (x) item = 0x3138; end, --Monk
	[3] = function (x) item = 0x3140; end, --White Mage
	[4] = function (x) item = 0x3140; end, --Black Mage
	[5] = function (x) item = 0x3140; end, --Red Mage
	[6] = function (x) item = 0x3118; end, --Thief
	[7] = function (x) item = 0x3120; end, --Paladin
	[8] = function (x) item = 0x3120; end, --Dark Knight
	[9] = function (x) item = 0x3118; end, --Beastmaster
	[10] = function (x) item = 0x3138; end, --Bard
	[11] = function (x) item = 0x3118; end, --Ranger
	[12] = function (x) item = 0x3128; end, --Samurai
	[13] = function (x) item = 0x3128; end, --Ninja
	[14] = function (x) item = 0x3120; end, --Dragoon
	[15] = function (x) item = 0x3140; end, --Summoner
	[16] = function (x) item = 0x3138; end, --Blue Mage
	[17] = function (x) item = 0x3120; end, --Corsair
	[18] = function (x) item = 0x3140; end, --Puppetmaster
	[19] = function (x) item = 0x3118; end, --Dancer
	[20] = function (x) item = 0x3140; end, --Scholar
	default = function (x) end, }
	if (body == item) then
		--Text for players with no body piece on or already with the needed body piece.
		math.randomseed(os.time());
		text = math.random(); text = math.random(); text = math.random();
		if (text >= 0.75) then
			player:startEvent(Event(0x56));
		elseif (text >= 0.5) then
			player:startEvent(Event(0x57));
		elseif (text >= 0.25) then
			player:startEvent(Event(0x58));
		else
			player:startEvent(Event(0x59));
		end
	else
		--print("ITEM:",item);
		event0x5c = Event(0x5c);
		event0x5c:setParams(0,0,0,item);
		player:startEvent(event0x5c);
		player:setVar("aPoseByAny-NeededBody",item);
		player:addQuest(2,7);
	end
elseif (pose == 2) then
	item = player:getVar("aPoseByAny-NeededBody");
	request = player:getVar("aPoseByAny-Timer");
	if (request >= (os.time()-15)) then
		if (body == item) then
			--Quest succeed.
			player:startEvent(Event(0x60));
			--Rewards.
			player:addItem(0xce);
			player:addKeyItem(0x74);
			player:setVar("aPoseByAnyOtherName",4);
			player:addFame(2,WIN_FAME*60);
			player:completeQuest(2,7);
			player:setTitle(129);
		else
			--Text for players with no body piece on or already with the needed body piece.
			math.randomseed(os.time());
			text = math.random(); text = math.random(); text = math.random();
			if (text >= 0.75) then
				player:startEvent(Event(0x56));
			elseif (text >= 0.5) then
				player:startEvent(Event(0x57));
			elseif (text >= 0.25) then
				player:startEvent(Event(0x58));
			else
				player:startEvent(Event(0x59));
			end
		end
	else
		--Quest fail.
		player:startEvent(Event(0x5f));
		player:setVar("aPoseByAnyOtherName",3);
		player:setTitle(119);
	end
elseif (pose == 3) then
	--After failure - reoffer.
	player:startEvent(Event(0x66))
	player:setVar("aPoseByAnyOtherName",0);
elseif (pose == 4) then
	--After success.
	player:startEvent(Event(0x65));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;  
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if ((csid == 0x5b or csid == 0x5a) and option == 1) then
	--Accept quest "A Pose by Any Other Name."
	player:setVar("aPoseByAnyOtherName",1);
elseif (csid == 0x5c) then
	--Record time of request.  You apparantly have 10 seconds to get the body piece.
	player:setVar("aPoseByAny-Timer",os.time());
	player:setVar("aPoseByAnyOtherName",2);
end
end;