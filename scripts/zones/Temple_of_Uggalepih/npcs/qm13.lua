-----------------------------------
--	Author: ReaperX
--  G-10 (left) ??? on map 4 for Sandy mission 8-2 "Lightbringer

-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getMissionStatus(0,21) == 1) and (mission_status == 3) and (player:hasKeyItem(PieceOfABrokenKey1) == 0) then
  player:addKeyItem(PieceOfABrokenKey1);
  player:specialMessage(KEYITEM_OBTAINED,PieceOfABrokenKey1);
else
	player:specialMessage(QM_DEFAULT) -- "There is nothing out of the ordinary here" (not verified on retail)
end
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;