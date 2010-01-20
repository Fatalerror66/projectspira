-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Yatniel
-- 	Basic Chat Text, THF AF3
-----------------------------------

require("scripts/globals/settings");

QuakeGrenade = 0x43A2;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getVar("THF_AF3_STATUS_1") == 1) then
	event = Event(0x272D);
	event:setParams(0,QuakeGrenade);
	player:startEvent(event);
elseif (player:getVar("THF_AF3_STATUS_1") == 2) then
	event = Event(0x272E);
	event:setParams(0,QuakeGrenade);
	player:startEvent(event);
elseif (player:getVar("THF_AF3_STATUS_1") == 3) then
	player:startEvent(Event(0x2730));
else	
	player:startEvent(Event(0x272C));
end; 
end;
 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if trade:getItemCount() == 4 and trade:hasItemQty(QuakeGrenade,4) and player:getVar("THF_AF3_STATUS_1") == 2 then
	event = Event(0x272F);
	event:setParams(0,QuakeGrenade);
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
if (csid == 0x272D) then
	player:setVar("THF_AF3_STATUS_1",2);
elseif (csid == 0x272F) then
	player:setVar("THF_AF3_STATUS_1",3);
elseif (csid == 0x2730) then
	player:setPos(14,-16,83,90,0xF9);
end;
end;