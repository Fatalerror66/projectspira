-----------------------------------
--	Author: ReaperX
--  Judgement key Door in Castle Oztroja 
--  For Windurst Mission 6-2
--  couldn't find an event for the door, so instant port now
-----------------------------------
-- Includes
require("scripts/globals/settings");

JudgmentKey = 1142;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:specialMessage(992); -- the door is locked
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if(trade:getItemCount() == 1 and trade:hasItemQty(JudgmentKey,1)) then
	trade:isComplete();
	-- could use some message here that the key breaks or similar, but couldn't find any.
	player:setPos(player:getXPos(),player:getYPos(),player:getZPos()+5,0);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;