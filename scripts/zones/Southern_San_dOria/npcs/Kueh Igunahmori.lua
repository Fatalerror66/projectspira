-----------------------------------
-- Area: Southern San d'Oria
-- By: Mana
-----------------------------------

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
 -- Variables

time = getVanaHour();

if time > 2 and time < 18 then -- only show NPC text during business hours
player:showText(npc,0x5e5)
end

player:sendGuild(0xe601, 1, 2, 18);
end;
 
 
-----------------------------------
-- More to come...
-----------------------------------

