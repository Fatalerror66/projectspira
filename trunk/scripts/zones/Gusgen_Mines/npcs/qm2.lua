-----------------------------------
--	Author: ReaperX
-- 	??? 
--	Spawns Blind Moby when you trade Hare Meat to it (for Glocolite, Bastok Mission 3.2)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
repeat_mission = player:getVar("repeat_mission");
if ((player:getMissionStatus(1,11) == 1) or (repeat_mission == 11)) and (player:getVar("mission_status") == 2) then
	player:specialMessage(1081); -- "You see monster tracks on the ground"
elseif ((player:getMissionStatus(1,11) == 1) or (repeat_mission == 11)) and (player:getVar("mission_status") == 3) then
	player:specialMessage(1141); -- "There is nothing out of the ordinary here."
	if (DEBUG_MODE) then
	  player:setPos(130, 8.5, -1.6, 228, 0xEC);   -- to Argus
	end;
else
	player:specialMessage(1141); -- "There is nothing out of the ordinary here."
end;
end;
 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
repeat_mission = player:getVar("repeat_mission");
if (trade:getItemCount() == 1) and (trade:hasItemQty(4358,1)) and ((player:getMissionStatus(1,11) == 1) or (repeat_mission == 11)) and (player:getVar("mission_status") == 2) then -- hare meat
  player:specialMessage(216); -- "You are suddenly overcome with a sense of foreboding"
  loc = Zone(0xc4);
  loc:spawnMob("BlindMoby",206,-60,-102,0,player:getId()); 
  trade:isComplete();
end;
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;