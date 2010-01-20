-----------------------------------
-- Author: Almendro
-- ???
-- Involved in "Beadeaux Smog"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
require("scripts/zones/Beadeaux/TextIDs");
-----------------------------------
-- Initialization
CorruptedDirt = 0x8C;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
     BeadeauxSmog = player:getQuestStatus(1,33);
has_CorruptedDirt = player:hasKeyItem(CorruptedDirt);
if(BeadeauxSmog == 1 and has_CorruptedDirt == 1)then
	player:addKeyItem(CorruptedDirt);
	player:specialMessage(KEYITEM_OBTAINED,CorruptedDirt);
end
end