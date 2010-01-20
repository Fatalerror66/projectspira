-- Auto-Generated Script from FFXImonV3 
-- By: Mana 
----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	end 
end; 
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 

cop_status = player:getMissionStatus(6,15);          					-- are we on "Vicissitudes"?
vicissitudes_status = player:getVar("Vicissitudes"); 					-- 1 if we got Arnau CS
if (cop_status == 1) and (vicissitudes_status == 1) then      -- redundant double check, vicissitudes_status == 1 suffices
  player:startEvent(Event(0x26));
else
  player:startEvent(Event(610)) 
end
end; 

 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x26) then
   player:completeMission(6,15);    -- CoP 3.3-A1 complete
   player:currentMission(6,16);
   player:setVar("Vicissitudes",0); -- cleanup
end;
end;