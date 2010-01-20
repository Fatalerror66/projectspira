-----------------------------------
--	Author: ReaperX
-- 	Door:Audience Chamber
-- 	"Magicite" Mission

-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
require("scripts/zones/Rulude_Gardens/TextIDs");
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- events: --------------------
-- 0041 : final CS for CoP 3.2 "A Vessel Without a Captain"
-- (003a) : Pherimociel CS for CoP 5.3T2 (Tenzen Path/"Branded")
-- 008a : don't have an archdukal audience permit
-- 0080 : Magicite mission (1st CS)
-- 003c : Magicite mission (2nd CS) after returning with Magicite
-- 2740 : CS for CoP Mission 6.2 "A Place to Return "
-- 2742 : CS for CoP Mission 6.3 "More Questions than Answers"
-- 2743 : CS for CoP Mission 7.2 " Flames in the Darkness "
-- 007a : CS for CoP Mission 8.4 "Dawn"
-- 008e : opening CS for "Storms of Fate"
-- 008f : final CS for "Storms of Fate"
-- 00A1 : opening CS for "Shadows of the Departed"
-- 00A2 : final CS for "Shadows of the Departed"
-- 007b : opening CS for "Apocalypse Nigh"

mission_status =  player:getVar("mission_status");

if (player:getRank() == 4) and (mission_status == 1) then
  player:startEvent(Event(0x80));   			   -- always offers airship pass (tried setting all params to 1 but had no effect)
elseif (player:hasKeyItem(MagiciteOptistone)  + player:hasKeyItem(MagiciteAurastone)  + player:hasKeyItem(MagiciteOrastone) == 3) then
  event = Event(0x3c);
  if (player:hasKeyItem(AirshipPass) == 1) then 
    event:setParams(1);
  end;
  player:startEvent(event);
elseif (player:hasKeyItem(ArchducalAudiencePermit) == 1) then
  player:specialMessage(EMBASSY + 73);        -- "Nobody sees the sovereign without an appointment!"
else
  player:startEvent(Event(0x8a));    -- you don't have a permit
end;
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
if (csid == 0x0080) then
  player:setVar("mission_status",2);
  player:currentMission(player:getNation(),13);
  player:addKeyItem(LetterToAldo);
  player:specialMessage(KEYITEM_OBTAINED,LetterToAldo); 
elseif (csid == 0x003c) then
  player:removeKeyItem(MagiciteOptistone);
  player:removeKeyItem(MagiciteAurastone);
  player:removeKeyItem(MagiciteOrastone);
  if (player:hasKeyItem(AirshipPass) == 1) then      
    player:addGil(GIL_RATE*20000)
    player:specialMessage(GIL_OBTAINED,GIL_RATE*20000); 
    player:setTitle(421) -- "Conqueror of Fate"
  else
    player:addKeyItem(AirshipPass);
    player:specialMessage(KEYITEM_OBTAINED,AirshipPass); 
    player:setTitle(212) -- "Have wings will fly"
  end
  player:setVar("mission_status",6);               -- all that's left is to go back to the embassy
end
end;