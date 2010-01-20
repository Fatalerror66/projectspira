-----------------------------------
--	Author: Almendro
-- 	MightyFist
-- 	"The Darksmith"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
DarksteelOre = 0x285; -- 645
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
               bflvl = player:getFameLevel(1);
        TheDarksmith = player:getQuestStatus(1,40);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 3 and TheDarksmith == 0)then
	player:startEvent(Event(0x235));
elseif(TheDarksmith == 2)then
	player:startEvent(Event(0x231));
else
	player:startEvent(Event(0x230));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
        TheDarksmith = player:getQuestStatus(1,40);
TheDarksmith_tempVar = player:getVar("TheDarksmith_tempVar");

        count = trade:getItemCount();
          gil = trade:getGil();
DarksteelOre2 = trade:hasItemQty(DarksteelOre,2)
if(TheDarksmith ~= 0 and count == 2 and gil == 0 and DarksteelOre2)then
	trade:isComplete();
	player:startEvent(Event(0x236));
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
TheDarksmith = player:getQuestStatus(1,40);
if(csid == 0x235)then
	if(TheDarksmith == 0)then
		player:addQuest(1,40);	
	end
elseif(csid == 0x236)then
	if(TheDarksmith == 1)then
		player:completeQuest(1,40);
		player:addFame(1,BAS_FAME*220);
	else
		player:addFame(1,BAS_FAME*22);
	end
	player:addGil(GIL_RATE*8000);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*8000);
end
end;