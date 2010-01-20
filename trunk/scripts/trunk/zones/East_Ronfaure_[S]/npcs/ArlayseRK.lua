-----------------------------------
--	Author: Arcanedemon
-- 	Campaign Guards
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event = Event(0x1c6)
event:setParams(0)
player:startEvent(Event(0x01C6));
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
--print("onEventSelection")
--print("CSID:",csid);
--print("RESULT:",option);
alliedNotes = 999999
if option == 0 then
	player:updateEvent(0,0,alliedNotes,0,0,0,0,0)
end
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("onEventFinish")
--print("CSID:",csid);
--print("RESULT:",option);
if option == 1 then
--print("Teleporting player to Southern San d'Oria [s]")
player:setPos(-86,1,-60,189,0x50)
end
end;