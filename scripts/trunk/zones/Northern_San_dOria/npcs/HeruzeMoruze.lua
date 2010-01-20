-- Auto-Generated Script from FFXImonV3 
-- By: Mana 
-- Windurst 2-3 code by ReaperX
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

-- Events:
-- 246 Windy 2-3, Sandy first path (Lion CS)
-- 22A If it's the consul you are seeking, she's inside
-- 241 A San d'Orian, are you?
-- 242 A Bastoker, are you?


----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
mission_status = player:getVar("mission_status");
if (player:getMissionStatus(2,5) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x246)) 
elseif (player:getNation() == 2) then
  player:startEvent(Event(0x22A)) 
elseif (player:getNation() == 0) then
  player:startEvent(Event(0x241)) 
else
	player:startEvent(Event(0x242));
end;
end; 

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x246) then
  player:setVar("mission_status",2);
end;
end;
