-----------------------------------
--	Author: Almendro
-- 	Waterfall Base
--	"Drachenfall"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
require("scripts/zones/North_Gustaberg/TextIDs");
-----------------------------------
-- Initialization
    BrassCanteen = 0x1ED;
DrachenfallWater = 0x1EC;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	player:specialMessage(1166); -- "You can reach the water from here."
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
      Drachenfall = player:getQuestStatus(1,31);            
    BrassCanteen1 = trade:hasItemQty(BrassCanteen,1);
            count = trade:getItemCount();
              gil = trade:getGil();
if (Drachenfall == 1 and BrassCanteen1 and count == 1 and gil == 0) then
	trade:isComplete();
	player:addItem(DrachenfallWater);
	player:specialMessage(ITEM_OBTAINED,DrachenfallWater);
end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;