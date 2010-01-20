-----------------------------------
--	Author: Tenjou
-- 	Chocobo
-- 	One particular chocobo is involved in the quest "Chocobo's Wounds."
--  *08/10/2009 - Almendro
--     - Corrected some events which were wrong
--     - Added quest log functions
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
id = npc:getId();
if (id == 17776650) then
--The main chocobo.
	local wounds = player:getQuestStatus(3,4);      -- http://wiki.ffxiclopedia.org/wiki/Chocobo%27s_Wounds
	if (wounds == 0) then
		player:startEvent(Event(0x3e));
	elseif (wounds == 1) then
		--Check feeding status.
		local feed = player:getVar("chocobosWo-FeedingStatus");
		if (feed == 0) then
			player:startEvent(Event(0x67));
		elseif (feed == 1) then
			player:startEvent(Event(0x33));
		elseif (feed == 2) then
			player:startEvent(Event(0x34));
		elseif (feed == 3) then
			player:startEvent(Event(0x3b));
		elseif (feed == 4) then
			player:startEvent(Event(0x2e));
		elseif (feed == 5) then
			player:startEvent(Event(0x37));
		end
	elseif (wounds == 2) then
		player:startEvent(Event(0x37));
	end
elseif (id == 17776651) then
	player:startEvent(Event(0x38));
else
	player:startEvent(Event(0x36));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
id = npc:getId();
local wounds = player:getQuestStatus(3,4);
local feed = player:getVar("chocobosWo-FeedingStatus");
local vanadate = getVanaDay();
local vanamonth = getVanaMonth();
local vanayear = getVanaYear();
local lastdate = player:getVar("chocoboWo-FeedingDate");
local lastmonth = player:getVar("chocoboWo-FeedingMonth");
local lastyear = player:getVar("chocoboWo-FeedingYear");
count = trade:getItemCount();
item1 = trade:hasItemQty(0x216,1);
--print("DATE:",vanamonth,vanadate,vanayear); -- debug
if (id == 17776650) then
	if (wounds == 1 and count == 1 and item1 == true) then
	--Check feeding time and status.               	
	               hours = getVanaHour();
	             minutes = getVanaMinute();
   wholeVanaDayInMinutes = 1440;
 currentVanaDayInMinutes = hours*60 + minutes;
timeRemainingVanaMinutes = wholeVanaDayInMinutes - currentVanaDayInMinutes;
timeRemainingRealSeconds = math.floor(timeRemainingVanaMinutes*2.4); -- Remaining real seconds till 0:00 vanatime
	--print("timeRemainingVanaMinutes: ",timeRemainingVanaMinutes); -- debug	
	
		if (feed == 0) then
			player:startEvent(Event(0x39));
			player:setVar("chocobosWo-FeedingStatus",1);
			player:setVar("ChocoboWounds-nextFeedTime",os.time()+ timeRemainingRealSeconds);
			player:removeItem(0x216,1);
		elseif (feed == 1) then
			if (os.time() > player:getVar("ChocoboWounds-nextFeedTime")) then
				player:startEvent(Event(0x3a));
				player:setVar("chocobosWo-FeedingStatus",2);
				player:setVar("ChocoboWounds-nextFeedTime",os.time()+ timeRemainingRealSeconds);
				player:removeItem(0x216,1);
			else
				player:startEvent(Event(0x49));
			end
		elseif (feed == 2) then
			if (os.time() > player:getVar("ChocoboWounds-nextFeedTime")) then
				player:startEvent(Event(0x3b));
				player:setVar("chocobosWo-FeedingStatus",3);
				player:setVar("ChocoboWounds-nextFeedTime",os.time()+ timeRemainingRealSeconds);
				player:removeItem(0x216,1);
			else
				player:startEvent(Event(0x49));
			end
		elseif (feed == 3) then
			if (os.time() > player:getVar("ChocoboWounds-nextFeedTime")) then
				player:startEvent(Event(0x3c));
				player:setVar("chocobosWo-FeedingStatus",4);
				player:setVar("ChocoboWounds-nextFeedTime",os.time()+ timeRemainingRealSeconds);
				player:removeItem(0x216,1);
			else
				player:startEvent(Event(0x49));
			end
		elseif (feed == 4) then
			if (os.time() > player:getVar("ChocoboWounds-nextFeedTime")) then
				player:startEvent(Event(0x3f));
				player:setVar("chocobosWo-FeedingStatus",5);
				player:setVar("ChocoboWounds-nextFeedTime",os.time()+ timeRemainingRealSeconds);
				player:removeItem(0x216,1);
			else
				player:startEvent(Event(0x49));
			end
		elseif (feed == 5) then
			if (os.time() > player:getVar("ChocoboWounds-nextFeedTime")) then
				--Finally, complete quest!!
				player:startEvent(Event(0x40));
				
			else
				player:startEvent(Event(0x49));
			end
		end
	end
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x40) then
	player:setVar("chocobosWo-FeedingStatus",6);
	player:setVar("chocoboWo-FeedingDate",vanadate);
	player:setVar("chocoboWo-FeedingMonth",vanamonth);
	player:setVar("chocoboWo-FeedingYear",vanayear);
	player:removeItem(0x216,1);
	--Rewards!!
	player:addKeyItem(0x8a);
	player:specialMessage(ITEM_OBTAINED,0x8a);
	player:addFame(0,SAN_FAME*40); --Arbitrary amounts
	player:addFame(1,BAS_FAME*40);
	player:addFame(2,WIN_FAME*40);
	player:completeQuest(3,4);
end
end;