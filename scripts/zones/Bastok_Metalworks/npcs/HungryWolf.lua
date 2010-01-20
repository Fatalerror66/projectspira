-----------------------------------
--	      Author: Almendro
-- 	         NPC: HungryWolf
-- 	Descripction: Basic chat, Smoke on the mountain.
-----------------------------------
-- Modifications:
--  * 07/12/2009 - Almendro: Added "Smoke On The Mountain" Quest
--  * 07/13/2009 - Almendro: Added Bastok fame and modified gil reward to reflect GIL_RATE too
-- To be done: 
--      add "Bait and Switch" quest related stuff
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Meltalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Meltalworks/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local smokemountain = player:getQuestStatus(1,15);
if (smokemountain == 0) then
	player:startEvent(Event(0x1AC));
	player:addQuest(1,15);
else
	player:startEvent(Event(0x01A5));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local smokemountain = player:getQuestStatus(1,15);
count = trade:getItemCount();
sausage = trade:hasItemQty(0x112B,1);
gil = trade:getGil();
-- Complete "Smoke on the mountain" quest ---
if (smokemountain == 1 and sausage and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x1AD));	
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x1AD) then
	player:completeQuest(1,15);
	player:setTitle(87);
	player:addGil(GIL_RATE*300);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*300);
	player:addFame(1,BAS_FAME*40);	
end
end;