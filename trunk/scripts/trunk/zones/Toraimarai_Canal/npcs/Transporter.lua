-----------------------------------
-- Author: ReaperX
-- Transporter, leads from Animastery back to Heaven's Tower.
-- involved in Windurst Mission 7-1 "The Sixth Ministry"
-- Destination position is a guess.
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

function onTrigger(player,npc)
player:startEvent(Event(0x47));
end;

function onEventFinish(player,csid,option)
if (option == 1) then
	toHeavensTower(player);
end;
end;