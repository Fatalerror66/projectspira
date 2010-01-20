-----------------------------------
--	Author: ReaperX
-- 	Engraved Tablet _1f2
-- 	Ports the player from Wajaom Woodlands Islet (Zeni NM Tinnin spawn site) back to Woodlands main.

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

event = Event(0x0203);
player:startEvent(event); 
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
