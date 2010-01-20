-----------------------------------
-- Area: Port San d'Oria
-- NPC: Miene
-- 
-- By: Mana -- Pickpocket Quest by Kphiyr

----Related CS's to this NPC-----
--need: Say, that man needs help!
--01f6 QuestIntro
--022a Say, that man needs help!
--0225 Give Item
--0229 You're working hard, right?
--0228 No available slot
--0263 Replace Item (ReGiveItem)
GiveItem = 0x0225;
NoSlot = 0x0228;
ReplaceItem = 0x0263;


EagleButton=578;
GiltGlasses=579;
QuestID=3;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/common");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");


function onTrigger(player,npc)
	if (player:getQuestStatus(0,QuestID) == 0) and (player:getVar("GlassesStolen")==0) then
		player:startEvent(Event(0x01F6));
		player:setVar("GlassesStolen",1);
	elseif (player:getQuestStatus(0,QuestID) == 0) and (player:getVar("GlassesStolen")==1) then
		player:startEvent(Event(0x022A));
	elseif (player:getQuestStatus(0,QuestID) == 1) and (player:getVar("GlassesStolen")==1) and (player:hasItem(EagleButton) == 0) and (player:getFreeSlotCount(0) >=1) then
		player:startEvent(Event(GiveItem));
		player:setVar("GlassesStolen",2);
	elseif (player:getQuestStatus(0,QuestID) == 1) and (player:getVar("GlassesStolen")==2) and (player:hasItem(EagleButton) == 0) and (player:getFreeSlotCount(0) >=1)  and (player:getVar("ObtainedGlasses")==0)then
		player:startEvent(Event(ReplaceItem));
	elseif (player:getQuestStatus(0,QuestID) == 1) and (player:hasItem(EagleButton) == 0) and (player:getFreeSlotCount(0) == 0) then
		player:startEvent(Event(NoSlot));
	else
		player:startEvent(Event(0x0229));
	end	
end;

-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 	miene = player:getVar("miene")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and miene == 0 then
			player:setVar("miene",1)
			player:specialMessage(665)
			player:showText(npc,1032)
			trade:isComplete()
		elseif sandyQuest16 == 1 and miene == 1 then
			player:specialMessage(664)
		end
	end
end;
-----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
	--print("onEventSelection")
	--print("CSID:",csid);
	--print("RESULT:",option);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	--print("onEventFinish")
	--print("CSID:",csid);
	--print("RESULT:",option);
	if (csid == GiveItem) then
		player:addItem(EagleButton);
	elseif (csid == ReplaceItem) then
		player:addItem(EagleButton);
	end
end;