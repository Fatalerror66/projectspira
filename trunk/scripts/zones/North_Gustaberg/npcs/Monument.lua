-----------------------------------
--	Author: Almendro
-- 	Monument
-- 	Scripted: Hearts of Mythril
-----------------------------------

require("scripts/globals/settings");
function onTrigger(player,npc)
HeartsofMythril = player:getQuestStatus(1,6);
BouquetforthePioneers = 0x17;
if(HeartsofMythril == 1 and player:hasKeyItem(BouquetforthePioneers) == 1)then
	player:startEvent(Event(0xB));
else
	player:specialMessage(1155); -- “Here rest the Great Palborough Pioneers.May Gustaberg's warm soil bring peace to their souls.”
end
end;

function onEventFinish(player,csid,option)
if(csid == 0xB and option == 0)then
	player:setVar("heartsOfMythril",2);
	player:removeKeyItem(BouquetforthePioneers);
end
end;