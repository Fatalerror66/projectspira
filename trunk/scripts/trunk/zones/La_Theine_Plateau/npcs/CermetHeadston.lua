-----------------------------------
--	Author: Trin
-- 	CermentHeadston
-- 	ZM5: Headstone Pilgrimage (Water Fragment)
--	Coords: (X:-170.848 Y:39.529 Z:-504.637)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/zones/La_Theine_Plateau/TextIDs");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
npcstate = npc:getState();
--print("Name:",npcname);
--print("NPC ID:",npcid);

	
if (player:getMissionStatus(3, 10) == 1) then

	
	--if you dont have key item, get it!
	if (player:hasKeyItem(WaterFrag) == 0) then

			event = Event(0x00C8);
			event:setParams(WaterFrag);
			player:startEvent(event);

	elseif (player:hasKeyItem(WaterFrag)) then
		
		player:specialMessage(ALREADY_OBTAINED_FRAG, WaterFrag);
	end

elseif (player:getMissionStatus(3, 10) == 2) then

	player:specialMessage(ZILART_MONUMENT); 
else
	player:specialMessage(CANNOT_REMOVE_FRAG);


end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0xC8 and option == 1) then
	
	player:addKeyItem(WaterFrag);

	--Check and see if all fragments have been found (no need to check water and dark frag)
	if (player:hasKeyItem(FireFrag) == 1 and player:hasKeyItem(IceFrag) == 1 and player:hasKeyItem(EarthFrag) == 1 and player:hasKeyItem(WindFrag) == 1 and player:hasKeyItem(LightningFrag) == 1 and player:hasKeyItem(LightFrag) == 1) then

		player:specialMessage(FOUND_ALL_FRAGS, WaterFrag);
		player:completeMission(3, 10);
		player:currentMission(3, 12);
	else
		player:specialMessage(KEYITEM_OBTAINED, WaterFrag);
	end
end
end;

