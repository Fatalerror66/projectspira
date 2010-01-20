-----------------------------------
--	Author: ReaperX
-- 	Leypoint - trade Lightning Band to get Olduum Ring. COR AF quest CS works but
--  quest variables need to be created and updated.

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

-- event 0x0002 is for the initial completion of the quest - player gets zapped by lightning and "dies" in CS
-- event 0x0003 is for repeat completition - player hides at a safe distance.
-- event 0x01FC is for the COR AF quest "Navigating the Unfriendly Seas" (reward: Corsair's Culottes)
 
------ Olduum ring quest -----------------------
if (trade:hasItemQty(2217,1)) then  -- player traded Lightning Band
  quest_status = player:getVar("OLDUUM_QUEST_STATUS");
  if (quest_status == 2) then
    player:startEvent(Event(0x0002)); 
  elseif (quest_status ==4) then
    player:startEvent(Event(0x0003)); 
	end
	trade:isComplete();
end;
------ end of Olduum ring quest ------------------

------ COR AF quest -----------------------
if (trade:hasItemQty(2341,1)) then  -- player traded Hydrogauge
 
  -- to do: update quest status  
  player:startEvent(Event(0x01FC)); 
  trade:isComplete();
end

------ end of COR AF quest --------------------

end;  
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 2) or (csid == 3) then
  player:addItem(15769) -- player receives olduum ring
  player:specialMessage(20,15769);   
end;
end;
