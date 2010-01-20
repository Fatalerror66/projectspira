-----------------------------------
--	Author: Bababooey
-- 	???
-- 	Spawns Korrokola Leeches for Ayame and Kaede Quest
-----------------------------------

-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
require("scripts/zones/Korroloka_Tunnel/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


ninQuest =player:getQuestStatus(1,60);
leechesSpawned = getGlobalVar("korrolokaLeechesSP");
leeches = player:getVar("korrolokaLeeches");

spawnOK = (leechesSpawned == 0) and (leeches == 0) and (os.time()-getGlobalVar("KorrolokaLeechesTOD") >= 600)

if(ninQuest == 1 and spawnOK) then
	player:specialMessage(885);
	loc1 = Zone(0xAD);
	loc2 = Zone(0xAD);
	loc3 = Zone(0xAD);
	loc1:spawnMob("KorrolokaLeech",-204.524,-11.489,173.778,148,player:getId()); 
	loc2:spawnMob("KorrolokaLeech",-206.613,-12.152,180.580,70,player:getId());
	loc2:spawnMob("KorrolokaLeech",-212.745,-10.487,180.680,41,player:getId());
	
	player:setVar("korrolokaLeeches",0);
elseif(ninQuest == 1 and leeches == 3) then
	player:specialMessage(KEYITEM_OBTAINED,257);
	player:addKeyItem(257);
	player:setVar("korrolokaLeeches",0);
	setGlobalVar("KorrolokaLeechesTOD",os.time());	
else
	player:specialMessage(884);
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