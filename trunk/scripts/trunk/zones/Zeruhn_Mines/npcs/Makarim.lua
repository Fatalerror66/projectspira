-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Makarim
-- 	Basic Chat Text + Bastok Mission "Zeruhn Repotr"
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
require("scripts/zones/Zeruhn_Mines/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

zeruhn = player:getMissionStatus(1,0)
status = player:getVar("mission_status"); 
--print(zeruhn,status);
if (zeruhn == 1) and  (status == 1) then
  player:startEvent(Event(0x79));
elseif (zeruhn == 1) and  (status == 2) then
  player:specialMessage(1056);  -- "Be careful on your way out."
  if (DEBUG_MODE) then
    player:setPos(64, -14, -3, 0, 0xED);   -- to Naji
  end;
else
  player:startEvent(Event(0x68));
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
if (csid == 0x79) then
  player:specialMessage(KEYITEM_OBTAINED, ZeruhnReport); -- zeruhn report
  player:addKeyItem(ZeruhnReport);
  player:setVar("mission_status",2); 
end;
end;