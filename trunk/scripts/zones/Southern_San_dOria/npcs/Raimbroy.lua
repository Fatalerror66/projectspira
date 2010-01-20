-----------------------------------
--	Author: JesseJames/Kphiyr
-- 	Raimbroy
-- 	Initial CS and quest start scripted, requires remainder
--  Kphiyr did Sweetest Thing Quest    
-----------------------------------
Honey=4370;
QuestID=8;

--1410
GiveItem = 0x0217;
WrongTrade = 0x0218;--020A Copy
NotEnough = 0x0219;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
function onTrigger(player,npc)

check = player:getVar("kcs");
if (player:getFameLevel()==0) then
	player:showText(npc,1410);
elseif (check == 0 and player:getQuestStatus(0,QuestID) == 0) then
	player:startEvent(Event(0x214));
	player:setVar("kcs",1);
elseif (check == 1 and player:getQuestStatus(0,QuestID) == 0) then
	player:startEvent(Event(0x215));
elseif (check == 1) then
	player:startEvent(Event(0x216));

end
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
end

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	elseif trade:hasItemQty(Honey,5)==true and player:getQuestStatus(0,QuestID) == 1 then
		trade:isComplete();
		player:startEvent(Event(GiveItem));
	elseif trade:getItem(Honey)==true and player:getQuestStatus(0,QuestID) == 1 then
		player:startEvent(Event(NotEnough));
	elseif trade:hasItemQty(Honey,5)==true and player:getQuestStatus(0,QuestID) == 2 then
		trade:isComplete();
		player:startEvent(Event(GiveItem));
	elseif trade:getItem(Honey)==true and player:getQuestStatus(0,QuestID) == 2 then
		player:startEvent(Event(NotEnough));
	elseif trade:getItem(Honey)==false and player:getQuestStatus(0,QuestID) == 1 then
		player:startEvent(Event(WrongTrade));
	elseif trade:getItem(Honey)==false and player:getQuestStatus(0,QuestID) == 2 then
		player:startEvent(Event(WrongTrade));
		
	end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

	if csid == 0x215 and option == 0 and player:getQuestStatus(0,QuestID) == 0 then
		player:addQuest(0,QuestID);
	elseif csid == GiveItem and player:getQuestStatus(0,QuestID) == 1 then
		player:completeQuest(0,QuestID);
		player:addGil(GIL_RATE*400);
		player:setTitle(55);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*400);
	elseif csid == GiveItem and player:getQuestStatus(0,QuestID) == 3 then
		player:addGil(GIL_RATE*400);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*400);

	end
 
end;