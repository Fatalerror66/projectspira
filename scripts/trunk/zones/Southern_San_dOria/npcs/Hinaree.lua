-----------------------------------
--	Author: JesseJames, ReaperX
-- 	Hinaree
-- 	Basic Text Scripted, Quest text needed 
--  CoP Mission 3-3A3 "Louverance"
--  
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)




-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

cop_status = player:getMissionStatus(6,17);          													-- on "Louverance"?

--print("cop_status = ",cop_status);
if (cop_status == 1) then
  player:startEvent(Event(0x17));
elseif (cop_status == 2) then                                                
  player:startEvent(Event(0x18));
else
  player:startEvent(Event(0x1FA));
end
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
if (csid == 0x17) then
  player:completeMission(6,17);     -- CoP 3.3A3 "Louverance" complete
  player:completeMission(6,14);     -- CoP 3.3A  "Emerald Waters" complete
  player:setVar("EmeraldWaters",1); -- workaround, see Cid.lua 
end
end;