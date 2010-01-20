-----------------------------------
--	Author: Tenjou, ReaperX
-- 	DOOR: Mahogony Door
-- 	Door to the Cat Burglar's Lair.  Involved in quest "Making Headlines."
--  Windurst Mission 2-1
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
news = player:getVar("makingHeadlines");
if (player:hasKeyItem(HideoutKey) == 1) then -- Windurst mission 2-1
	player:startEvent(Event(0x2E));
elseif (news == 2) then
	player:specialMessage(850,0,0x2b);
	player:setVar("makingHeadlines",3);
else
	player:startEvent(Event(0x2c)); -- the door is firmly closed.
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
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x2E) then
	player:removeKeyItem(HideoutKey);
	player:setVar("mission_status",4);
elseif (csid == 0x2c) then
	toHouseOfTheHero(player);
end
end;