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
if (player:hasKeyItem(0x038E) and player:getVar(maw_saruta)==1) then --feather and maw
player:startEvent(Event(0x0065));
end;
if (player:hasKeyItem(0x038E) and player:getVar(maw_saruta)==0) then --Pure white feather
player:startEvent(Event(0x0064)); 
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
if (csid==100 and option==1) then --dont have maw, accepted. 
player:setVar(maw_saruta,1);
--print("no maw, accepted");
player:setPos(0,0,-164,29,0x73);
end;
if (csid==101 and option==1) then --Have maw, accepted.
player:setPos(0,0,-164,29,0x73);
--print("have maw, accepted");
end;
--print("CSID:",csid);
--print("RESULT:",option);
end;