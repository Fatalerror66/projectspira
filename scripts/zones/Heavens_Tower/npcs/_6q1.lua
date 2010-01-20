-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Door: Starway Stairway
-- 	Opens if player has key item Starway Stairway Bauble
-----------------------------------

StarwayStairwayBauble = 0x24;

-- events:
-- 69 
-- 6A 


-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

nation = player:getNation();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (nation == 2) then
	if (player:hasKeyItem(StarwayStairwayBauble) == 1) then
		if (player:getXPos() < -14) then
			player:startEvent(Event(0x6A));
		else
			player:startEvent(Event(0x69));
		end;
	else
	  player:specialMessage(554);
	end;
else
	player:specialMessage(555);
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
--print("CSID:",csid);
--print("RESULT:",option);
end;