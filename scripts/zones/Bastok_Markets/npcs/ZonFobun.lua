-----------------------------------
--	Author: ChrisKara10, Almendro
--  Zon - Fobun
--	"The Curse Collector"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
 Cursepaper = 0x8B;
PoisonCesti = 0x4003;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bflvl = player:getFameLevel(1);
TheCurseCollector = player:getQuestStatus(1,34);
TCC_Curse_tempVar = player:getVar("TCC_Curse_tempVar");
 TCC_Mute_tempVar = player:getVar("TCC_Mute_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------	
-- "The Curse Collector"
if (bflvl >= 4 and TheCurseCollector == 0) then
	player:startEvent(Event(0xFB));
elseif(TheCurseCollector == 1 and TCC_Curse_tempVar == 1 and TCC_Mute_tempVar == 1)then
	player:startEvent(Event(0xFC));
elseif(TheCurseCollector == 2)then
	player:startEvent(Event(0xFD));
else
	player:startEvent(Event(0xFA));
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
if(csid == 0xFB)then
	player:addQuest(1,34);
	player:addKeyItem(Cursepaper);
	player:specialMessage(KEYITEM_OBTAINED,Cursepaper);
elseif(csid == 0xFC)then
	if(player:getFreeSlotCount(0) >= 1 )then
		player:completeQuest(1,34);
		player:removeKeyItem(Cursepaper);
		player:addItem(PoisonCesti);
		player:specialMessage(ITEM_OBTAINED,PoisonCesti);
		player:addFame(1,BAS_FAME*160);
		player:setVar("TCC_Curse_tempVar",0);
		player:setVar("TCC_Mute_tempVar",0);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,PoisonCesti);
	end
end
end;