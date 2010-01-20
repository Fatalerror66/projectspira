-----------------------------------
--	Author: Jax
-- 	Hanaa Punaa
--	Quest added (The Seamstress)(Lizard Skins)(Black Tiger Skins)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
SheepSkin = 505
LizardSkin = 852
TigerHide = 861
LeatherGloves = 12696
LizardGloves = 12697
TigerStole = 13119
-----------------------------------
function onTrigger(player,npc)
TheSeamstress = player:getQuestStatus(0,5);
LizardSkins = player:getQuestStatus(0,15);
BlackTigerSkins = player:getQuestStatus(0,31);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (TheSeamstress == 0) then
		player:startEvent(Event(0x0213));
	elseif (TheSeamstress == 1) then
		player:startEvent(Event(0x0211));
	elseif (TheSeamstress == 2 and LizardSkins == 0) then
		player:startEvent(Event(0x0232));
	elseif (TheSeamstress == 2 and LizardSkins == 1) then
		player:startEvent(Event(0x0230));
	elseif (TheSeamstress == 2 and LizardSkins == 2 and BlackTigerSkins == 0) then
		player:startEvent(Event(0x0243));
	elseif (TheSeamstress == 2 and LizardSkins == 2 and BlackTigerSkins == 1) then
		player:startEvent(Event(0x0242));
	elseif (TheSeamstress == 2 and LizardSkins == 2 and BlackTigerSkins == 2) then
		player:startEvent(Event(0x0250));
	end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
 -- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then
		player:specialMessage(1488);
	elseif (trade:hasItemQty(SheepSkin,3) == true and count == 3 and TheSeamstress >= 1) then
		trade:isComplete();
		player:startEvent(Event(0x0212));
	elseif (trade:hasItemQty(LizardSkin,3) == true and count == 3 and LizardSkins >= 1) then
		trade:isComplete();
		player:startEvent(Event(0x0231));
	elseif (trade:hasItemQty(TigerHide,3) == true and count == 3 and BlackTigerSkins == 1) then
		trade:isComplete();
		player:startEvent(Event(0x0241));
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x0213 and option == 0) then
		player:addQuest(0,5)
	elseif (csid == 0x0232 and option == 0) then
		player:addQuest(0,15)
	elseif (csid == 0x0243 and option == 0) then
		player:addQuest(0,31)
	elseif (csid == 0x0212) then
		player:addItem(LeatherGloves);
		player:specialMessage(ITEM_OBTAINED,LeatherGloves);
		player:setTitle(65); -- 	 Silencer of The Lambs	
		player:completeQuest(0,5);
		player:addFame(0,SAN_FAME*30);	
	elseif (csid == 0x0231) then
		player:addItem(LizardGloves);
		player:specialMessage(ITEM_OBTAINED,LizardGloves);
		player:setTitle(70); -- 	 Lizzard Skinner	
		player:completeQuest(0,15);
		player:addFame(0,SAN_FAME*30);
	elseif (csid == 0x0241) then
		player:addItem(TigerStole);
		player:specialMessage(ITEM_OBTAINED,TigerStole);
		player:setTitle(75); -- 	 Cat Skinner	
		player:completeQuest(0,31);
		player:addFame(0,SAN_FAME*30);
	end
end;