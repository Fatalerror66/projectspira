-------------------------------------------------
--	Author: ReaperX
-- 	Mandragora Warden
-- 	Involved in Windurst Mission 9-1
--  holds Apururu's father Zonpa-Zippa prisoner.
--  I don't know how many retries it should take until
--  you get the message that the Warden wants something 
--  from you, so I made it 3 times.
------------------------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
require("scripts/zones/The_Boyahda_Tree/TextIDs");
require("scripts/globals/teleports");

function onTrigger(player,npc)
	mission_status = player:getVar("mission_status");
	if (player:getMissionStatus(2,22) == 1) then
		if (mission_status <= 7) then
			mission_status = mission_status + 1;
			player:setVar("mission_status",mission_status);
			player:showText(npc,MISSIONS) -- "Pi...!"
		elseif (mission_status == 8) then
			player:specialMessage(MISSIONS + 1); -- "The warden appears to want something from you..."
		else
			player:showText(npc,MISSIONS) -- "Pi...!"
		end;
	else
		player:showText(npc,MISSIONS) -- "Pi...!"
	end;
if DEBUG_MODE and player:getMissionStatus(2,22) == 1 and mission_status == 0 then
	toManustery(player);
end;
end;

function onTrade(player,npc,trade)
	if player:getMissionStatus(2,22) == 1 and player:getVar("mission_status") == 8 and trade:getItemCount() == 1 and trade:hasItemQty(ClumpOfGoobbueHumus,1) then
		trade:isComplete();
		player:startEvent(Event(0xD));
	end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0xD) then
	player:setVar("mission_status",9)
	player:addKeyItem(LetterFromZonpaZippa);
	player:specialMessage(KEYITEM_OBTAINED,LetterFromZonpaZippa);
end;
end;