-----------------------------------
--	Author: Tenjou
-- 	Tapoh Lihzeh
-- 	Offers repeatable quest "Paying Lip Service."  Also involved in quest "Chocobilious."
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
local service = player:getVar("payingLipService");
if (service == 0) then
	local event0x1dd = Event(0x1dd);
	event0x1dd:setParams(0,0x390,0x3f8,150,200,0x390,0x3f8);
	player:startEvent(event0x1dd);
elseif (service == 1) then
	local event0x1de = Event(0x1de);
	event0x1de:setParams(0,0x390,0x3f8,150,200);
	player:startEvent(event0x1de);
elseif (service == 2) then
	local event0x1e0 = Event(0x1e0);
	event0x1e0:setParams(0,0x390,0x3f8);
	player:startEvent(event0x1e0);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local service = player:getVar("payingLipService");
local event0x1df = Event(0x1df);
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x390,3);
item2 = trade:hasItemQty(0x3f8,2);
if (service ~= 0 and count == 3 and item1) then
	--Accept trade,give reward and fame--
	player:removeItem(0x390,3);
	event0x1df:setParams(0,0x390,0x3f8);
	player:startEvent(event0x1df);
	player:setVar("payingLipService",2);
	player:addGil(GIL_RATE*150);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*150);
	--ARBITRARY FAME AMOUNT
	player:addFame(2,WIN_FAME*10);
	--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
	player:completeQuest(2,60);
	player:setTitle(140);
elseif (service ~= 0 and count == 2 and item2) then
	--Accept trade,give reward and fame--
	player:removeItem(0x3f8,2);
	event0x1df:setParams(0,0x390,0x3f8);
	player:startEvent(event0x1df);
	player:setVar("payingLipService",2);
	player:addGil(GIL_RATE*200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
	--ARBITRARY FAME AMOUNT
	player:addFame(2,WIN_FAME*15);
	--print("Windurst fame adjusted for",player:getName(),"by 15 (Total:",player:getFame(2),").");
	player:completeQuest(2,60);
	player:setTitle(140);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x1dd and option == 1) then
	--Accept quest "Paying Lip Service."
	player:setVar("payingLipService",1);
	player:addQuest(2,60);
end
end;