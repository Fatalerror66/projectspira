-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Gate: Magical Gizmo
-- 	Part of Windurst Mission 1-1.  Everything should be working. 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getMissionStatus(2,0) == 1) and (player:getVar("mission_status") == 2) then
	player:startEvent(Event(0x2a));
	--determine which of the six ancient magical gizmos will complete the task for the player--
	player:setVar("theHorutot-NeedsGizmo",math.random(1,6));
	player:setVar("needstoexamine1",1);
	player:setVar("needstoexamine2",1);
	player:setVar("needstoexamine3",1);
	player:setVar("needstoexamine4",1);
	player:setVar("needstoexamine5",1);
	player:setVar("needstoexamine6",1);
else
	player:specialMessage(MISSIONS+28); -- "The door is firmly closed."
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
if (csid == 0x2a) then
  player:setVar("mission_status",3);
end;
end;