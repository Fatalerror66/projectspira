-----------------------------------
-- Author: ReaperX
-- Marble Door (west entrance to the Animastery, coming from Hinge Oils)
-- involved in Windurst Mission 7-1 "The Sixth Ministry"
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Toraimarai_Canal/TextIDs"] = nil;
require("scripts/zones/Toraimarai_Canal/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
event = Event(0x46);
if player:hasKeyItem(OptisteryRing) == 1 then
	oilsup = getGlobalVar("HingeOilsUp");
	if (oilsup > 0) then
		event:setParams(0,0,0,1);
	else
		event:setParams(0,0,0,2);
	end;
else
	event:setParams(0,0,0,0);
end;
player:startEvent(event);
end;