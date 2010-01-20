-----------------------------------
--	Author: Arcanedemon
-- 	Mining Point
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
	
	--------------------
	-- Begin Gear Bonus
	--------------------
	Body = player:getEquip(6);
	Hands = player:getEquip(7);
	Feet = player:getEquip(9);
	
	if (Body == 0x3826 or Body == 0x3827) then
		pickaxebreak = pickaxebreak + 0.073;
	end
	if (Hands == 0x39E1 or Hands == 0x39E2) then
		pickaxebreak = pickaxebreak + 0.073;
	end
	if (Feet == 0x3760 or Feet == 0x3761) then
		pickaxebreak = pickaxebreak + 0.073;
	end
	--------------------
	-- End Gear Bonus
	--------------------
	
	if (pickaxebreak < MINING_BREAK_CHANCE) then
		broke = 1;
		player:removeItem(0x025D,1);
	end
	
	--------------------
	-- Define array of possible results
	-- Mined = Item,MaxRate
	-- MaxRate = Previous MaxRate + Rate
	--------------------
	Mined = {0x0676,0.1155,
		0x0282,0.2300,
		0x0280,0.3415,
		0x0281,0.4530,
		0x02E0,0.5595,
		0x0283,0.6590,
		0x0660,0.7285,
		0x0659,0.7930,
		0x0666,0.8525,
		0x0238,0.9100,
		0x065F,0.9676,
		0x0285,0.9762,
		0x0284,0.9848,
		0x02E1,0.9924,
		0x02E2,1.0000};
	
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
	if (Rate <= 0.50) then
		item1=0x0000;
	end
	
	--------------------
	-- Play event and give item
	--------------------	
	event0x000B = Event(0x000B);
	event0x000B:setParams(item1,broke);
	player:startEvent(event0x000B);
	player:addItem(item1);

else
	--player:showText(npc,1248);
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
