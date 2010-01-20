-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Trail Markings
-- 	Teleports qualified players to Dynamis - Windurst.
-----------------------------------

VialOfShroudedSand = 0x1EC;

require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("Dynamis_Status") == 1) then
  player:startEvent(Event(0x1c7)); -- cs with Cornelia
end
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x108c,1);
item2 = trade:hasItemQty(0x108d,1);
if (count == 1 and item1 == true) then
    player:startEvent(Event(0x01c3));
elseif (count == 1 and item2 == true) then
    player:setPos(-227.355,-0.250,-120.362,254,0xbb);
    -- player:startEvent(Event(0x01c4));
end
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x1c7) then
	player:addKeyItem(VialOfShroudedSand);
	player:specialMessage(KEYITEM_OBTAINED, VialOfShroudedSand);
	player:setVar("Dynamis_Status",2);
end;
end;