-----------------------------------
--	Author: Aurelias
--  Wall of Banishing
-----------------------------------

-----------------------------------
--onTrigger Action--
-----------------------------------
function onTrigger(player,npc)

	if(player:hasKeyItem(0x88) ==1) then
		player:startEvent(Event(0x002A));
	else
	player:specialMessage(903);
	player:setVar("wall_of_banishing",1)
	
end
end; 
 
 -----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	--print("CSID:",csid);
	--print("RESULT:",option);
		if(csid == 0x002A and option == 0) then
			npc = getNPCById(17387981,0x95)
			npc:setState(5);
			player:specialMessage(906);	
		else
	end
end;