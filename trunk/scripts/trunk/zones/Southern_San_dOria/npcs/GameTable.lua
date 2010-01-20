-----------------------------------
-- Area: Southern San d'Oria
--   
-- By: Mana

-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
 

end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)

player:startEvent(Event(0x80369))
-- event with params
 

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


-- Used outside ALL loops to release NPC after event to prevent freezing. REQUIRED FUNCTION
--player:sendRelease()

end;

