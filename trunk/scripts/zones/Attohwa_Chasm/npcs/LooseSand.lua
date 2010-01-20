-----------------------------------
-- Author: ReaperX
-- Loose Sand - spawns Lioumere for CoP Mission 3-3B2, Comedy of Errors, Act II 
-- missing; must spawn Lioumere and check for its death.
-- missing; Mimeo Stone fading over time

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
cop_status = player:getMissionStatus(6,20);
comedy_of_errors_status = player:getVar("ComedyofErrors");
has_keyitem = player:hasKeyItem(0x24A);

if (cop_status == 1) and (comedy_of_errors_status == 5) and (has_keyitem == 0) then
  -- spawn Lioumere
  --loc = Zone(7);
	--loc:spawnMob("Lioumere",480.20,40,0,player:getId()); -- crashes server
	player:addKeyItem(0x24A);
	player:specialMessage(23, 0x24A);
else
  player:specialMessage(818);                       -- "nothing happens." Just took a guess that this is the correct message.
end;
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