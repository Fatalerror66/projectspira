-- _3z9 (Refiner Lever 2nd floor)
-- by ReaperX

MythrilSand = 599;

----------------------------------- 
-- onTrigger Action 
----------------------------------- 

function onTrigger(player,npc)

refiner_output = player:getVar("refiner_output");

if (refiner_output > 0 ) then
	player:setVar("refiner_output",refiner_output-1)
	player:specialMessage(928); -- something falls out of the machine!
	player:specialMessage(930,MythrilSand,1); 
	player:addItem(MythrilSand);
	npc:setState(3);
else  
  player:specialMessage(929);
end
end;