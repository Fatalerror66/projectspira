-----------------------------------
--	Author: Tenjou
-- 	Laughing Bison
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
	event0x14d = Event(0x14d);
	timer = 1152 - ((os.time() - 1009810584)%1152);
	event0x14d:setParams(timer);
	player:startEvent(event0x14d);
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