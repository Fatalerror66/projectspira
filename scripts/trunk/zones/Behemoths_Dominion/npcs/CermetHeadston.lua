-----------------------------------
--	Author: Trin
-- 	CermentHeadston
-- 	ZM5: Headstone Pilgrimage (Lightning Fragment)
--	Coords: (-74.3, -4, -87.4)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
require("scripts/zones/Behemoths_Dominion/TextIDs");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
npcstate = npc:getState();
--print("Name:",npcname);
--print("NPC ID:",npcid);
time = os.time();
--print("Time:", time);
Lightime = getGlobalVar("LightningHeadstoneActive");
--print("Lightning Time:", Lightime);

	
if (player:getMissionStatus(3, 10) == 1) then

	--if mobs are currently spawned, dont do anything	
	if (player:hasKeyItem(LightningFrag) == 0 and getGlobalVar("LightningHeadstoneActive") < 2) then
		

	--if requirements are met and 15 mins have passed since mobs were last defeated, spawn them
	elseif (player:hasKeyItem(LightningFrag) == 0 and getGlobalVar("LightningHeadstoneActive") < os.time()) then
		
		event = Event(0x00C8);
		event:setParams(LightningFrag);
		player:startEvent(event);

	--if 15 min window is open and requirements are met, recieve key item
	elseif (player:hasKeyItem(LightningFrag) == 0 and getGlobalVar("LightningHeadstoneActive") > os.time()) then

		player:addKeyItem(LightningFrag);

			--Check and see if all fragments have been found (no need to check lightning and dark frag)
			if (player:hasKeyItem(FireFrag) == 1 and player:hasKeyItem(WaterFrag) == 1 and player:hasKeyItem(EarthFrag) == 1 and player:hasKeyItem(WindFrag) == 1 and player:hasKeyItem(IceFrag) == 1 and player:hasKeyItem(LightFrag) == 1) then

				player:specialMessage(FOUND_ALL_FRAGS, LightningFrag);
				player:completeMission(3, 10);
				player:currentMission(3, 12);
			else
				player:specialMessage(KEYITEM_OBTAINED, LightningFrag);
			end

	elseif (player:hasKeyItem(LightningFrag)) then
		
		player:specialMessage(ALREADY_OBTAINED_FRAG, LightningFrag);
		player:removeKeyItem(LightningFrag);
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
	zone = Zone(player:getZone());
	zone:spawnMob("AncientWeapon",player:getXPos()+2,player:getYPos()+2,player:getZPos(),player:getRot(),player:getId());
	zone:spawnMob("LegendaryWeapo",player:getXPos()-2,player:getYPos()-2,player:getZPos(),player:getRot(),player:getId());
	setGlobalVar("LightningHeadstoneActive", 0);
end
end;

