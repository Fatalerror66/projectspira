-----------------------------------
--	Author: ReaperX
-- 	??? In Dangruf Wadi F-7
-- 	For THF AF2 quest - triggers a CS with Eggblix
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
require("scripts/zones/Dangruf_Wadi/TextIDs");

LizardEgg = 0x110A;
RegalDie = 0x444;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if player:getQuestStatus(2,70) == 0 then
	player:specialMessage(THF_AF_OFFSET-1); -- "There is nothing out of the ordinary here.."
else
	player:specialMessage(THF_AF_OFFSET+2); -- "A number of broken eggs lie scattered about."
	if DEBUG_MODE and player:getVar("THF_AF2_GAMBLING") == 5 then
		player:setPos(-237,98, 443, 254,0x6a); -- to Gambilox Wanderling
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
if player:getQuestStatus(2,70) == 1 and gambling == 4 and trade:hasItemQty(LizardEgg,1) and trade:getItemCount() == 1 then
	player:specialMessage(THF_AF_OFFSET+3,0, LizardEgg);
	eventid = 0x8A;
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
if (csid == 0x8A) and (option ~=2) then -- win
	player:setVar("THF_AF2_GAMBLING",5);
	player:specialMessage(THF_AF_OFFSET+5); -- "you beat the goblin!"
elseif (csid == 0x8D) and (option ~=2) then -- loss
	player:setVar("THF_AF2_GAMBLING",2);
	player:specialMessage(THF_AF_OFFSET+6); -- "The Goblin beat you..."
elseif (option == 2) then
	player:specialMessage(THF_AF_OFFSET+7); -- "You gave up..."
	player:setVar("THF_AF2_GAMBLING",2);
end;
end;