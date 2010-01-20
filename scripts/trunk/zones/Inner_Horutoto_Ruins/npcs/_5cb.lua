-----------------------------------
--	Author: ReaperX
-- 	Gate of Darkness
--  This is the Dark Dungeon in Windurst Mission 8-2
--  Default text is currently "The door is firmly closed." Needs to be checked on retail.
---------------------------------------------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(2,21) == 1) and (player:getVar("mission_status") == 8) then
	player:startEvent(Event(0x4B));
elseif (player:getMissionStatus(2,21) == 1) and (player:getVar("mission_status") == 9) then
	toManustery(player);
else
	player:specialMessage(MISSIONS + 28) -- "The door is firmly closed."
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
if (csid == 0x4B) then
	player:setVar("mission_status",9);
end;
end;