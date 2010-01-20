-----------------------------------
--	Author: Aurelias
-- 	Rojaireaut
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
sand = player:getVar("eco_warrior_sand") --Checks for right Eco Warrior
if(sand == 0) then
player:startEvent(Event(0x0032)); --Normal Text
else
if(sand == 1) then
player:startEvent(Event(0x0033)); -- Apply level cap (not implemented)
else
if(sand == 2) then
player:startEvent(Event(0x0035)); --Remove level cap (not implemented)
else
if(sand == 4) then
player:startEvent(Event(0x0036)); --Key Item obtained
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
sand = player:getVar("eco_warrior_sand")
--print("CSID:",csid);
--print("RESULT:",option);
if(csid == 0x0033 and option == 1) then
player:setVar("eco_warrior_sand",2)
else
if(sand == 2) then
player:setVar("eco_warrior_sand",1)
end
end
end;