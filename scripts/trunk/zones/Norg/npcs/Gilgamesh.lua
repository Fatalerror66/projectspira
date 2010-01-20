-----------------------------------
--	Author: ReaperX
-- 	Gilgamesh
-- 	Zilart Missions, Bastok Mission 6.2
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getMissionStatus(1,17) == 1) and (mission_status == 2) then
  player:startEvent(Event(0x62))  -- Bastok Mission 6.2
elseif (player:getMissionStatus(1,17) == 1) and (mission_status == 3) then
  player:showText(npc,721)
  if (DEBUG_MODE) and (player:hasItem(1160) ==0) then
  	player:setPos(171.7,-2,-25, 0xCD);     -- to Ifrit's Cauldron
  end;
elseif (player:getMissionStatus(1,17) == 1) and (mission_status == 4) then
	player:showText(npc,743);
	if (DEBUG_MODE) then
    player:setPos(64, -14, 4, -6, 0xED);     -- to Naji
  end;
else
	-- need default reponse here
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

count = trade:getItemCount();
mission_status = player:getVar("mission_status");
if (count == 1) and trade:hasItemQty(1160,1) and (player:getMissionStatus(1,17) == 1) and (mission_status == 3) then  -- frag rock
	trade:isComplete();
	player:startEvent(Event(0x63))  -- Bastok Mission 6.2 
end; 
end


function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x62) then
  player:setVar("mission_status",3);
elseif (csid  == 0x63) then
  player:setVar("mission_status",4); -- mission over, back to Bastok
end
end;