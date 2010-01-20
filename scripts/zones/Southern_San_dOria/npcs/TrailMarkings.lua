-----------------------------------
--	Author: atkb, ReaperX
-- 	Trail Markings
-- 	Teleports qualified players to Dynamis - San d'Oria.
-----------------------------------

VialOfShroudedSand = 0x1EC;

require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

if (player:getVar("Dynamis_Status") == 1) then
  player:startEvent(Event(0x2AE)); -- CS with Cornelia
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
--DELETE THE BELOW IF UNUSED--
count = trade:getItemCount();
--print("count: " .. count);
itemid = {};
amount = {};
for i = 1,count do
itemid[i] = trade:getItem(i);
amount[i] = trade:getItemQty(i);
	if (item1 == 0x108c) then
    player:startEvent(Event(0x00b8));
  elseif (item1 == 0x108d) then
    player:setPos(161.838,-2.000,161.673,93,0xb9);
    -- player:startEvent(Event(0x02ad));
	else
	end
end
--DELETE THE ABOVE IF UNUSED--
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x2AE) then
	player:addKeyItem(VialOfShroudedSand);
	player:specialMessage(KEYITEM_OBTAINED, VialOfShroudedSand);
	player:setVar("Dynamis_Status",2);
end;
end;