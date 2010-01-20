
-----------------------------------
-- Area: Port San d'Oria
--  NPC: 
-- 
-- By: Mana -- Pickpocket Quest by Kphiyr
-----------------------------------
-- Define Locals
----------------------------------
----Related CS's to this NPC-----
--need: Say, that man needs help!
--022F
--0223
--0226 Light Axe
--0227
--0224
--0244
--0033
--0020

WrongTrade = 0x0227;

-- Includes

EagleButton=578;
GiltGlasses=579;
LightAxe=16667;
QuestID=3;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
 
function onTrigger(player,npc)
   	
	if (player:getQuestStatus(0,QuestID) == 0) and (player:getVar("GlassesStolen")==0) then
		player:startEvent(Event(0x022F));
	else
		player:startEvent(Event(0x0223));
	
	end
end;


-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(663)
	end
 	if (trade:hasItemQty(GiltGlasses,1) == true and player:getQuestStatus(0,QuestID) == 1) then
		trade:isComplete();
		player:startEvent(0x0226);
	else 
		player:startEvent(Event(WrongTrade));
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
	if (csid == 0x0223) and player:getQuestStatus(0,QuestID)==0 then
		player:addQuest(0,QuestID);
	elseif (csid == 0x0226) then
		player:addItem(LightAxe);
		player:setTitle(60);
		player:specialMessage(ITEM_OBTAINED,LightAxe);
		player:completeQuest(0,QuestID);
		player:addFame(SAN_FAME*30);
	end
end;
