-----------------------------------
--	Author: ReaperX
--  	Dimensional Portal to Sea
-----------------------------------

-----------------------------------
--onTrigger Action-- (Trin)
-----------------------------------
function onTrigger(player,npc)
player:startEvent(Event(0x393)); 
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
if (csid == 0x393)  and (option == 1) then
	player:setPos(-635,-1,164,90,0x21) -- Teleport to Dem side of Al'Taieu
end;
end;