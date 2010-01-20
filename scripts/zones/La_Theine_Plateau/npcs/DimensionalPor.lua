-----------------------------------
--	Author: ReaperX
--  Holla Dimensional Portal to Sea
-----------------------------------

-----------------------------------
--onTrigger Action--
-----------------------------------
function onTrigger(player,npc)
event =  Event(0xCC); -- this will teleport you to the correct position in Al'taieu, no check for sea access.
player:startEvent(event); 
end; 
 

-----------------------------------
--onTrade Action-- (Tenjou)
-----------------------------------
function onTrade(player,npc,trade)

end; 
 
-----------------------------------
--onEventFinish Action--
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0xCC) and (option == 1) then
	player:setPos(25,-1,579,50,0x21) -- Teleport to Holla side of Al'Taieu
end;
end;