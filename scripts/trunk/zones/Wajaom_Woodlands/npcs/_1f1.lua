-----------------------------------
--	Author: ReaperX
-- 	Engraved Tablet _1f1
-- 	Ports the player to Wajaom Woodlands Islet (Zeni NM Tinnin spawn site) with key item "Sicklemoon Salt".

--  Not implemented: event 0x0204 (see below). I don't recall ever seeing that event.
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
-- 0x0202 "Sprinkle some Salt on the Tablet?" yes -> "Lost Key Item: Sicklemoon Salt", event teleports you to Islet
-- 0x0203 "Place your hand on the tablet?"
-- 0x0204 "Sprinkle some Salt on the Tablet?" yes -> "The salt grains patter against the stone tablet and scatter all 
-- over the ground. You could have sworn hearing the tinkling sound of a bell..."

if (player:hasKeyItem(0x03F8) == 1) then
  event = Event(0x0202);
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
if ((csid ==0x0202) and (option == 1)) then
  player:removeKeyItem(0x03F8);
end;
end;
