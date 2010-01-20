-----------------------------------
--	Author: Tenjou
-- 	Illu Bohjaa
-- 	Starts the repeatable quest "Creepy Crawlies."  TRADE IS UNFINISHED RIGHT NOW
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local crawler = player:getVar("creepyCrawlies");
if (crawler == 0) then
	--Offer quest
	local event0x14d = Event(0x14d);
	event0x14d:setParams(0,0x330,0x3aa,0x484);
	player:startEvent(event0x14d);
elseif (crawler == 1 or crawler == 2) then
	local event0x14e = Event(0x14e);
	event0x14e:setParams(0,0x330,0x3aa,0x484);
	player:startEvent(event0x14e);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local crawler = player:getVar("creepyCrawlies");
count = trade:getItemCount();
--print("count: " .. count);
local event0x14f = Event(0x14f);
item1 = trade:hasItemQty(0x330,3);
item2 = trade:hasItemQty(0x484,3);
if (crawler ~= 0 and count == 3 and item1 == true) then
	--silk trade,reward player and take items
	event0x14f:setParams(600,0x330,0x3aa,0x484);
	player:startEvent(event0x14f);
	player:removeItem(0x330,3);
	player:setVar("creepyCrawlies",2);
	--rewards
	player:addGil(GIL_RATE*600);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*600);
	player:addFame(2,WIN_FAME*15);
	--print("Windurst fame adjusted for" .. player:getName() .. " by 15 (Total: " .. player:getFame(2) .. ").");
	player:completeQuest(2,39);
	player:setTitle(116);
elseif (crawler ~= 0 and count == 3 and item2 == true) then
	--stone trade,reward player and take items
	event0x14f:setParams(600,0x330,0x3aa,0x484);
	player:startEvent(event0x14f);
	player:removeItem(0x484,3);
	player:setVar("creepyCrawlies",2);
	--rewards (assuming that the nonstackables are worth more fame)
	player:addGil(GIL_RATE*600);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*600);
	player:addFame(2,WIN_FAME*30);
	--print("Windurst fame adjusted for" .. player:getName() .. " by 30 (Total: " .. player:getFame(2) .. ").");
	player:completeQuest(2,39);
	player:setTitle(116);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x14d and option == 1) then
	--Accept quest "Creepy Crawlies."
	player:setVar("creepyCrawlies",1);
	player:addQuest(2,39);
end
end;