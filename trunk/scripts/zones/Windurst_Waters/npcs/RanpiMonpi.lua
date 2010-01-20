-----------------------------------
--	Author: Tenjou
-- 	Ranpi-Monpi
-- 	Starts quests "A Crisis in the Making" and "In a Stew."  (incomplete)
--	Also involved in quest "The Dawn of Delectability." (complete)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local dawn = player:getVar("theDawnOfDelectability");
if (dawn == 1) then
	player:startEvent(Event(0x3d2));
	player:setVar("theDawnOfDelectability",2);
elseif (dawn == 2) then
	player:startEvent(Event(0x3d3));
elseif (dawn == 3) then
	player:startEvent(Event(0x3d4));
	player:addKeyItem(0x3ba);
	player:setVar("theDawnOfDelectability",4);
elseif (dawn == 4) then
	player:startEvent(Event(0x3d9));
elseif (dawn == 5) then
	--Quest complete!
	player:startEvent(Event(0x3d5));
	player:removeKeyItem(0x3bb);
	player:setVar("theDawnOfDelectability",6);
	--Rewards!!
	player:addItem(0x4a9d);
	player:addFame(2,50*WIN_FAME); --Arbitrary amount
	
else
	player:startEvent(Event(0xf9));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local dawn = player:getVar("theDawnOfDelectability");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x1561,1);
item2 = trade:hasItemQty(0x161d,1);
item3 = trade:hasItemQty(0x161e,1);
item4 = trade:hasItemQty(0x161c,1);
if (dawn == 2 and count == 4 and item1 and item2 and item3 and item4) then
	trade:isComplete();
	player:startEvent(Event(0x3d7));
	player:setVar("theDawnOfDelectability",3);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;