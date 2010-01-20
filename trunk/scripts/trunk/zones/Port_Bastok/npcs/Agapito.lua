-----------------------------------
--	Author: Almendro
-- 	Agapito
-- 	The Stars of Ifrit
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
Carrierpigeonletter = 0xA2;
        Airshippass = 0x8;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
        TheStarsofIfrit = player:getQuestStatus(1,42);
has_Carrierpigeonletter = player:hasKeyItem(Carrierpigeonletter);
        has_Airshippass = player:hasKeyItem(Airshippass);
                  bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 3 and has_Airshippass == 1 and TheStarsofIfrit == 0)then
	player:startEvent(Event(0xB4));
	player:addQuest(1,42);
elseif(TheStarsofIfrit == 1 and has_Carrierpigeonletter == 1)then
	player:startEvent(Event(0xB5));
else
	player:startEvent(Event(0x11));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xB5)then
	player:completeQuest(1,42);
	player:addGil(GIL_RATE*2100);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*2100);
	player:setTitle(101);
	player:addFame(1,BAS_FAME*120);
	player:removeKeyItem(Carrierpigeonletter);
end
end;