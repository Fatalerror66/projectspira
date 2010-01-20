-----------------------------------
--	Author: Aly
-- 	NPC:	Olbergieut
-- 	Quest: 	Gates Of Paradise
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------
-- Initialize
WindScrip = 0x97;
WaterScrip = 0x96;
CottonCape = 13584;
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
level = player:getMainLvl();
 fame = player:getFame(0);
ParadiseGates = player:getQuestStatus(0,18);

if (ParadiseGates == 0 and level >= 7 and fame >=2) then
	player:startEvent(Event(0x26B));  	-- receive Scripture of Wind
elseif (player:hasKeyItem(WaterScrip) == 1) then
	player:startEvent(Event(0x26C)); 	-- receive Cotton Cape, and title
else
	player:startEvent(Event(0x264)) ; 	-- filler text
end
end; 

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then 
		player:specialMessage(1767);
	end 
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x26B and option == 0) then
	player:addKeyItem(WindScrip);		-- receive Scripture of Wind
	player:specialMessage(KEYITEM_OBTAINED,WindScrip);
	player:addQuest(0,18);
elseif (csid == 0x26C) then
	player:removeKeyItem(WaterScrip);
	player:completeQuest(0,18);
	player:setTitle(52);  			-- "The Pious One"
	player:addItem(CottonCape);		-- receive CottonCape
	player:specialMessage(ITEM_OBTAINED,CottonCape);
	player:addFame(0,SAN_FAME*30);
	end
end;
	