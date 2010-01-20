-----------------------------------
--	Author: Tenjou, ReaperX
-- 	OBJECT: Ancient Magical Gizmo
-- 	Part of Windurst Mission 1-2.
-----------------------------------

require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

if (player:getMissionStatus(2,1) == 1) and (player:getVar("mission_status") == 3) then 
	if (player:getVar("receptacle_h_full") == 1) then
		player:specialMessage(0);
  else
    orb = place_orb(player);
    player:specialMessage(1,0,0,orb);
    if (orb == SixthDarkManaOrb) then
      player:specialMessage(5);
      player:setVar("mission_status",4);
    end;
    player:setVar("receptacle_h_full",1);
    player:startEvent(Event(0x3d));
	end;
elseif (player:getMissionStatus(2,1) == 1) and (player:getVar("mission_status") == 5) then 
	if (player:getVar("receptacle_h_full") == 0) then
		player:specialMessage(3);
  else
    orb = take_orb(player);
    player:specialMessage(2,0,0,0,orb);
    if (orb == SixthGlowingManaOrb) then
      player:specialMessage(4);
      player:setVar("mission_status",6);
    end;
    player:setVar("receptacle_h_full",0);
    player:startEvent(Event(0x31));
	end;
else
	player:specialMessage(12);
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
end;