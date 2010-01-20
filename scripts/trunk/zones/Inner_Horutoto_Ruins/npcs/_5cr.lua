-----------------------------------
--	Author: Tenjou/ReaperX
-- 	Ancient Magical Gizmo #3 - south east corner
-- 	Part of Windurst Mission 1-1.  Everything should be working. 
-----------------------------------
require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

gismonumber = 3;
eventid = 0x34;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
--print(npc:getName());
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
gizmo = player:getVar("theHorutot-NeedsGizmo");

if (player:getMissionStatus(2,0) == 1) and (player:getVar("mission_status") == 3) then
	if (player:getVar("needstoexamine3") == 1) then
		player:setVar("needstoexamine3",0);
		if (gizmo == gismonumber) then
			player:startEvent(Event(eventid +1));
			player:setVar("theHorutot-NeedsGizmo",0);
		else
			player:startEvent(Event(eventid));
		end;
	else
		player:specialMessage(MISSIONS+1);  -- You have already examined this receptacle.
	end;
else
	player:specialMessage(6) -- This is a device that recharges Mana Orbs
end

if player:hasKeyItem(CrackedManaOrb) == 1 and DEBUG_MODE then
	toOrastery(player);
end;


end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == eventid + 1) then
	player:addKeyItem(CrackedManaOrb);
	player:specialMessage(KEYITEM_OBTAINED,CrackedManaOrb);
	player:setVar("needstoexamine1",0);
	player:setVar("needstoexamine2",0);
	player:setVar("needstoexamine3",0);
	player:setVar("needstoexamine4",0);
	player:setVar("needstoexamine5",0);
	player:setVar("needstoexamine6",0);
elseif (csid == eventid) then
	player:specialMessage(MISSIONS); -- The Mana Orb in this receptacle is not broken.
end;
end;