-----------------------------------
--	Author: Almendro
-- 	Old Toolbox
-- 	Scripted: Hearts of Mythril
-----------------------------------

require("scripts/globals/settings");

function onTrigger(player,npc)
TheEleventhsHour = player:getQuestStatus(1,7);
if(TheEleventhsHour and player:getVar("TheEleventhsHour") == 1) then
	player:startEvent(Event(0x17));
else
	player:startEvent(Event(0x16));
end
end;

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if( csid == 0x17 and option == 0 )then
	player:addKeyItem(0x18);
	player:setVar("TheEleventhsHour",2);
end
end;