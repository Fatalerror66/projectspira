-----------------------------------
--	Author: Arcanedemon,Almendro
-- 	Logging Point
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- Initialization
FallenStar = 0x04A8;
hatchet = 0x03FD;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
math.randomseed(os.time());
has_hatchet = player:hasItem(hatchet);
WishUponaStar = player:getQuestStatus(1,64);
if (has_hatchet ~= 0 and has_hatchet ~= nil) then
	--------------------
	-- Determine if Sickle breaks
	--------------------
	broke = 0;
	hatchetbreak = math.random();
	hatchetbreak = math.random();
	hatchetbreak = math.random();

	--------------------
	-- Begin Gear Bonus
	--------------------
	Body = player:getEquip(6);
	Hands = player:getEquip(7);
	Legs = player:getEquip(8);
	
	if (Body == 0x3826 or Body == 0x3827) then
		hatchetbreak = hatchetbreak + 0.073;
	end
	if (Legs == 0x37D9 or Legs == 0x37DA) then
		hatchetbreak = hatchetbreak + 0.073;
	end
	if (Hands == 0x39E1 or Hands == 0x39E2) then
		hatchetbreak = hatchetbreak + 0.073;
	end
	--------------------
	-- End Gear Bonus
	--------------------
	
	if (hatchetbreak < LOGGING_BREAK_CHANCE) then
		broke = 1;
		player:removeItem(0x03FD,1);
	end
	
	--------------------
	-- Define array of possible results
	-- Loged = Item,MaxRate
	-- MaxRate = Previous MaxRate + Rate
	--------------------
	Loged = {0x02BE,0.0120,
		0x02BC,0.0520,
		0x03AC,0.0920,
		0x039B,0.1620,
		0x0390,0.3070,
		0x02B1,0.4780,
		0x02B0,0.7290,
		0x02D1,0.9800,
		0x04D5,1.0000};

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
		if (Rate <= Loged[i+1]) then
			item1 = Loged[i];		
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
	if (Rate <= (1 - LOGGING_RATE)) then
		item1=0x0000;
	end
	
	--------------------
	-- "Wish Upon a Star" Quest
	if(WishUponaStar == 1 and player:hasItem(FallenStar) == 0)then 
		item1 = FallenStar;
	end
	--------------------
	
	--------------------
	-- Play event and give item
	--------------------	
	event0x000A= Event(0x000A);
	event0x000A:setParams(item1,broke);
	player:startEvent(event0x000A);
	player:addItem(item1);

else
	player:specialMessage(1403,hatchet); -- Logging is possible here if you have <a> <01 05 24 82 80 80 80>.
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	has_hatchet = trade:hasItemQty(hatchet,1);
	if (has_hatchet) then
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
