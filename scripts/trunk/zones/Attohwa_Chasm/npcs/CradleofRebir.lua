-----------------------------------
-- Author: ReaperX
-- Cradle of Rebirt - CoP Mission 3-3B2, Comedy of Errors, Act II 
-- missing; ENM key item 
-- missing: event animation

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

if (cop_status == 1) and (comedy_of_errors_status == 5) and (has_keyitem == 1) then
  player:addKeyItem(0x24B);
  player:addKeyItem(0x24C);
  player:addKeyItem(0x24D);
  player:removeKeyItem(0x24A);
	player:specialMessage(23, 0x24B);
	player:specialMessage(23, 0x24C);
	player:specialMessage(23, 0x24D);
  player:completeMission(6,20);       -- CoP 3.3B2 "Comedy of Errors, Act II" complete
  player:currentMission(6,21);        -- now on 3.3B3 "Exit Stage Left"
  player:setVar("ComedyofErrors",6);  -- next back to Yoran Oran
else
  player:specialMessage(818);         -- "nothing happens." Just took a guess that this is the correct message.
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