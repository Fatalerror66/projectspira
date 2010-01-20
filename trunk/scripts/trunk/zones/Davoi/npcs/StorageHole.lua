-----------------------------------
--	Author: ReaperX
-- 	Storage Hole
-- 	for RDM AF quest, gives keyitem Orcish Dried Food
--  @zonepos 95 -51 4 -217 to test.
-----------------------------------
  
 OrcishDriedFood = 0xC4;
 DavoiStorageKey = 1103;

require("scripts/globals/settings");
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(1001);
end;

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
if (player:getQuestStatus(0,84) == 1) and (trade:hasItemQty(DavoiStorageKey,1)) and (trade:getItemCount() == 1) then
  trade:isComplete();
	player:specialMessage(KEYITEM_OBTAINED,OrcishDriedFood);
	player:addKeyItem(OrcishDriedFood);
end;
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x11) then
  player:setVar("peace_for_the_spirit_status",2);
elseif (csid == 0xE) then
  player:setVar("peace_for_the_spirit_status",6);
end;
end;