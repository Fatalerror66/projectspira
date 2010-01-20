-----------------------------------
--	Author: Almendro
-- 	??? (qm2.lua)
-- 	Involved in "Past Perfect"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
require("scripts/zones/Konschtat_Highlands/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
PastPerfect = player:getQuestStatus(1,23);
TatteredMissionOrders = 0x6D;
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(PastPerfect == 1 and player:hasKeyItem(TatteredMissionOrders) == 0)then
	player:specialMessage(922);
	player:addKeyItem(TatteredMissionOrders);
	player:specialMessage(KEYITEM_OBTAINED,TatteredMissionOrders);
else
	player:specialMessage(923);
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