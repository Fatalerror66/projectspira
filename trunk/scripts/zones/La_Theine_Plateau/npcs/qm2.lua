-----------------------------------
--	Author: ReaperX
-- 	??? in La Theine Plateau H-10
-- 	Finishes THF AF3 quest

Pickaxe = 0x25D;

ParagonOfThiefExcellence = 221;

require("scripts/globals/settings");
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/globals/Gearsets");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

if player:getQuestStatus(2,71) == 2 then
	player:specialMessage(THF_AF3_OFFSET+2); -- "There is nothing else of interest here."
elseif player:getVar("THF_AF3_STATUS_2") == 4 then
	player:specialMessage(THF_AF3_OFFSET); -- "Something about this patch of ground alerts your thief instincts."
	player:setVar("THF_AF3_STATUS_2",5);
elseif player:getVar("THF_AF3_STATUS_2") == 5 then
	player:specialMessage(THF_AF3_OFFSET+1,0,0,0,0x25D); -- "You need a pickaxe to dig here."
elseif player:getVar("THF_AF3_STATUS_2") == 6 then -- in case player couldn't get the item the first time.
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(RoguesPoulaines);
		player:specialMessage(ITEM_OBTAINED,RoguesPoulaines);
		player:completeQuest(2,71);
		player:setTitle(ParagonOfThiefExcellence);
		player:setVar("THF_AF3_STATUS_2",0);
		player:addFame(2,WIN_FAME*AF3_FAME);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,RoguesPoulaines);
	end;
else
	player:specialMessage(THF_AF3_OFFSET-1); --"There is nothing out of the ordinary here."
end;
end; 


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if trade:getItemCount() == 1 and trade:hasItemQty(Pickaxe,1) and player:getVar("THF_AF3_STATUS_2") >=4 then
	event = Event(0x77);
	event:setParams(0,RoguesPoulaines,0,Pickaxe);
	player:startEvent(event);
	trade:isComplete();
end;
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x77) then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(RoguesPoulaines);
		player:specialMessage(ITEM_OBTAINED,RoguesPoulaines);
		player:completeQuest(2,71);
		player:setTitle(ParagonOfThiefExcellence);
		player:setVar("THF_AF3_STATUS_2",0);
		player:addFame(2,WIN_FAME*AF3_FAME);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,RoguesPoulaines);
		player:setVar("THF_AF3_STATUS_2",6);
	end;
end;
end;