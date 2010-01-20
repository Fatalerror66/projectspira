-----------------------------------
--	Author: ReaperX
-- 	Engraved Tablet _27a
-- 	Ports the player to Sharug Isle (Zeni NM Tyger spawn site) with key item "Cyan Deep Salt".

--  Not implemented: event 0x0132 (see below). 
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
-- 0x0132 "Sprinkle some Salt on the Tablet?" yes -> "The salt grains patter against the stone tablet and scatter all 
-- over the ground. You could have sworn hearing the tinkling sound of a bell..." you get this event when you try to warp
-- in and the NM is already popped.

if (player:hasKeyItem(0x03FA) == 1) then
  event = Event(0x0130);
  player:startEvent(event); 
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
if ((csid ==0x0130) and (option == 1)) then
  player:removeKeyItem(0x03FA);
end;
end;
