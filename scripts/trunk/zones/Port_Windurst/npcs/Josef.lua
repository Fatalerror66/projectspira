-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Josef
-- 	Involved in Bastok Mission 2-3.  The other text events he has during and after are: 0x34,0x3b,0x3c,0x41,and 0x46.

-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
------------- events: --------------
-- 002D  default welcome
-- 0034  "the real magical weapons will be shipped back to Bastok.." (Bastok 2.3, Windurst to San d'Oria)
-- 003B  "the whole yagudo thing got messy because the Windurstians tried to play nice with them.."
-- 003C  "both our country and jeuno should tell them that this isn't going to get the anywhere.."
-- 0041 " you wonder whether something can be done about the amicable relationships between Windurst and the Yagudo?"
-- 0046 "I've heard already, But I don't believe my ears! We're in a load of trouble now! I'd better tell my old wife too..but it's top secret."

-- ReaperX: I'm not exactly sure at which stage of The Emissary he makes these statements, so I've assigned them based on what sounds
-- logical at the time. 

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(1,7) == 1) and ((mission_status >= 10) and (mission_status <= 14)) then
  player:startEvent(Event(0x34))
elseif (player:getMissionStatus(1,9) == 1) and (mission_status >= 7) and (mission_status <= 9) then
  player:startEvent(Event(0x41));
elseif (player:hasKeyItem(KindredReport) == 1) then 
  player:startEvent(Event(0x46));
elseif (emissary_status2 == 1) and (mission_status == 12) then
  player:startEvent(Event(0x3B))
elseif (emissary_status2 == 1) and (mission_status == 15) then       
  player:startEvent(Event(0x34))														
else
  player:startEvent(Event(0x2d));
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
end;