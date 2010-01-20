-----------------------------------
--	Author: ChrisKara10 & Almendro
--  Aquillina	
--  Description: Only gives quest "A Flash in the Pan"
--  Modifications: Almendro - Updated
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
     AFlashinthePan = player:getQuestStatus(1,14);
AFlashinthePanTimer = getGlobalVar("AFlashinthePan-Timer");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (AFlashinthePan ~=2) then
	player:startEvent(Event(0xD9));
	player:addQuest(1,14);
elseif (AFlashinthePan == 2) then
	if(os.time() >= AFlashinthePanTimer)then
		player:startEvent(Event(0xD9));
	else
		player:startEvent(Event(0x74));
	end	
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
      count = trade:getItemCount();
        gil = trade:getGil();
 FlintStone = 0x300; -- 768
FlintStone4 = trade:hasItemQty(FlintStone,4);

      AFlashinthePan = player:getQuestStatus(1,14);
AFlashinthePanRepeat = player:getVar("AFlashinthePanRepeat");
 AFlashinthePanTimer = getGlobalVar("AFlashinthePan-Timer");

if (FlintStone4 and count == 4 and gil == 0 and AFlashinthePan ~= 0) then
	--timer check!
	if (os.time() < AFlashinthePanTimer) then
		player:startEvent(Event(0xDA));
	else
		trade:isComplete();
		player:startEvent(Event(0xDB));
	end
end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
AFlashinthePan = player:getQuestStatus(1,14);
if(csid == 0xDB)then	
	if(AFlashinthePan == 1)then
		player:completeQuest(1,14);
		player:addFame(1,BAS_FAME*80);
	else
		player:addFame(1,BAS_FAME*10);
	end
	player:addGil(GIL_RATE*100);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*100);
	--The entire server must now wait 15 minutes to attempt this quest again.
	setGlobalVar("AFlashinthePan-Timer",os.time()+900);
end
end;