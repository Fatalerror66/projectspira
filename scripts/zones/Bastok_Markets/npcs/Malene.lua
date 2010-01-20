-----------------------------------
--	Author: ChrisKara10,Almendro
--  Malene
--  "The Light of the Day","Wish Upon a Star"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
SteamClock = 0x226;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TheLightColdoftheDay = player:getQuestStatus(1,11);
TheLightColdoftheDay_tempVar = player:getVar("TheLightColdoftheDay_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Wish Upon a Star"
if (player:getVar("wishUponAStar") == 1) then
	player:startEvent(Event(0x14A));
	player:setVar("wishUponAStar",2);
-----------------------------------
-- "The Light of the Day"
elseif(TheLightColdoftheDay == 0 or TheLightColdoftheDay_tempVar == 0)then
	player:startEvent(Event(0x66));
-----------------------------------
-- Default text chat
else
	player:startEvent(Event(0x70));
end
-----------------------------------
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
TheLightoftheDay = player:getQuestStatus(1,11);
           count = trade:getItemCount();
             gil = trade:getGil();
     SteamClock1 = trade:hasItemQty(SteamClock,1);
if ((TheLightoftheDay == 1 or TheLightColdoftheDay_tempVar == 1) and SteamClock1 and count == 1 and gil == 0 ) then 
	trade:isComplete();	
	player:startEvent(Event(0x68));	
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x66)then
	TheLightColdoftheDay = player:getQuestStatus(1,11);
	if(TheLightColdoftheDay == 0)then
		player:addQuest(1,11);
	end
	player:setVar("TheLightColdoftheDay_tempVar",1);
elseif(csid == 0x68)then
	TheLightoftheDay = player:getQuestStatus(1,11);
	if(TheLightoftheDay == 1)then
		player:addFame(1,BAS_FAME*150);
		player:setTitle(100);
		player:completeQuest(1,11);
	else		
		player:addFame(1,BAS_FAME*15);
	end
	player:addGil(GIL_RATE*500);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*500);
	player:setVar("TheLightColdoftheDay_tempVar",2);
end
end;
