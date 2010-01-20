-----------------------------------
--	Author: ChrisKAra10, Almendro
-- 	Biggorf
--  "The Bare Bones"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
TheBareBones = player:getQuestStatus(1,38);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(TheBareBones == 1) then
	player:startEvent(Event(0x101));
else
	player:startEvent(Event(0x7E));
end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;