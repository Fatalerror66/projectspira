-----------------------------------
-- Area: Southern San d'Oria
--   
-- By: Mana
-- RDM AF3 quest code by ReaperX

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

if (player:getQuestStatus(0,86) == 1) and ((player:getVar("peace_for_the_spirit_status") == 3) or  (player:getVar("peace_for_the_spirit_status") == 4)) then
	player:startEvent(Event(0x48));
else
  player:startEvent(Event(0x3c))
end;

end;
 
 
--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);
if (csid == 0x48) then
  player:setVar("peace_for_the_spirit_status",4)
end;
end;

--------------------------------------
-- Self defined function that will be triggered on event 0x80073 finish.
--------------------------------------
function onEventXFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);

-- Used outside ALL loops to release NPC after event to prevent freezing. REQUIRED FUNCTION
--player:sendRelease()

end;

