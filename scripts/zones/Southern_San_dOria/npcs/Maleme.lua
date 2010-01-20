-----------------------------------
--	Author: Tenjou
-- 	Maleme
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
event0x278 = Event(0x278);
event0x278:setParams(0,0,0,0,0,0,0,counter);
player:startEvent(event0x278);
end; 


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 -- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;