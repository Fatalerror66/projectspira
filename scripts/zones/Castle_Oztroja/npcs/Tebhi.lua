-----------------------------------
--	Author: Almendro
-- 	Tebhi
-- 	Quest involved: "Scattered into Shadow" http://wiki.ffxiclopedia.org/wiki/Scattered_into_Shadow
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
end; 
 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	BeastCollar = 0x3341;
	count = trade:getItemCount();
    BeastCollar1 = trade:hasItemQty(BeastCollar,1); --Item ID and amount; add more as needed.
	gil = trade:getGil();
	  
if (count == 1 and BeastCollar1 and gil == 0 and player:getVar("ScatteredintoShadow") == 2) then 
	trade:isComplete();
	player:specialMessage(991,BeastCollar);
	-- depopNPC(17396140)  for 15 minutes
	player:setVar("ScatteredintoShadow",3);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;