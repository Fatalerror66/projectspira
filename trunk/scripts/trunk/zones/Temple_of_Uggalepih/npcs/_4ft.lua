-----------------------------------
--	Author: ReaperX
--  door at I-10 (left) on map 4 for Sandy mission 8-2 "Lightbringer
--  I don't know if this message is really displayed when you open this door and are on
--  the mission, but I didn't know where else to put it. Needs to be verified on retail.

require("scripts/globals/settings");
package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    
if (player:hasKeyItem(CrystalDowser)) then
	player:specialMessage(MISSIONS+3,CrystalDowser); -- "The Crystal Dowser slightly quivers, but there is no sign of Lightbringer here."
end; 
npc:setState(5);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x41) then
  player:setVar("mission_status",5);
end;
end;