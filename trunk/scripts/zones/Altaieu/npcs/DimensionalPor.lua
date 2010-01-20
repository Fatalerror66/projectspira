-----------------------------------
--	Author: ReaperX
--  Dimensional Portals back to Dem, Mea, Holla
-----------------------------------

-----------------------------------
--onTrigger Action-- (Trin)
-----------------------------------

function onTrigger(player,npc)

X = player:getXPos();
if (X < -600) then
	player:startEvent(Event(0x98));
elseif (X < 100) and (X > -100) then
	player:startEvent(Event(0x97));
else
	player:startEvent(Event(0x99));
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
if (csid == 0x98) and (option == 1) then
	player:setPos(220,19,132,64,0x6c);
elseif (csid == 0x97) and (option == 1) then
	player:setPos(420,19,-150,64,0x66);
elseif (csid == 0x99) and (option == 1) then
	player:setPos(265,35,340,0,0x75);
end;
end;