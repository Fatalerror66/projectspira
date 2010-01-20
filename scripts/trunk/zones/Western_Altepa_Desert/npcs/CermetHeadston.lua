-----------------------------------
--	Author: Trin
-- 	CermentHeadston
-- 	ZM5: Headstone Pilgrimage (Earth Fragment)
--	Coords: (566.565, 0.173, 606.954)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
require("scripts/zones/Western_Altepa_Desert/TextIDs");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
npcstate = npc:getState();
--print("Name:",npcname);
--print("NPC ID:",npcid);

	
if (player:getMissionStatus(3, 10) == 1) then

	
	--if you dont have key item, get it!
	if (player:hasKeyItem(EarthFrag) == 0) then

			event = Event(0x00C8);
			event:setParams(EarthFrag);
			player:startEvent(event);

	elseif (player:hasKeyItem(EarthFrag)) then
		
		player:specialMessage(ALREADY_OBTAINED_FRAG, EarthFrag);
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
	
	player:addKeyItem(EarthFrag);

	--Check and see if all fragments have been found (no need to check earth and dark frag)
	if (player:hasKeyItem(FireFrag) == 1 and player:hasKeyItem(WaterFrag) == 1 and player:hasKeyItem(IceFrag) == 1 and player:hasKeyItem(WindFrag) == 1 and player:hasKeyItem(LightningFrag) == 1 and player:hasKeyItem(LightFrag) == 1) then

		player:specialMessage(FOUND_ALL_FRAGS, EarthFrag);
		player:completeMission(3, 10);
		player:currentMission(3, 12);
	else
		player:specialMessage(KEYITEM_OBTAINED, EarthFrag);
	end
end
end;

