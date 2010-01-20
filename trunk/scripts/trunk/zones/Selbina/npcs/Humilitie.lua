-----------------------------------
--	Author: Tenjou
-- 	Humilitie
-- 	Reports the time remaining before boat arrival.  The boat comes every 1152 seconds.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	-----------------------------------
	-- Dialogues,cutscenes,etc. go below.
	-----------------------------------
	event0xe7 = Event(0xe7);
	timer = 1152 - ((os.time() - 1009810584)%1152);
	event0xe7:setParams(timer);
	player:startEvent(event0xe7);
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
end;