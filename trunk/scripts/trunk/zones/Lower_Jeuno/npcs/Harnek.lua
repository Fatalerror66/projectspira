-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Harnek
-- 	Basic Chat Text, THF AF1 Quest
-----------------------------------

LetterFromTheTenshodo = 0xB7;
TenshodoEnvelope = 0xB8;
SignedEnvelope = 0xB9;
MaraudersKnife = 0x417C;

require("scripts/globals/settings");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("THF_AF1_status") == 1) then
	event = Event(0x2725);
	event:setParams(0,LetterFromTheTenshodo,TenshodoEnvelope);
	player:startEvent(event);
elseif (player:hasKeyItem(SignedEnvelope) == 1) then
	player:startEvent(Event(0x2726));
else
	player:startEvent(Event(0xD9));
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x2725) then
	player:addKeyItem(TenshodoEnvelope);
	player:removeKeyItem(LetterFromTheTenshodo);
	player:specialMessage(KEYITEM_OBTAINED,TenshodoEnvelope);
	player:setVar("THF_AF1_status",2);
	if (DEBUG_MODE) then
		player:setPos(61, -16, 11, 205,0xF8);
	end;
elseif (csid == 0x2726) then
	player:addItem(MaraudersKnife);
	player:specialMessage(ITEM_OBTAINED,MaraudersKnife);
	player:setVar("THF_AF1_status",0);
	player:completeQuest(2,69);
end;
end;