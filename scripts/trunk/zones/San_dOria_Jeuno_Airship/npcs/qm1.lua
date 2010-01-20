-----------------------------------
--	Author: Almendro
-- 	??? (qm1.lua)
-- 	The Stars of Ifrit
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/San_dOria_Jeuno_Airship/TextIDs"] = nil;
require("scripts/zones/San_dOria_Jeuno_Airship/TextIDs");
-----------------------------------
-- Initialization
Carrierpigeonletter = 0xA2;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TheStarsofIfrit = player:getQuestStatus(1,42);
has_Carrierpigeonletter = player:hasKeyItem(Carrierpigeonletter);
	if(TheStarsofIfrit == 1 and has_Carrierpigeonletter == 0)then
		player:addKeyItem(Carrierpigeonletter);
		player:specialMessage(KEYITEM_OBTAINED,Carrierpigeonletter);
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
end;