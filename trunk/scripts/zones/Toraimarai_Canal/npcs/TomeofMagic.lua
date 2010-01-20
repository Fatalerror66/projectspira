-----------------------------------
-- Author: ReaperX
-- Tome of Magic
-- involved in Windurst Mission 7-1 "The Sixth Ministry"
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Toraimarai_Canal/TextIDs"] = nil;
require("scripts/zones/Toraimarai_Canal/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

baseid = 17469792;

function onTrigger(player,npc)
offset = npc:getId()-baseid;
print("offset = ",offset);
if (offset == 0) then
	player:startEvent(Event(0x41));
elseif (offset == 1) then
	player:startEvent(Event(0x42));
elseif (offset == 2) then
	player:startEvent(Event(0x43));
elseif (offset == 3) then
	player:startEvent(Event(0x44));
elseif (offset == 4) and (player:getMissionStatus(2,18) == 1) and (player:getVar("mission_status") == 2) then
	event = Event(0x45); -- CS with Star Sibyl
	event:setParams(1,OptisteryRing);
	player:setVar("mission_status",3);
	player:startEvent(event);
elseif (offset == 4) then
	player:startEvent(Event(0x48));
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
print("CSID:",csid);
print("RESULT:",option);
if (csid == 0x45) then
	player:getVar("mission_status",4);
end;
end;