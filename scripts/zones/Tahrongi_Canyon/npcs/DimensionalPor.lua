-----------------------------------
--	Author: ReaperX
--  	Mea Dimensional Portal to Sea
-----------------------------------

-----------------------------------
--onTrigger Action-- (Trin)
-----------------------------------
function onTrigger(player,npc)
 
 event =  Event(0x393); -- this will teleport you to the correct position in Al'taieu, no check for sea access yet.
 player:startEvent(event); 

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
if (csid == 0x393) and (option == 1) then
	player:setPos(654,-1,101,160,0x21) -- Teleport to Mea side of Al'Taieu
end;
end;