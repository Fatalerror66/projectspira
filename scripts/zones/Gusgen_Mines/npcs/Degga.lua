-----------------------------------
--	Author: Aurelias
-- 	Degga
-- 	Eco Warrior
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
bast = player:getVar("eco_warrior_bast") --Checks for right Eco Warrior
if(bast == 0) then
player:startEvent(Event(0x000C)); --Normal Text
else
if(bast == 1) then
player:startEvent(Event(0x000D)); -- Apply level cap (not implemented)
else
if(bast == 2) then
player:startEvent(Event(0x000F)); --Remove level cap (not implemented)
else
if(bast == 4) then
player:startEvent(Event(0x0010)); --Key Item obtained
else
end
end
end
end
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
bast = player:getVar("eco_warrior_bast")
--print("CSID:",csid);
--print("RESULT:",option);
if(csid == 0x000D and option == 1) then
player:setVar("eco_warrior_bast",2)
else
if(bast == 2) then
player:setVar("eco_warrior_bast",1)
end
end
end;