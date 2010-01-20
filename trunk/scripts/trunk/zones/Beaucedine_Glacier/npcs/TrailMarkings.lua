-----------------------------------
--	Author: atkb, ReaperX
-- 	Trail Markings
-- 	Teleports qualified players to Dynamis - Beaucedine.
-----------------------------------


require("scripts/globals/settings");
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
require("scripts/zones/Beaucedine_Glacier/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("Dynamis_Status") == 1) then
  player:startEvent(Event(0x78)); -- CS with Cornelia
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
    player:startEvent(Event(0x0076));
  elseif (item1 == 0x108d) then
    player:setPos(-385.402,-40.086,-420.818,254,0x86);
    -- player:startEvent(Event(0x0077));
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
if (csid == 0x78) then
	player:addKeyItem(VialOfShroudedSand);
	player:specialMessage(KEYITEM_OBTAINED, VialOfShroudedSand);
	player:setVar("Dynamis_Status",2);
end;
end;

-- Timeless Hourglass: 271b
-- Perpetual Hourglass: 271c