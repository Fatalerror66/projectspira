-----------------------------------
--	Author: Almendro
-- 	Underground Pool
-- 	Quest involved: "Scattered into Shadow" http://wiki.ffxiclopedia.org/wiki/Scattered_into_Shadow
--  08/19/2009 - Almendro
--    * Fixed the event order of the quest
--    * Added spawnMob function for the ghost involved in the quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
Aquaflora1 = 0xE5;
Aquaflora2 = 0xE6;
Aquaflora3 = 0xE7;
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(player:getQuestStatus(3,61) == 1 --[[and player:getVar("ScatteredintoShadow") == 1]]--
) then
	if(npcid == 17613184 and player:hasKeyItem(Aquaflora1) == 1) then
	-- H-5 Underground Pool
		player:startEvent(Event(0x14));
		player:removeKeyItem(Aquaflora1);
	elseif(npcid == 17613186 and player:hasKeyItem(Aquaflora2) == 1) then
	-- H-8 Underground Pool
		player:startEvent(Event(0x15));
		player:removeKeyItem(Aquaflora2);
	elseif(npcid == 17613185 and player:hasKeyItem(Aquaflora3) == 1) then
		-- F-5 Underground Pool npcid== 17613186
		if(os.time() <= getGlobalVar("DabotzsGhostkilled") ) then
			player:startEvent(Event(0x12));
		else
			zone = Zone(player:getZone());
			zone:spawnMob("Dabotz_sGhost",npc:getXPos(),npc:getYPos(),npc:getZPos(),npc:getRot(),player:getId());
		end
	else
		player:specialMessage(993); -- There is nothing out of the ordinary here.
	end
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
if (csid == 0x12) then
	player:removeKeyItem(Aquaflora3);
end
end;