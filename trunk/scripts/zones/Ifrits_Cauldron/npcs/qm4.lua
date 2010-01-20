-----------------------------------
--	Author: ReaperX
-- 	??? - Bastok Mission 6.2 "The Pirate's Cove"
--  spawns Magma + Salamander when an adaman ore is traded to it.
--  In the video, Salamander pop position is on top of the ledge facing the ???. It's
--  briefly visible in http://www.youtube.com/watch?v=ltTc2J--h2k (around second 35).

--  Confirmed Magma pop position from private screenshots. 

--  Magma pops claimed, Salamander unclaimed.

--  Pop message confirmed from video is "You have a bad feeling about this place."
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Ifrits_Cauldron/Zone");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(852); -- "Lava flows slowly through the rocks."
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
-----------------------------------
-- Trades go below.
-----------------------------------
mission_status = player:getVar("mission_status");
--print("trade: ",trade:hasItemQty(646,1));
if (count == 1) and trade:hasItemQty(646,1) and (player:getMissionStatus(1,17) == 1) and (mission_status == 3) then
	--print("here");
	player:specialMessage(851); -- "You have a bad feeling about this place."
	trade:isComplete();
	loc = Zone(0xCD);
	loc:spawnMob("Magma",171.7,-2,-27.35,189,player:getId());
	loc:spawnMob("Salamander",166.6,-0.977,-19.993,33,nil);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;