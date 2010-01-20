-------------------------------------------------------
--	Author: ReaperX
--  ??? at E-8 for Windurst Mission 9-2
-------------------------------------------------------

require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getMissionStatus(2,23) == 1) and (player:getVar("mission_status") == 2) and (player:hasKeyItem(AncientVerseOfUggalepih) == 0) then
	player:startEvent(Event(0x44));
else
	player:specialMessage(MISSIONS - 8); -- "It is just a pile of rubble."
end;
end;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice)
if csid == 0x44 then
	player:addKeyItem(AncientVerseOfUggalepih);
	player:specialMessage(KEYITEM_OBTAINED,AncientVerseOfUggalepih);
end;
end;
