-----------------------------------
--	Author: ReaperX
-- 	??? In North Gustaberg F-7
-- 	For THF AF2 quest - pops NM Gambilox Wanderling
--  pop message verified from http://www.youtube.com/watch?v=ExKRjREjOIw 
--  minor issue: where does text 1061 "Now is not the time to be checking this out!" fit in, assuming
--  the ??? depops on retail while Gambilox is up?
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
require("scripts/zones/North_Gustaberg/TextIDs");

RegalDie = 0x444;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if player:getVar("THF_AF2_GAMBLING") == 5 then
	player:specialMessage(1060); -- "You sense an evil presence..." verified
	loc = Zone(0x6a);
	loc:spawnMob("GambiloxWander",-229, 99, 441, 146,player:getId());
elseif player:getVar("THF_AF2_GAMBLING") == 6 then
	event = Event(0xC8);
	event:setParams(RegalDie);
	player:startEvent(event);
else	
	player:specialMessage(1059); -- "There is nothing out of the ordinary here." -- not verified but likely correct based on textid proximity
	if DEBUG_MODE then
		player:setPos(-43,5, -133, 105, 0xf5); -- to Sniggnix, Lower Jeuno
	end;
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0xC8) then
	player:setVar("THF_AF2_GAMBLING", 7);
	player:specialMessage(ITEM_OBTAINED,RegalDie);
	player:addItem(RegalDie);
end;
end;