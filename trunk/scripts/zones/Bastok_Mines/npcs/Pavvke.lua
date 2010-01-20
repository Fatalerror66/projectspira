-----------------------------------
--	Author: ChrisKara10 & Almendro
-- 	Pavvke
--	"Fallen Comrades"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bflvl = player:getFameLevel(1);
FallenComrades = player:getQuestStatus(1,19);
----------------------------------
-- Dialogues,cutscenes,etc. go below.
----------------------------------
if (bflvl >= 2 and FallenComrades == 0) then
	player:startEvent(Event(0x5A));
	player:addQuest(1,19);
else	
	player:startEvent(Event(0x30));
end; 
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
FallenComrades = player:getQuestStatus(1,19);
SilverNameTag = 0x333C; -- 13116
SilverNameTag1 = trade:hasItemQty(SilverNameTag,1);
count = trade:getItemCount();
gil = trade:getGil();

if(SilverNameTag1 and FallenComrades ==1 and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x5B));
elseif(SilverNameTag1 and FallenComrades ==2 and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x5C));
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x5B)then
	player:completeQuest(1,19);
	player:addFame(1,BAS_FAME*60);
	player:addGil(GIL_RATE*550);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*550);
elseif(csid == 0x5C)then
	player:addFame(1,BAS_FAME*10);
	player:addGil(GIL_RATE*550);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*550);
end
end;
