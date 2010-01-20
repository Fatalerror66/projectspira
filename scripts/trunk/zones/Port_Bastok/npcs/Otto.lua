-----------------------------------
--	Author: Arcanedemon
-- 	Otto
-- 	Basic Chat Text
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
      TheSirensTear = player:getQuestStatus(1,0);
TheSirensTearRepeat = player:getVar("TheSirensTearRepeat");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(TheSirensTear == 1 or TheSirensTearRepeat == 1)then
	player:startEvent(Event(0x5));
else
	player:startEvent(Event(0x14));
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
--print("CSID:",csid);
--print("RESULT:",option);
end;