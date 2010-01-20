-----------------------------------
--	Author: ReaperX
-- 	Cermet Door
--	Door opens when you trade Delkfutt Key to it
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");

KeyitemDelkfuttKey = 0x457;
ItemDelkfuttKey = 0x225;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(KeyitemDelkfuttKey) == 1) then -- has Delkfutt Key Key item
	player:startEvent(Event(0x10))
else
  player:startEvent(Event(0xA)) -- door is firmly shut
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

if (trade:getItemCount() == 1) and (trade:hasItemQty(ItemDelkfuttKey,1)) then
  player:startEvent(Event(0x10))
  trade:isComplete();
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x10) and (option == 1) and (player:hasKeyItem(KeyitemDelkfuttKey) == 0) then 
  player:specialMessage(KEYITEM_OBTAINED, KeyitemDelkfuttKey);
	player:addKeyItem(KeyitemDelkfuttKey);
end;
end;