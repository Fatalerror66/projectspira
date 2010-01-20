-- _3za (Refiner Lid)
-- by ReaperX

-- events:
-- 0x12 default event
-- 0x13 "you put in X {item name} "
-- 0x14 "it's full"
-- 0x15 put in the wrong item

MineGravel = 597;
MachineCapacity = 10; -- I just guessed this value, I have no idea how many pieces of mine gravel you can put in at the same time, if multiples at all.
----------------------------------- 
-- onTrigger Action 
----------------------------------- 

function onTrigger(player,npc)
  player:startEvent(Event(0x12));
end;

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 

minegravel = trade:getItemQty(MineGravel);
already_in = player:getVar("refiner_input");

if (already_in+minegravel > MachineCapacity) then
	  player:startEvent(Event(0x14));
elseif (trade:getItemCount() == minegravel) then
  trade:isComplete();
  event = Event(0x13);
  event:setParams(MineGravel,minegravel);
  player:setVar("refiner_input",already_in+minegravel);
  player:startEvent(event);
else
 	player:startEvent(Event(0x15));
end;
end; 