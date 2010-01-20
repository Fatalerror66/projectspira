-----------------------------------
--	Author: ReaperX
-- 	Door to the President's office
-- 	
--  "Only those on special missions and high-ranking Bastokan adventurers may enter."
--  Not sure what the official behavior of that door is but I scripted it so that
--  you can enter it only if you are Bastokan and on or past missio 2.3. 
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--[[ 											events

02C9 -- opening CS for 2.3 "The Emissary"
025C -- The doors lead to the president's office. Enter (yes/no)
02CB -- opening CS for 2.1 "The Four Musketeers"
025A -- CS for 5.2 "Xarcabard, Land of Truths"
025B -- final CS for 5.2 "Xarcabard, Land of Truths"
030C -- opening CS for Bastok 9.2 "Where Two Paths Converge"
030E -- final CS for 9.2."Where Two Paths Converge"- Rank 10!
033B -- participate in Conflict (Bastok citizen)
033C -- participate in Conflict (Sandy citizen)
033D -- participate in Conflict (Windy citizen)
02D1 -- CS for 5.1 "Darkness Rising"
02D0 -- CS for 5.1 "Darkness Rising"
02D2 -- final CS for 5.1 "Darkness Rising"
02BE -- "Only those on special missions and high-ranking Bastokan adventurers may enter."

--]]

if (player:getMissionStatus(1,23) == 1) and (player:getVar("mission_status") == 1) then  -- When Two Paths Converge
  player:startEvent(Event(0x030C))
elseif (player:getNation() == 1) and (player:getMissionStatus(1,5)>0)  then
  player:startEvent(Event(0x025C));
else
  player:startEvent(Event(0x02BE));
end
end; 
 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc)
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x30C) then
  player:setVar("mission_status",2);
end
end;