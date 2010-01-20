-----------------------------------
--	Author: Bababooey
-- 	??? (Chest at H-3)
-- 	Part of Sahagin Stash Quest
-----------------------------------

-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


sahaginStash = player:getQuestStatus(5,136);
sahaginStatue = player:hasKeyItem(296);

if(sahaginStash == 1 and sahaginStatue == 0) then
	event0x0001 = Event(0x0001);
	player:startEvent(event0x0001);
else
	--Not sure if this is the correct message if quest not active.
	player:specialMessage(915);
end;
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
--print("CSID:",csid);
--print("Option:",option);

if(csid == 1) then
	player:specialMessage(KEYITEM_OBTAINED,296);
	player:addKeyItem(296);
end;
end;