-----------------------------------
--	Author: atkb, ReaperX
-- 	Trail Markings
-- 	Teleports qualified players to Dynamis - Jeuno.
-----------------------------------

VialOfShroudedSand = 0x1EC;

require("scripts/globals/settings");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
require("scripts/zones/Rulude_Gardens/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("Dynamis_Status") == 1) then
  player:startEvent(Event(0x2720)); -- cs with Cornelia
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
    player:startEvent(Event(0x271b));
  elseif (item1 == 0x108d) then
    player:setPos(48.903,10.002,-73.181,192,0xbc);
    -- player:startEvent(Event(0x271c));
	else
	end
end
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
 if (csid == 0x2720) then
	player:addKeyItem(VialOfShroudedSand);
	player:specialMessage(KEYITEM_OBTAINED, VialOfShroudedSand);
	player:setVar("Dynamis_Status",2);
end;
end;