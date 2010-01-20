-----------------------------------
--	Author: ChrisKAra10, Almendro
-- 	Degenhard
--  "The Bare Bones"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
           BoneChip = 0x370;
MapoftheDangrufWadi = 0x188;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TheBareBones = player:getQuestStatus(1,38);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (TheBareBones == 0) then
	player:startEvent(Event(0x100));
	player:addQuest(1,38);
else
	player:startEvent(Event(0xFF));
end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
TheBareBones = player:getQuestStatus(1,38);

BoneChip1 = trade:hasItemQty(BoneChip,1);
    count = trade:getItemCount();
      gil = trade:getGil();

if (TheBareBones ~= 2 and BoneChip1 and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x102));
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x102)then
	TheBareBones = player:getQuestStatus(1,38);
	if(TheBareBones == 1)then
		player:completeQuest(1,38);
	else
		player:addQuest(1,38);
		player:completeQuest(1,38);
	end	
	player:addFame(1,BAS_FAME*60);
	player:addKeyItem(MapoftheDangrufWadi);
	player:specialMessage(KEYITEM_OBTAINED,MapoftheDangrufWadi);
end
end