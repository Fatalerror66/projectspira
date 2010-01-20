-----------------------------------
--	Author: Arcanedemon
-- 	Logging Point
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
hatchet = player:hasItem(0x03FD);
if (hatchet ~= 0 and hatchet ~= nil) then

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
	Loged = {0x02B9,0.0530,
		0x02B2,0.1060,
		0x02B7,0.2050,
		0x02B3,0.4400,
		0x02BA,0.6950,
		0x02B0,1.0000};

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
	-- Play event and give item
	--------------------	
	event0x0064= Event(0x0064);
	event0x0064:setParams(item1,broke);
	player:startEvent(event0x0064);
	player:addItem(item1);

else
	player:showText(npc,1282);
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

	hatchet = trade:hasItemQty(0x03FD,1);
	if (hatchet) then
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
