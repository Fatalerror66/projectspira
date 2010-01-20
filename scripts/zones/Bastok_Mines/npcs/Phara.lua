-----------------------------------
--	Author: Almendro
-- 	Phara
-- 	Involved in AF1 and AF2 WAR Quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/Utils");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- Initialization
SwordGripMaterial = 0xD0;
YasinsSword = 0xD1;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TheDoorman = player:getQuestStatus(1,54);
lvl = player:getMainLvl();
job = player:getMainJob();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(lvl >= 40 and job == 1 and TheDoorman == 0)then
	player:startEvent(Event(0x97));
	player:addQuest(1,54);
elseif(TheDoorman == 1 and player:hasKeyItem(SwordGripMaterial) == 1)then
	player:startEvent(Event(0x98));
elseif(TheDoorman == 1 and os.time() >= player:getVar("[Quest-TheDoorman]TimeToGetYasinsSword"))then
	player:startEvent(Event(0x99));
elseif(TheDoorman == 2)then
	player:startEvent(Event(0x9A));
else
	-- Default chat text
	player:startEvent(Event(0x96));
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
if(csid == 0x98)then
	player:removeKeyItem(SwordGripMaterial);
	player:setVar("[Quest-TheDoorman]TimeToGetYasinsSword",os.time() + secondsRemainingTillMidnight);
elseif(csid == 0x99)then
	player:addKeyItem(YasinsSword);
	player:specialMessage(KEYITEM_OBTAINED,YasinsSword);
	player:setVar("[Quest-TheDoorman]TimeToGetYasinsSword",0); -- Deletes from server
end
end;