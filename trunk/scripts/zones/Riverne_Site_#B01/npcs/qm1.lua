-----------------------------------
--	Author: ReaperX
--  ??? in cave at J-9, pops NM Unstable Cluster (for Soboro Sukehiro).

-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Riverne_Site_#B01/TextIDs"] = nil;
require("scripts/zones/Riverne_Site_#B01/TextIDs");

ClusteredTar = 0x758;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:specialMessage(1351); -- "The ground here is giving off heat." (unverified message, but seems to fit)
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

if (trade:getItemCount() == 1) and (trade:hasItemQty(ClusteredTar,1)) then
	trade:isComplete();
	loc = Zone(0x1D);
	loc:spawnMob("UnstableCluste",306, -.5, -707,88,player:getId());
end;
end; 