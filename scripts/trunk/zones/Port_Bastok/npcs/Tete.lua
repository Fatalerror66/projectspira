-----------------------------------
--	Author: Almendro
-- 	Tete
-- 	"The Wisdom of Elders"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
TheWisdomofElders_tempVar = player:getVar("TheWisdomofElders_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(TheWisdomofElders_tempVar == 1)then
	player:startEvent(Event(0xAF));
	player:setVar("TheWisdomofElders_tempVar",2);
else
	player:startEvent(Event(0x23));
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