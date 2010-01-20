-----------------------------------
--	Author: ReaperX
-- 	Cavernous Maw
-- 	Teleports Players to Rolanberry Fields
-----------------------------------

PureWhiteFeather = 0x38E;

require("scripts/globals/settings");

function onTrigger(player,npc)
	if player:getVar("ROLANBERRY_MAW") == 0 then
		player:setVar("ROLANBERRY_MAW",1);
		player:startEvent(Event(0x65));
	else
		player:startEvent(Event(0x66));
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
if ((csid == 0x65) or (csid == 0x66)) and (option == 1) then
	player:setPos(-193, 8, 360, 0, 0x6E); -- Rolanberry_Fields maw
end;
end;