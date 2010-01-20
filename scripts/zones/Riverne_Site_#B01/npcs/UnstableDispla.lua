-----------------------------------
--	Author: ReaperX
--  Unstable Displacement at E-7 (west), leads to Bahamut Island

-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Riverne_Site_#B01/TextIDs"] = nil;
require("scripts/zones/Riverne_Site_#B01/TextIDs");

MonarchsOrb = 0x83C;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:specialMessage(1343); -- "The space around you seems oddly distorted and disrupted."
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 1) and (trade:hasItemQty(MonarchsOrb,1)) then
	event = Event(0x7D00);
	event:setParams(0,0,0,2);
	player:startEvent(event);
	trade:isComplete();
end; 
end;
 
function onEventSelection(player,csid,option)
	player:updateEvent(2,1,0,60,6,1);	
end;

 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x7D00) and (option == 101) then
	loc = Zone(0x1d);
	loc:spawnMob("Bahamut",-706, -1, 852,56,nil);
end;
end;