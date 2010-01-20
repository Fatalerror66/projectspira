-----------------------------------
--	Author: Almendro
-- 	Mirror Pond
-- 	Love and Ice
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
require("scripts/zones/Beaucedine_Glacier/TextIDs");
-----------------------------------
-- Initialization
Carmelossongsheet = 0xA3;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	LoveandIce = player:getQuestStatus(1,43);
	if(LoveandIce == 1 and player:hasKeyItem(Carmelossongsheet) == 1)then
		player:startEvent(Event(0x64));
	end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if(csid == 0x64)then
		player:removeKeyItem(Carmelossongsheet);
	end
end;