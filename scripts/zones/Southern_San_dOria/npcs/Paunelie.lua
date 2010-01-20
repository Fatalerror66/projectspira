-----------------------------------
-- Area: Southern San d'Oria
-- Linkshell Guild Merchant 
-- By: Mana

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

--if time > 5 and time < 21 then -- only show NPC text during business hours
--player:showText(npc,0x741)
--end
-- unknown text event for player that has the word LINKSHELL in green...
player:sendGuild(0xe601, 1, 12, 22);

end;
--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);

end;
--------------------------------------
-- Self defined function that will be triggered on event 0x80073 finish.
--------------------------------------
function onEventXFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);

end;

