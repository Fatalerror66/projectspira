-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Door: Ancient Magical Gizmo
-- 	Part of Windurst Mission 1-2.
-----------------------------------
require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getMissionStatus(2,1) == 1) and (player:getVar("mission_status") == 3) then 
	player:specialMessage(MISSIONS); -- You haven't finished placing all the dark Mana Orbs into the receptacle gizmos yet!
elseif (player:getMissionStatus(2,1) == 1) and (player:getVar("mission_status") == 4) then 
	player:startEvent(Event(0x2c));
	player:specialMessage(MISSIONS+1,0,SoutheasternStarCharm);
	player:removeKeyItem(SoutheasternStarCharm);
else
	player:specialMessage(MISSIONS - 1);
end
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
if (csid == 0x2c) then
	player:setVar("mission_status",5)
	player:specialMessage(MISSIONS+2);
end;
end;