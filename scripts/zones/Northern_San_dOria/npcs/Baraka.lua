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

-- events

-- 0245 Bastok 2-3 CS with Lion
-- 021B "Welcome to the Consulate of Bastok."
-- 0243 San d'Orian Citizen
-- 0244 Windurstian Citizen


----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
emissary_status = player:getMissionStatus(1,5);      -- The Emissary
mission_status = player:getVar("mission_status");

nation = player:getNation();

if (emissary_status == 1) and (mission_status == 1) then
  player:startEvent(Event(0x0245)) 
elseif (emissary_status == 1) and (mission_status == 2) then
  player:showText(npc,4175);
elseif (player:getMissionStatus(1,7) == 1) and (mission_status == 15) then -- coming from Windy first path
	player:startEvent(Event(0x0245)) -- included so that player doesn't miss this story element if doing mission in this order.
elseif (player:getMissionStatus(1,7) == 1) and (mission_status == 16) then 
	player:showText(npc,4175);
elseif (nation == 1) then -- Bastok 
  player:startEvent(Event(0x021B)) 
elseif (nation == 0) then 
  player:startEvent(Event(0x0243)) 
else
  player:startEvent(Event(0x0244)) 
end
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x0245) then
 if (player:getMissionStatus(1,5) == 1) then
   player:setVar("mission_status",2);
 else
   player:setVar("mission_status",16);
end;	
end; 
end;