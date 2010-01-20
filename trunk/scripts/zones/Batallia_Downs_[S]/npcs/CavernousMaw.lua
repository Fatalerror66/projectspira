-----------------------------------
--	Author: ReaperX
-- 	Cavernous Maw
-- 	Teleports Players to Batallia Downs
-----------------------------------

PureWhiteFeather = 0x38E;

require("scripts/globals/settings");

function onTrigger(player,npc)
	if player:getVar("BATALLIA_MAW") == 0 then
		player:setVar("BATALLIA_MAW",1);
		player:startEvent(Event(0x64));
	else
		player:startEvent(Event(0x65));
	end
end;

function onEventSelection(player,csid,option) 
--print("**CSID:",csid);
--print("**RESULT:",option);
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
if ((csid == 0x64) or (csid == 0x65)) and (option == 1) then
	player:setPos(-49, 0, 435, 1, 0x69); -- Batallia Downs maw
end;
end;