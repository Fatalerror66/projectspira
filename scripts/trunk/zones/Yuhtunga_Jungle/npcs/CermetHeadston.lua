-----------------------------------
--	Author: Trin
-- 	CermentHeadston
-- 	ZM5: Headstone Pilgrimage (Fire Fragment)
--	Coords: (X:491.382, Y:20.934, Z:301.399)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
require("scripts/zones/Yuhtunga_Jungle/TextIDs");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
npcstate = npc:getState();
--print("Name:",npcname);
--print("NPC ID:",npcid);
time = os.time();
--print("Time:", time);
Firetime = getGlobalVar("FireHeadstoneActive");
--print("Fire Time:", Firetime);

	
if (player:getMissionStatus(3, 10) == 1) then

	--if mobs are currently spawned, dont do anything	
	if (player:hasKeyItem(FireFrag) == 0 and getGlobalVar("FireHeadstoneActive") < 2) then

	--if requirements are met and 15 mins have passed since mobs were last defeated, spawn them
	elseif (player:hasKeyItem(FireFrag) == 0 and getGlobalVar("FireHeadstoneActive") < os.time()) then
		
		event = Event(0x00C8);
		event:setParams(FireFrag);
		player:startEvent(event);

	--if 15 min window is open and requirements are met, recieve key item
	elseif (player:hasKeyItem(FireFrag) == 0 and getGlobalVar("FireHeadstoneActive") > os.time()) then

		player:addKeyItem(FireFrag);

			--Check and see if all fragments have been found (no need to check lightning and dark frag)
			if (player:hasKeyItem(FireFrag) == 1 and player:hasKeyItem(WaterFrag) == 1 and player:hasKeyItem(EarthFrag) == 1 and player:hasKeyItem(WindFrag) == 1 and player:hasKeyItem(IceFrag) == 1 and player:hasKeyItem(LightFrag) == 1) then

				player:specialMessage(FOUND_ALL_FRAGS, FireFrag);
			else
				player:specialMessage(KEYITEM_OBTAINED, FireFrag);
			end

	elseif (player:hasKeyItem(FireFrag)) then
		
		player:specialMessage(ALREADY_OBTAINED_FRAG, FireFrag);
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
	zone:spawnMob("Carthi",player:getXPos()+2,player:getYPos()+2,player:getZPos(),player:getRot(),player:getId());
	zone:spawnMob("Tipha",player:getXPos()-2,player:getYPos()-2,player:getZPos(),player:getRot(),player:getId());
	setGlobalVar("FireHeadstoneActive", 0);
end
end;

