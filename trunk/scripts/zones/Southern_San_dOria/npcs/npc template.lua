
-----------------------------------
-- Area: Northern San d'Oria
--  NPC: 
-- 
-- By: Mana
-----------------------------------
-- Define Locals
-----------------------------------
-- Includes



-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end

end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)


end;
 
 
-----------------------------------
-- More to come...
-----------------------------------

