-----------------------------------
--	Author: Kegsay
-- 	Cavernous Maw - OMNOMNOM
-- 	Working 100%.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(0x038E) and player:getVar(maw_saruta)==1) then --have feather and maw
player:startEvent(Event(0x0388));
end; 
 
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid==904 and option==1) then
player:setPos(0,0,-164,29,0x5f);
end
--print("CSID:",csid);
--print("RESULT:",option);
end;