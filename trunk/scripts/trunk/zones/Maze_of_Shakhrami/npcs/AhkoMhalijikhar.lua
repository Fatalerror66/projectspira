-----------------------------------
--	Author: Aurelias
-- 	Ahko Mhalijikhari
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
wind = player:getVar("eco_warrior_wind") --Checks for right Eco Warrior
if(wind == 0) then
player:startEvent(Event(0x003D)); --Normal Text
else
if(wind == 1) then
player:startEvent(Event(0x003E)); -- Apply level cap (not implemented)
else
if(wind == 2) then
player:startEvent(Event(0x0040)); --Remove level cap (not implemented)
else
if(wind == 4) then
player:startEvent(Event(0x0041)); --Key Item obtained
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
wind = player:getVar("eco_warrior_wind")
--print("CSID:",csid);
--print("RESULT:",option);
if(csid == 0x003E and option == 1) then
player:setVar("eco_warrior_wind",2)
else
if(wind == 2) then
player:setVar("eco_warrior_wind",1)
end
end
end;