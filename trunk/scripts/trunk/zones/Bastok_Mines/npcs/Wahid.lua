-----------------------------------
--	Author: SharXeniX, Numbaone, Almendro
-- 	Bastok Mine's - Wahid
--	Quest "The Siren's Tear".
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
SirensTear = 0x240; --Initiation 576
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TheSirensTear = player:getQuestStatus(1,0);
TheSirensTearRepeat = player:getVar("TheSirensTearRepeat");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (TheSirensTear == 0 or TheSirensTearRepeat == 0) then
	player:startEvent(Event(0x51));
	elseif
	(TheSirensTear >= 1 or TheSirensTearRepeat == 1) then
	player:startEvent(Event(0x1C));
end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
SirensTear1 = trade:hasItemQty(SirensTear,1);
      count = trade:getItemCount();
        gil = trade:getGil();

if( (TheSirensTear == 1 or TheSirensTearRepeat == 1) and SirensTear and count == 1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x52));
end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x51)then	
		player:addQuest(1,0);	
		player:setVar("TheSirensTearRepeat",1);
elseif(csid == 0x52)then
	if(TheSirensTear == 1)then
		player:addFame(1,BAS_FAME*100);
		player:setTitle(99);
		player:completeQuest(1,0);
	else
		player:addFame(1,BAS_FAME*10);
	end
	player:addGil(GIL_RATE*150);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*150);
	player:setVar("TheSirensTearRepeat",1);
end
end;