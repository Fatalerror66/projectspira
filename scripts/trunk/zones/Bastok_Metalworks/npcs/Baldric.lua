-----------------------------------
--	Author: Almendro
-- 	Baldric
-- 	"Stardust" Quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
Sunsand =0x1F7;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bflvl = player:getFameLevel(1);
Stardust = player:getQuestStatus(1,24);
Stardust_tempVar = player:getVar("Stardust_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 2 and Stardust == 0)then
	player:startEvent(Event(0x22A));
elseif(Stardust == 2 and player:getVar("Stardust_tempVar") == 0)then
	player:startEvent(Event(0x22A));
else
	player:startEvent(Event(0x228));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
Stardust = player:getQuestStatus(1,24);
   count = trade:getItemCount();
Sunsand1 = trade:hasItemQty(Sunsand,1);
gil = trade:getGil();

if((Stardust == 1 or player:getVar("Stardust_tempVar") == 1) and Sunsand1 and count == 1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0x22B));
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
Stardust = player:getQuestStatus(1,24);
if(csid == 0x22A)then
	if(Stardust == 0)then
		player:addQuest(1,24);
	end
	player:setVar("Stardust_tempVar",1);
elseif(csid == 0x22B)then
	if(Stardust == 1)then
		player:completeQuest(1,24);
		player:addFame(1,BAS_FAME*130);
	else
		player:addFame(1,BAS_FAME*18);
	end
	player:addGil(GIL_RATE*300);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*300);
	player:setVar("Stardust_tempVar",2);
end
end;