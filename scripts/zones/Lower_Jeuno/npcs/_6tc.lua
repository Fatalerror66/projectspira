-----------------------------------
--	Author: Tenjou, ReaperX
-- 	DOOR: Neptune's Spire
-- 	Lets qualified players into the Tenshodo; CoP Mission 3.2 CS
--  to do: add optional dialog with Harnek telling player to go to Ru'Lude Gardens
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
tenshodo = player:hasKeyItem(0x76);
--print("NPC:",npc);

cop_status = player:getMissionStatus(6,12);                               -- on CoP Mission 3.2 "A Vessel Without a Captain"?
vessel_without_a_captain_status = player:getVar("VesselWithoutACaptain"); -- 0 indicates no CS yet
--0x16 Tending Aged Wounds CS (Needs to be added when mission log works)

if (cop_status ==1) and (vessel_without_a_captain_status == 0) then
  player:startEvent(Event(0x56));
else
  if (tenshodo ~= 1) then
	  player:showText(npc,1007);
  else --Won't work until sendRelease works properly.
	  --player:startEvent(Event(0x69));
	  npc:setState(5); --Temp solution.
  end
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
if (csid == 0x69) then
	--player:sendRelease(2);
elseif  (csid == 0x56) then
   player:setVar("VesselWithoutACaptain",1);                      -- now we need to get CS in Ru'Lude Gardens
end
end;