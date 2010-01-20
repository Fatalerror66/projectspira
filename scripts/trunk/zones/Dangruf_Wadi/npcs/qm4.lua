-----------------------------------
--	Author: ReaperX
-- 	??? In Dangruf Wadi F-4
-- 	For THF AF2 quest - triggers a CS with Grasswix

require("scripts/globals/settings");
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
require("scripts/zones/Dangruf_Wadi/TextIDs");

GausebitWildgrass = 0x216;
RegalDie = 0x444;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if player:getQuestStatus(2,70) == 0 then
	player:specialMessage(THF_AF_OFFSET-1); -- "There is nothing out of the ordinary here.."
else
	player:specialMessage(THF_AF_OFFSET+1); -- "The area is littered with a white crystalline dust."
	if DEBUG_MODE and player:getVar("THF_AF2_GAMBLING") == 4 then
		player:setPos(-461,3, -139, 90); -- to Eggblix
	elseif DEBUG_MODE and player:getVar("THF_AF2_GAMBLING") == 2 then
		player:setPos(-369,4, 233, 42); -- to Saltvix
	end;
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
gambling = player:getVar("THF_AF2_GAMBLING");
if player:getQuestStatus(2,70) == 1 and gambling == 3 and trade:hasItemQty(GausebitWildgrass,1) and trade:getItemCount() == 1 then
	player:specialMessage(THF_AF_OFFSET+3,0, GausebitWildgrass);
	eventid = 0x89;
	if (DEBUG_MODE) then -- rig the odds a little so the testers won't go nuts.
		playerscore = math.random(600,999);
	else
		playerscore = math.random(0,999);
	end;
	if (playerscore < goblinscore) then
		eventid = eventid + 3;
	end;
	event = Event(eventid);
	event:setParams(RegalDie, 0, playerscore,goblinscore);
	trade:isComplete();
	player:startEvent(event);
end; 
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x89) and (option ~=2) then -- win
	player:setVar("THF_AF2_GAMBLING",4);
	player:specialMessage(THF_AF_OFFSET+5); -- "you beat the goblin!"
elseif (csid == 0x8C) and (option ~=2) then -- loss
	player:setVar("THF_AF2_GAMBLING",2);
	player:specialMessage(THF_AF_OFFSET+6); -- "The Goblin beat you..."
elseif (option == 2) then
	player:specialMessage(THF_AF_OFFSET+7); -- "You gave up..."
	player:setVar("THF_AF2_GAMBLING",2);
end;
end;