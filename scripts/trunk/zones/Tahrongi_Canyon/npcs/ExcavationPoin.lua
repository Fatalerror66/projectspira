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
	Mined = {0x0370,0.2820,
		0x0382,0.4840,
		0x037B,0.6160,
		0x037D,0.7660,
		0x43F4,0.8870,
		0x0381,0.9270,
		0x0380,0.9550,
		0x0375,0.9830,
		0x0760,1.0000};

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
	event0x0385 = Event(0x0385);
	event0x0385:setParams(item1,broke);
	player:startEvent(event0x0385);
	player:addItem(item1);

else
	player:showText(npc,945);
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
