-----------------------------------
--	Author: Arcanedemon
-- 	Harvesting Point
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
sickle = player:hasItem(0x03FC);
if (sickle ~= 0 and sickle ~= nil) then

	--------------------
	-- Determine if Sickle breaks
	--------------------
	broke = 0;
	sicklebreak = math.random();
	sicklebreak = math.random();
	sicklebreak = math.random();

	--------------------
	-- Begin Gear Bonus
	--------------------
	Body = player:getEquip(6);
	Legs = player:getEquip(8);
	Feet = player:getEquip(9);
	
	if (Body == 0x3826 or Body == 0x3827) then
		sicklebreak = sicklebreak + 0.073;
	end
	if (Legs == 0x37D9 or Legs == 0x37DA) then
		sicklebreak = sicklebreak + 0.073;
	end
	if (Feet == 0x3760 or Feet == 0x3761) then
		sicklebreak = sicklebreak + 0.073;
	end
	--------------------
	-- End Gear Bonus
	--------------------
	
	if (sicklebreak < HARVESTING_BREAK_CHANCE) then
		broke = 1;
		player:removeItem(0x03FC,1);
	end
	
	--------------------
	-- Define array of possible results
	-- Hrvst = Item,MaxRate
	-- MaxRate = Previous MaxRate + Rate
	--------------------
	Hrvst = {0x05F2,0.1670,
		0x0341,0.3260,
		0x0342,0.4900,
		0x1613,0.5800,
		0x0735,0.6610,
		0x0343,0.7480,
		0x023D,0.8050,
		0x07BD,0.8610,
		0x05F4,0.9020,
		0x07BE,0.9350,
		0x023C,0.9620,
		0x023F,1.0000};

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
		if (Rate <= Hrvst[i+1]) then
			item1 = Hrvst[i];		
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
if (Rate <= (1 - HARVESTING_RATE)) then
		item1=0x0000;
	end
	
	--------------------
	-- Play event and give item
	--------------------	
	event0x0385= Event(0x0385);
	event0x0385:setParams(item1,broke);
	player:startEvent(event0x0385);
	player:addItem(item1);

else
	player:showText(npc,650);
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

	Sickle = trade:hasItemQty(0x03FC,1);
	if (Sickle == 1) then
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
