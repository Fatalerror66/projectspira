-----------------------------------
--	Author: ReaperX, Arcanedemon
-- 	Elfriede
--  THF AF1, Basic Chat Text
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
require("scripts/zones/Selbina/TextIDs");

TenshodoEnvelope = 0xB8;
QuadavStew = 0x11D9;
SignedEnvelope = 0xB9;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if 	(player:getVar("THF_AF1_status") == 2) then
	event = Event(0x2712);
	event:setParams(0,TenshodoEnvelope,QuadavStew);
	player:startEvent(event);
elseif (player:getVar("THF_AF1_status") == 3) then
	event = Event(0x2713);
	event:setParams(0,0,QuadavStew);
	player:startEvent(event);
else
	player:startEvent(Event(0x19));
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if trade:getItemCount() == 1 and trade:hasItemQty(QuadavStew,1) and player:getVar("THF_AF1_status") == 3 then
	trade:isComplete();
	event = Event(0x2714);
	event:setParams(1,TenshodoEnvelope,QuadavStew);
	player:startEvent(event);
end
end; 

function onEventSelection(player,csid,option) 
--print("***CSID:",csid);
--print("***RESULT:",option);
end;
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x2712) then
	player:setVar("THF_AF1_status",3);
elseif (csid == 0x2714) then
	player:setVar("THF_AF1_status",4);
	player:addKeyItem(SignedEnvelope);
	player:removeKeyItem(TenshodoEnvelope);
	player:specialMessage(KEYITEM_OBTAINED,SignedEnvelope);
	if DEBUG_MODE then
		player:setPos(43, 0, -20, 222, 0xF5);
	end;
end;
end;