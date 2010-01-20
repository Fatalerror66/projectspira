-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Rainhard
-- 	Basic Chat Text, Missions
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


---  Events -------
-- 0022 : "no one is allowed to meet with the archduke or the ducal scientists.. " early CoP Mission?
-- 0041 : final CS for CoP 3.2 "A Vessel Without a Captain"
-- 003A : Pherimociel CS for CoP 5.3T2 (Tenzen Path/"Branded")
-- 00A5 : "just a moment, I need to see your archdukal audience permit" (param 1 sets whether you have it) 
-- 008A : don't have an archdukal audience permit
-- 003C : Magicite mission (2nd CS) after returning with Magicite
-- 008E : opening CS for "Storms of Fate"
-- 008F : final CS for "Storms of Fate"
-- 00A1 : opening CS for "Shadows of the Departed"
-- 00A2 : final CS for "Shadows of the Departed"
-- 007B : opening CS for "Apocalypse Nigh"


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event = Event(0x00A5);
if (player:hasKeyItem(0x38) == 1) then
  event:setParams(1);
end;
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