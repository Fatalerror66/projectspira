-----------------------------------
--	Author: ReaperX
--  ??? on E-7 island, gives you key item Rivernewort, for quest "Spice Gals"
--  You probably habe to be on the quest to get this key item, just because
--  it's on the way to Monarch Linn, and I don't recall ever getting it. But
--  for now, there is no quest check.

-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Riverne_Site_#B01/TextIDs"] = nil;
require("scripts/zones/Riverne_Site_#B01/TextIDs");

Rivernewort = 0x26D;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(Rivernewort) == 0) then
		player:addKeyItem(Rivernewort);
		player:specialMessage(KEYITEM_OBTAINED,Rivernewort);
	else
		player:specialMessage(1350); -- nothing out of the ordinary. (unverified message)
	end;
end;
