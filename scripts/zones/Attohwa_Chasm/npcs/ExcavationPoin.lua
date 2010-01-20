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
	Mined = {0x0370,0.2220,
		0x0382,0.4440,
		0x037B,0.5660,
		0x43F4,0.6880,
		0x0381,0.7600,
		0x0380,0.8320,
		0x09C7,0.8740,
		0x04D4,0.9160,
		0x05C1,0.9580,
		0x0301,1.0000};
	
	--------------------
	-- Define array of Colored Rocks
	-- Do not reorder this array or rocks 
	-- will appear on the wrong day
	--------------------
	Rocks = {0x0301,
		0x0302,
		0x0303,
		0x0304,
		0x0305,
		0x0306,
		0x0308,
		0x0307};

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
	-- Determine result if Colored Rock
	--------------------		
	if (item1 == 0x0301) then
		Day = getVanaDayElement();
		item1 = Rocks[Day+1];
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
	event0x000A = Event(0x000A);
	event0x000A:setParams(item1,broke);
	player:startEvent(event0x000A);
	player:addItem(item1);

else
	player:showText(npc,809);
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
