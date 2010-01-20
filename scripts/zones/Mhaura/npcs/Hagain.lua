-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Hagain
-- 	Chat, THF AF3 quest
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");

BombIncense = 0xC1	
ChandelierCoal = 0x443

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getVar("THF_AF3_STATUS_2") == 1) then
	event = Event(0x2713);
	event:setParams(0,BombIncense,ChandelierCoal);
	player:startEvent(event);
elseif (player:getVar("THF_AF3_STATUS_2") == 2) then
	event = Event(0x2714);
	event:setParams(0,BombIncense,ChandelierCoal);
	player:startEvent(event);
elseif (player:getVar("THF_AF3_STATUS_2") == 3) then
	player:startEvent(Event(0x2716));
else
	player:startEvent(Event(0x2712));
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if trade:getItemCount() == 1 and trade:hasItemQty(ChandelierCoal,1) and player:getVar("THF_AF3_STATUS_2") == 2 then
	event = Event(0x2715);
	event:setParams(0,ChandelierCoal);
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
if csid == 0x2713 then
	player:setVar("THF_AF3_STATUS_2",2)
	player:addKeyItem(BombIncense);
	player:specialMessage(KEYITEM_OBTAINED,BombIncense);
elseif csid == 0x2714 and DEBUG_MODE then
	player:setPos(-220,0,200,64,0xC8);
elseif csid == 0x2715 then
	player:setVar("THF_AF3_STATUS_2",3)
elseif csid == 0x2716 and DEBUG_MODE then
	player:setPos(60,-5,239,0,0xF1); -- to Nanaa Mihgo
end;
end;