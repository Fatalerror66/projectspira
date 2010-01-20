-----------------------------------
--	Author: ChrisKara10, Almendro
-- 	Black Mud
--	"Drachenfall"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- Initialization
    BrassCanteen = 0x1ED;
DrachenfallWater = 0x1EC;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
        Drachenfall = player:getQuestStatus(1,31);
              bflvl = player:getFameLevel(1);
Drachenfall_tempVar = player:getVar("Drachenfall_tempVar");
   has_BrassCanteen = player:hasItem(BrassCanteen);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Drachenfall"
if (bflvl >= 2 and Drachenfall == 0) then
	player:startEvent(Event(0x65));
elseif (Drachenfall == 1 and has_BrassCanteen == 0) then
	player:startEvent(Event(0x66));
else	
	player:startEvent(Event(0x64));
end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
      Drachenfall = player:getQuestStatus(1,31);            
DrachenfallWater1 = trade:hasItemQty(DrachenfallWater,1);
            count = trade:getItemCount();
              gil = trade:getGil();
if (Drachenfall == 1 and DrachenfallWater1 and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x67));
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x65)then
	if(player:getFreeSlotCount(0) >= 1)then
		player:addQuest(1,31);
		player:addItem(BrassCanteen);
		player:specialMessage(ITEM_OBTAINED,BrassCanteen);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,BrassCanteen);
	end
elseif(csid == 0x66)then
	if(player:getFreeSlotCount(0)>=1)then
		player:addItem(BrassCanteen);
		player:specialMessage(ITEM_OBTAINED,BrassCanteen);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,BrassCanteen);
	end
elseif(csid == 0x67)then
	player:completeQuest(1,31);
	player:setTitle(104); -- Drachenfall Ascetic
	player:addFame(1,BAS_FAME*100);
	player:addGil(GIL_RATE*2000);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*2000);
end
end;
