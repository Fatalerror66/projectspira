-----------------------------------
--	Author: Tenjou
-- 	IMMIGRATION OFFICER: Rakano-Marukano
-- 	Offers immigration services.  Needs fine-tuning,and will need work once conquest is implemented.
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


 
nation = player:getNation();
rank = player:getRank();
money = player:getCurrGil();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (nation ~= 2) then
	if (player:getVar("missionFlagged") ~= 1) then
		local event0x2712 = Event(0x2712);
		event0x2712:setParams(0,1,rank,2,money,(rank*400));
		player:startEvent(event0x2712);
	else
		player:startEvent(Event(0x2713));
	end
else
	local event0x2714 = Event(0x2714);
	event0x2714:setParams(0,0,0,nation);
	player:startEvent(event0x2714);
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
local rank = player:getRank();
if (csid == 0x2712 and option == 1) then
	player:setCurrGil(player:getCurrGil()-(rank*400));
	player:setNation(0x2);
end
end;