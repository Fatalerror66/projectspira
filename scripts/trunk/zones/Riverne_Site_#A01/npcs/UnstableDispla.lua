-----------------------------------
--	Author: ReaperX
--  Unstable Displacement at I-9, leads to Ouryu Island

-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Riverne_Site_#B01/TextIDs"] = nil;
require("scripts/zones/Riverne_Site_#B01/TextIDs");

CloudEvoker = 0x732;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:specialMessage(1345); -- "The space around you seems oddly distorted and disrupted."
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 1) and (trade:hasItemQty(CloudEvoker,1)) then
	event = Event(0x7D00);
	event:setParams(0,0,0,1);
	player:startEvent(event);
	trade:isComplete();
end; 
end;
 
function onEventSelection(player,csid,option)
	player:updateEvent(2,0,0,60,6,1);	
end;

 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x7D00) and (option == 100) then
	loc = Zone(0x1e);
	loc:spawnMob("Ouryu",11, 76, -734,233,nil);
end;
end;