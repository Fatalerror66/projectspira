-----------------------------------
--	Author: Tenjou
-- 	Gennoue
-- 	Gives weather reports.  Completely accurate to the server :)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

--Pull relevant data.
birth = 1009810800;
timer = os.time();
counter = (timer - birth);
--print("COUNTER:",counter);
event0x1fd = Event(0x1fd);
event0x1fd:setParams(0,0,0,0,0,0,0,counter);
player:startEvent(event0x1fd);
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