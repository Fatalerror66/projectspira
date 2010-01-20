-----------------------------------
--	Author: atkb, ReaperX
-- 	Trail Markings
-- 	Teleports qualified players to Dynamis - Bastok.
-----------------------------------

VialOfShroudedSand = 0x1EC;

require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("Dynamis_Status") == 1) then
  player:startEvent(Event(0xCB)); -- cs with Cornelia
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
    player:startEvent(Event(0x00c8));
  elseif (item1 == 0x108d) then
    player:setPos(116.482,0.994,-72.121,128,0xba);
    -- player:startEvent(Event(0x00c9));
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
 if (csid == 0xCB) then
	player:addKeyItem(VialOfShroudedSand);
	player:specialMessage(KEYITEM_OBTAINED, VialOfShroudedSand);
	player:setVar("Dynamis_Status",2);
end;
end;
-- Timeless Hourglass: 271b
-- Perpetual Hourglass: 271c