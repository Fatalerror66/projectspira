-----------------------------------
--	Author: Jax (Medicine Woman)
--			Aly (To Cure A Cough)
-- 	NPC:	Amaura
--	Quests:	Medicine Woman,
--			To Cure A Cough
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
MalboroVine = 1013;
ZincOre = 642;
InsectWing = 846;
AmurasFormula = 0x0094;
ColdMedicine = 0x0093;
ThymeMoss = 0x99;
CoughMed = 0x9A;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
MedicineWoman = player:getQuestStatus(0,30);
	CoughCure = player:getQuestStatus(0,20);
---------------------------------------------------------
-- Medicine Woman
---------------------------------------------------------
	if (MedicineWoman == 1 and option == 0 and player:hasKeyItem(0x0094) == 0 and player:hasKeyItem(0x0093) == 0) then
		player:startEvent(Event(0x027C));
----------------------------------------------------------
-- To Cure A Cough
----------------------------------------------------------
	elseif (CoughCure == 1 and player:getVar("DiaryPage") == 3 and player:hasKeyItem(ThymeMoss) == 0 and player:hasKeyItem(CoughMed) == 0) then
		player:startEvent(Event(0x285)); -- need thyme moss for cough med
	elseif (CoughCure == 1 and player:getVar("DiaryPage") == 3 and player:hasKeyItem(ThymeMoss) == 1) then
		player:startEvent(Event(0x286)); -- receive cough med for Nenne
	else
		player:startEvent(Event(0x282));
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
	elseif (trade:hasItemQty(MalboroVine,1) == true and trade:hasItemQty(ZincOre,1) == true and trade:hasItemQty(InsectWing,1) == true and count == 3 and player:getQuestStatus(0,30) == 1) then
		trade:isComplete();
		player:startEvent(Event(0x027D));

	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x027C) then
		player:addKeyItem(AmurasFormula);
		player:specialMessage(KEYITEM_OBTAINED,AmurasFormula);
	elseif (csid == 0x027D) then
		player:removeKeyItem(AmurasFormula);
		player:addKeyItem(ColdMedicine);
		player:specialMessage(KEYITEM_OBTAINED,ColdMedicine);
	elseif (csid == 0x286) then  	-- cough med for Nenne
		player:removeKeyItem(ThymeMoss);
		player:addKeyItem(CoughMed);
		player:specialMessage(KEYITEM_OBTAINED,CoughMed);
	end
end;