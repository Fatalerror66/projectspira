-- _3z8 (Refiner Lever 3rd floor)
-- by ReaperX

----------------------------------- 
-- onTrigger Action 
----------------------------------- 

function onTrigger(player,npc)
if (player:getVar("refiner_input") > 0) then
	event = Event(0x11);
	event:setParams(1,1,1,1,1,1,1,1);
	player:startEvent(event); -- machine is working, you hear the sound of metal hitting metal down below.
	refiner_output = player:getVar("refiner_output");
	player:setVar("refiner_output",refiner_output+player:getVar("refiner_input"));
	player:setVar("refiner_input",0)
else  
  player:startEvent(Event(0x11)); -- machine is working, but you cannot discern its purpose.
end
end;