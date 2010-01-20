-----------------------------------
--	Author: ReaperX
-- 	Engraved Tablet _27b
-- 	Ports player back to Hevida Isle, behind stone tablet.
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
-- Engraved Tablet Events: --------------------
-- 0x0130 "Sprinkle some Salt on the Tablet?" yes -> "Lost Key Item: Cyan Deep Salt", event teleports you to Sharug Isle
-- 0x0131 "Place your hand on the tablet?"
-- 0x0132 "Sprinkle some Salt on the Tablet?"

player:startEvent(Event(0x0131)); 
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
