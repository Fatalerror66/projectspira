-----------------------------------
--	Author: ReaperX
-- 	??? In Dangruf Wadi F-7
-- 	For THF AF2 quest - triggers a CS with Saltvix
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
require("scripts/zones/Dangruf_Wadi/TextIDs");

RockSalt = 0x3A8;
RegalDie = 0x444;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if player:getQuestStatus(2,70) == 0 then
	player:specialMessage(THF_AF_OFFSET-1); -- "There is nothing out of the ordinary here.."
else
	player:specialMessage(THF_AF_OFFSET); -- "The area is littered with a white crystalline dust."
	if DEBUG_MODE and player:getVar("THF_AF2_GAMBLING") == 3 then
		player:setPos(-376,-1, 443, 206); -- to Grasswix
	end;
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
gambling = player:getVar("THF_AF2_GAMBLING");
if player:getQuestStatus(2,70) == 1 and (gambling == 1 or gambling == 2) and trade:hasItemQty(RockSalt,1) and trade:getItemCount() == 1 then
	player:specialMessage(THF_AF_OFFSET+3,0, RockSalt);
	if gambling == 1 then 
		eventid = 0x88;
	else
		eventid = 0x8E;
	end;
	if (DEBUG_MODE) then -- rig the odds a little so the testers won't go nuts.
		playerscore = math.random(600,999);
	else
		playerscore = math.random(0,999);
	end;
	--playerscore = 999;
	goblinscore = math.random(0,999);
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
if (csid == 0x88) or (csid == 0x8E) and (option ~=2) then -- win
	player:setVar("THF_AF2_GAMBLING",3);
	player:specialMessage(THF_AF_OFFSET+5); -- "you beat the goblin!"
elseif (csid == 0x8B) or (csid == 0x91) and (option ~=2) then -- loss
	player:setVar("THF_AF2_GAMBLING",2);
	player:specialMessage(THF_AF_OFFSET+6); -- "The Goblin beat you..."
elseif (option == 2) then
	player:specialMessage(THF_AF_OFFSET+7); -- "You gave up..."
	player:setVar("THF_AF2_GAMBLING",2);
end;
end;