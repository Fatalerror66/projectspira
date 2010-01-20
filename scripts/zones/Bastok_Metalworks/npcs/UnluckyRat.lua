-----------------------------------
--	Author: Almendro
-- 	UnluckyRat
-- 	"Mean Machine" Quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
    SlimeOil = 0x27D; -- 637
ScrollofWarp = 0x1305; -- 4869
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bflvl= player:getFameLevel(1);
MeanMachine = player:getQuestStatus(1,25);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 2 and MeanMachine == 0)then
	player:startEvent(Event(0x22C));
	player:addQuest(1,25);
elseif(MeanMachine == 1)then
	player:startEvent(Event(0x22F));
else
	player:startEvent(Event(0x0226));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
MeanMachine = player:getQuestStatus(1,25);
      count = trade:getItemCount();
  SlimeOil1 = trade:hasItemQty(SlimeOil,1);
        gil = trade:getGil();
-- Complete "Mean Machine" Quest
if (MeanMachine == 1 and SlimeOil1 and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x22D));
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x22D)then
	player:completeQuest(1,25);
	player:addItem(ScrollofWarp);
	player:specialMessage(ITEM_OBTAINED,ScrollofWarp);
	player:addFame(1,BAS_FAME*90);
end
end;