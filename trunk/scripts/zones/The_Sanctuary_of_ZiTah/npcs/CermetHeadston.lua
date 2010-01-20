-----------------------------------
--	Author: Trin
-- 	CermentHeadston
-- 	ZM5: Headstone Pilgrimage (Light Headstone)
--	Coords: ()
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
npcstate = npc:getState();
--print("Name:",npcname);
--print("NPC ID:",npcid);
FireFrag = 0xEF;
WaterFrag = 0xF0;
EarthFrag = 0xF1;
WindFrag = 0xF2;
LightningFrag = 0xF3;
IceFrag = 0xF4;
LightFrag = 0xF5;
time = os.time();
--print("Time:", time);
Lightime = getGlobalVar("LightHeadstoneActive");
--print("Light Time:", Lightime);



if (player:getMissionStatus(3, 10) == 1) then


	--if mobs are currently spawned, dont do anything	
	if (player:hasKeyItem(LightFrag) == 0 and getGlobalVar("LightHeadstoneActive") < 1) then
		

	--if requirements are met and 15 mins have passed since mobs were last defeated, spawn them
	elseif (player:hasKeyItem(LightFrag) == 0 and getGlobalVar("LightHeadstoneActive") < os.time()) then

		event = Event(0x00C8);
		event:setParams(LightFrag);
		player:startEvent(event);
		
	--if 15 min window is open and requirements are met, recieve key item
	elseif (player:hasKeyItem(LightFrag) == 0 and getGlobalVar("LightHeadstoneActive") > os.time()) then

		player:addKeyItem(LightFrag);

			--Check and see if all fragments have been found (no need to check light and dark frag)
			if (player:hasKeyItem(FireFrag) == 1 and player:hasKeyItem(WaterFrag) == 1 and player:hasKeyItem(EarthFrag) == 1 and player:hasKeyItem(WindFrag) == 1 and player:hasKeyItem(IceFrag) == 1 and player:hasKeyItem(LightningFrag) == 1) then

				player:specialMessage(FOUND_ALL_FRAGS, LightFrag);
			else
				player:specialMessage(KEYITEM_OBTAINED, LightFrag);
			end

	elseif (player:hasKeyItem(LightFrag)) then
		
		player:specialMessage(1218, LightFrag); --you have already obtained this monuments....

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
	zone:spawnMob("DoomedPilgrims",player:getXPos()+2,player:getYPos()+2,player:getZPos(),player:getRot(),player:getId());
	setGlobalVar("LightHeadstoneActive", 0);
end
end;
