-----------------------------------
--	Author: Tenjou
-- 	Kuroido-Moido
-- 	Involved in parts of Windurst Mission 1-1.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


nation = player:getNation();
money = player:getCurrGil();
windymission = player:getVar("windurstMissions");
windyoneone = player:getVar("theHorutotoRuinsExperiment");
windyonetwo = player:getVar("theHeartOfTheMatter");
windyoneoner = player:getVar("theHorutot-HakkuruRinkuruCS");
windyoneoned = player:getVar("theHorutot-MagicalGizmoCS");
windyonethree = player:getVar("thePriceOfPeace");

local glue = player:getVar("makingAmends");
event0x114 = Event(0x114);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (windymission == 0) then
	--Check status of Windurst mission 1-1--
	if (windyoneone == 0) then
		--Check status of quest "Making Amends"
		if (glue == 1) then
			event0x114:setParams(0,0x3a9);
			player:startEvent(event0x114);
		elseif (glue == 2) then
			player:startEvent(Event(0x117));
		else	
			player:startEvent(Event(0xe1));
		end
	elseif (windyoneone == 1) then
		--Check if the player has seen his CS--
		if (windyoneoner == 1) then
			--Check if the player has met the minister but not obtained the keyitem.--
			if (windyoneoned == 1) then
				player:startEvent(Event(0x61));
			else --After his CS but before meeting the minister.--
				if (glue == 1) then
					--May have already accepted his quest.--
					local gluer = math.random();
					if (gluer >= .5) then
						player:startEvent(Event(0x5c));
					else
						player:startEvent(Event(0x114));
					end
				else
					player:startEvent(Event(0x5c));
				end
			end
		else --Recieve his CS.--
			player:startEvent(Event(0x5a));
			player:setVar("theHorutot-HakkuruRinkuruCS",1);
		end
	elseif (windyoneone == 2) then --Need to complete Mission--
		player:startEvent(Event(0x62));
	elseif (windyoneone == 3) then --After completion--
		player:startEvent(Event(0x64));
	end
else
	--Check status of quest "Making Amends"
	if (glue == 1) then
		event0x114:setParams(0,0x3a9);
		player:startEvent(event0x114);
	elseif (glue == 2) then
		player:startEvent(Event(0x117));
	else	
		player:startEvent(Event(0xe1));
	end
end
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
if (csid == 0x112 and option == 1) then
	player:setVar("makingAmends",1);
else
end
end; 