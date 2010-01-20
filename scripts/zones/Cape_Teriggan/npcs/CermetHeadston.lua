-----------------------------------
--	Author: Trin
-- 	CermentHeadston
-- 	ZM5: Headstone Pilgrimage (Wind Headstone)
--	Coords: ()
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil;
require("scripts/zones/Cape_Teriggan/TextIDs");
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
Windtime = getGlobalVar("WindHeadstoneActive");
--print("Wind Time:", Windtime);



if (player:getMissionStatus(3, 10) == 1) then


	--if mobs are currently spawned, dont do anything	
	if (player:hasKeyItem(WindFrag) == 0 and getGlobalVar("WindHeadstoneActive") < 1) then
		
	--if requirements are met and 15 mins have passed since mobs were last defeated, spawn them
	elseif (player:hasKeyItem(WindFrag) == 0 and getGlobalVar("WindHeadstoneActive") < os.time()) then

		event = Event(0x00C8);
		event:setParams(WindFrag);
		player:startEvent(event);
		
	--if 15 min window is open and requirements are met, recieve key item
	elseif (player:hasKeyItem(WindFrag) == 0 and getGlobalVar("WindHeadstoneActive") > os.time()) then

		player:addKeyItem(WindFrag);

			--Check and see if all fragments have been found (no need to check wind and dark frag)
			if (player:hasKeyItem(FireFrag) == 1 and player:hasKeyItem(WaterFrag) == 1 and player:hasKeyItem(EarthFrag) == 1 and player:hasKeyItem(LightFrag) == 1 and player:hasKeyItem(IceFrag) == 1 and player:hasKeyItem(LightningFrag) == 1) then

				player:specialMessage(FOUND_ALL_FRAGS, WindFrag);
			else
				player:specialMessage(KEYITEM_OBTAINED, WindFrag);
			end

	elseif (player:hasKeyItem(WindFrag)) then
		
		player:specialMessage(ALREADY_OBTAINED_FRAG, WindFrag);

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
	zone:spawnMob("AxesariontheWa",player:getXPos()+2,player:getYPos()+2,player:getZPos(),player:getRot(),player:getId());
	--print("I should be spawning now");
	setGlobalVar("WindHeadstoneActive", 0);
end
end;
