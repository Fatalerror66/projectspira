-----------------------------------
--	Author: atkb, ReaperX
-- 	Trail Markings
-- 	Teleports qualified players to Dynamis - Xarcabard.
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
require("scripts/zones/Xarcabard/TextIDs");

VialOfShroudedSand = 0x1EC;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

------ Dynamis CS

-- 0x0D: opening Raogrimm CS for Dynamis once you reach level 65 and rank 6.
-- 0x0F: The time and destination for your foray into Dynamis will now be recorded on your {}. Destination: Dynamis-{}
-- 0x10: You will now be warped to Dynamis-{}
-- 0x11: Dynamis - The Shrouded Land (pt.1)
-- 0x12: Dynamis - The Shrouded Land (pt.1)
-- 0x15: Dynamis - The Shrouded Land (pt.2) - Southern San d'Oria
-- 0x16: Dynamis - The Shrouded Land (pt.2) - Bastok Mines
-- 0x17: Dynamis - The Shrouded Land (pt.2) - Windurst Walls
-- 0x18: Dynamis - The Shrouded Land (pt.2) - Ru'Lude Gardens
-- 0x19: Dynamis - The Shrouded Land - Beaucedine Glacier
-- 0x1A: Dynamis - The Shrouded Land (pt.2) - Xarcabard
-- 0x1B: Dynamis Interloper - Southern San d'Oria CS
-- 0x1C: Dynamis Interloper - Bastok Mines CS
-- 0x1D: Dynamis Interloper - Windurst Walls CS
-- 0x1E: Dynamis Interloper - Jeuno CS
-- 0x1F: Dynamis Interloper - Beaucedine Glacier CS
-- 0x20: Dynamis-Xarcabard Interloper CS

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("Dynamis_Status") == 1) then
  player:startEvent(Event(0x11)); -- cs with Cornelia
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
    player:startEvent(Event(0xf));
  elseif (item1 == 0x108d) then
    player:setPos(561.935,0.000,-279.219,137,0x87);
    -- player:startEvent(Event(0x0010));
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
if (csid == 0x11) then
	player:addKeyItem(VialOfShroudedSand);
	player:specialMessage(KEYITEM_OBTAINED, VialOfShroudedSand);
	player:setVar("Dynamis_Status",2);
end;
end;
-- Timeless Hourglass: 271b
-- Perpetual Hourglass: 271c