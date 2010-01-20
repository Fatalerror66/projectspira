-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Muckvix
-- 	Basic Chat Text, Magicite Mission
--  missing events:
--  0x4f says he heard about fickie's death
--  0x30 Aldo and Verena ask for help, he directs them towards the Eldieme Necropolis	
--  I couldn't find what these events are for.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getRank() == 4) and (mission_status ==3) and (player:getVar("fickie") == 0) then
  player:startEvent(Event(0x50))    
elseif (player:getRank() == 4) and (mission_status ==3) and (player:getVar("fickie") == 1) then
  player:startEvent(Event(0x51)) 
elseif (player:getRank() == 4) and (mission_status ==4) and (player:hasKeyItem(0x14) == 0) then
  player:startEvent(Event(0xB8))    
elseif (player:getRank() == 4) and (mission_status >=5) then
  player:startEvent(Event(0x0F)) 
else
  player:startEvent(Event(0x000F));
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
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x50) then
  player:setVar("fickie",1);
elseif (csid == 0xB8) then
  player:setVar("fickie",0);
  player:setVar("mission_status",5);
  player:addKeyItem(0x14);             -- Yagudo torch
  player:specialMessage(23,0x14);  
end;
end;