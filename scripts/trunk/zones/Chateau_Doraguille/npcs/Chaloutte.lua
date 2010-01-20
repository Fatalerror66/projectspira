-----------------------------------
--	Author: JesseJames, ReaperX
-- 	Chaloutte
-- 	NPC Past Event Watcher (partial script)
-----------------------------------

cost = 10; -- cost of replaying an event
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event = Event(0x22D);
event:setParams(0,0,0,0,0,0,cost,player:getCurrGil());
player:startEvent(event);
end; 
 

function onEventSelection(player,csid,option)
--print("onEventSelection")
--print("onEventSelection - CSID:",csid);         
--print("onEventSelection - option ===",option); 
player:updateEvent(player:getCurrGil());
end


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

cs = -1;
if (option == 3) then
	cs = 0x22C;
elseif (option == 4) then
	cs = 0x22C;
end;
if (cs >= 0) then
  player:startEvent(Event(cs));
end;
end;