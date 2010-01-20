-----------------------------------
--	Author: ReaperX
--  Swirling Vortex
--  leads to Apollyon
-----------------------------------

-----------------------------------
--onTrigger Action-- (Trin)
-----------------------------------

function onTrigger(player,npc)

X = player:getXPos();
if (X > 0) then
	player:startEvent(Event(0x9F));
else
	player:startEvent(Event(0xA0));
end;
end; 
 

-----------------------------------
-- onTrade Action (Tenjou)
-----------------------------------
function onTrade(player,npc,trade)

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x9F) and (option == 1) then
	player:setPos(600,0,-600,0,0x26);
elseif (csid == 0xA0) and (option == 1) then
	player:setPos(-600,0,-600,0,0x26);
end;
end;