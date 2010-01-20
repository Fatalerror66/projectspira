-----------------------------------
--	Author: Aly
-- 	NPC:	Alexius
-- 	Quest:  A Purchase 0f Arms
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
require("scripts/zones/Jugner_Forest/TextIDs");
-----------------------------------
-- Initialize
order = 0x61;
receipt = 0x62;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
ArmsPurch = player:getQuestStatus(0,27);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (ArmsPurch == 1 and player:hasKeyItem(order) == 1) then
	player:startEvent(Event(0x05));		-- receive ArmsReceipt
	end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x05) then
	player:removeKeyItem(order);
	player:addKeyItem(receipt);			-- receive ArmsReceipt
	player:specialMessage(KEYITEM_OBTAINED,receipt);	
end
end;