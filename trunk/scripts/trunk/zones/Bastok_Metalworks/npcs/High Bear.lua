-----------------------------------
--	Author: Arcanedemon
-- 	HighBear
-- 	"Beadeaux Smog"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
CorruptedDirt = 0x8C;
      Chakram = 0x4384;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
            bflvl = player:getFameLevel(1);
     BeadeauxSmog = player:getQuestStatus(1,33);
has_CorruptedDirt = player:hasKeyItem(CorruptedDirt);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 4 and BeadeauxSmog == 0) then
	player:startEvent(Event(0x02DB));
	player:addQuest(1,33);
elseif (BeadeauxSmog == 1 and has_CorruptedDirt == 1) then
	player:startEvent(Event(0x02DC));
else
    -- Default chat text
	player:startEvent(Event(0x02DA));
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
if (csid == 0x02DC) then
	if(player:getFreeSlotCount(0) >= 1) then -- Checks if there is at least a freeslot in your inventory
		player:completeQuest(1,33);
		player:addFame(1,BAS_FAME*140);
		player:setTitle(94);
		player:addItem(Chakram);
		player:specialMessage(ITEM_OBTAINED,Chakram);
		player:removeKeyItem(CorruptedDirt);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,Chakram);
	end
end
end;