-----------------------------------
--	Author: Arcanedemon
-- 	San d'Oria Border Guard
-- 	Currently sets homepoint.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Argument 6 here is how much gil she will charge to set the home point.  
--Most likely it is based on conquest.
--0: 100 gil
--1: 100 gil
--2: 200 gil
--3: 400 gil
--4: 800 gil
--5: 1600 gil
--6: 2400 gil
--7: 3200 gil
--8: 4000 gil
--9: 4800 gil
--A to 1F: 5600 gil
--The cycle then repeats.
nation = player:getNation();
event0x7ffB = Event(0x87ffB)
if (nation ~= 0) then
	event0x7ffB:setParams(0x10720,0,0x2d,0,0,0,0x15e,0);
end
player:startEvent(event0x7ffB);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
npc = player:getTarget();
--print("CSID:",csid);
--print("RESULT:",option);
nation = player:getNation();
gil = player:getCurrGil();
SetHPGil = 100;

if (option == 4) then
	if (nation ~= 0) then
		if (gil >= SetHPGil) then
			player:removeGil(SetHPgil);
			player:setHomePoint();
			
			
			
			
			math.randomseed(os.time());
			Text = math.random(0,1);
			Text = math.random(0,1);
			Text = math.random(0,1);
			if (Text == 0) then
				player:showText(npc,161);
			else
				player:showText(npc,1053);
			end
		else
			player:showText(npc,1054);
		end
	else
		player:setHomePoint();
		
		
		
		
		math.randomseed(os.time());
		Text = math.random(0,1);
		Text = math.random(0,1);
		Text = math.random(0,1);
		if (Text == 0) then
			player:showText(npc,161);
		else
			player:showText(npc,1053);
		end
	end
end
end;