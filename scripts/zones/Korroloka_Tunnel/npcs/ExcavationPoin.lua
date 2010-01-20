-----------------------------------
--	Author: Arcanedemon
-- 	Excavation Point
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
math.randomseed(os.time());
pickaxe = player:hasItem(0x025D);
if (pickaxe ~= 0 and pickaxe ~= nil) then

	--------------------
	-- Determine if Pickaxe breaks
	--------------------
	broke = 0;
	pickaxebreak = math.random();
	pickaxebreak = math.random();
	pickaxebreak = math.random();
	
	if (pickaxebreak < EXCAVATION_BREAK_CHANCE) then
		broke = 1;
		player:removeItem(0x025D,1);
	end
	
	--------------------
	-- Define array of possible results
	-- Mined = Item,MaxRate
	-- MaxRate = Previous MaxRate + Rate
	--------------------
	Mined = {0x03A8,0.1820,
		0x0378,0.3170,
		0x0371,0.3570,
		0x0360,0.5390,
		0x43F3,0.7210,
		0x43F5,0.8560,
		0x0377,0.8680,
		0x023D,0.8800,
		0x0375,0.9200,
		0x023F,0.9600,
		0x07C1,1.0000};

	--------------------
	-- Determine result
	-- Can check up to 50 items by default
	-- Increase While loop limit for more
	--------------------	
	Rate = math.random();
	Rate = math.random();
	Rate = math.random();

	i = 1;
	while i <= 100 do
		if (Rate <= Mined[i+1]) then
			item1 = Mined[i];		
			break;			
		end
		i = i+2;
	end
	
	--------------------
	-- Determine chance of no item mined
	-- Default rate is 50%
	--------------------
	Rate = math.random();
	Rate = math.random();
	Rate = math.random();
if (Rate <= (1 - EXCAVATION_RATE)) then
		item1=0x0000;
	end
	
	--------------------
	-- Play event and give item
	--------------------	
	event0x0000 = Event(0x0000);
	event0x0000:setParams(item1,broke);
	player:startEvent(event0x0000);
	player:addItem(item1);

else
	player:showText(npc,862);
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

	Pickaxe = trade:hasItemQty(0x025D,1);
	if (Pickaxe == 1) then
		onTrigger(player,npc);
	end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;
