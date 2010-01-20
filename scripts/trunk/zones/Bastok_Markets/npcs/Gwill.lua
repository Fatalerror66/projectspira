-----------------------------------
--  Author: ChrisKara10,Almendro
--  Gwill
--  "The Light Cold of the Day", "The Return of the Adventurer"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
	  Cinnamon = 0x274; -- 628
CottonHeadband = 0x30D2;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
                       bflvl = player:getFameLevel(1);
    TheReturnoftheAdventurer = player:getQuestStatus(1,30);
                FatherFigure = player:getQuestStatus(1,29);
        TheLightColdoftheDay = player:getQuestStatus(1,11);
TheLightColdoftheDay_tempVar = player:getVar("TheLightColdoftheDay_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-----------------------------------
--- "The Light Cold of the Day"
if(TheLightColdoftheDay == 1 or TheLightColdoftheDay_tempVar == 1)then 	
	player:startEvent(Event(0x67));
-----------------------------------
-- "The Return of the Adventurer"
elseif(FatherFigure == 2 and bflvl >=3 and TheReturnoftheAdventurer == 0)then
	player:startEvent(Event(0xF2));
	player:addQuest(1,30);
-----------------------------------
-- Default chat text
else
	player:startEvent(Event(0x71));
end
----------------------------------
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
TheReturnoftheAdventurer = player:getQuestStatus(1,30);
    count = trade:getItemCount();
      gil = trade:getGil();
Cinnamon1 = trade:hasItemQty(Cinnamon,1);

if (TheReturnoftheAdventurer == 1 and Cinnamon1 and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0xF3));
end
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xF3)then
	player:completeQuest(1,30);
	player:addItem(CottonHeadband);
	player:specialMessage(ITEM_OBTAINED,CottonHeadband);
	player:setTitle(93); -- Kulatz Bridge Companion
	player:addFame(1,BAS_FAME*120);
end
end;