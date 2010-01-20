-----------------------------------
--	Author: ReaperX
-- 	Sharzalion
--  RDM AF Quest
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
OrcishDriedFood = 0xC4;
   FencingDegen = 16829;
    AntiqueCoin = 1093;

--[[ Events

0F "My apologies, but I've no time to talk."
46 opening CS for RDM AF1 quest "The Crimson Trial"
47 opening CS for RDM AF1 quest "The Crimson Trial" (short version)
4A repeats instructions about storage holes
4B final CS for RDM AF1 quest "The Crimson Trial"
44 "I would not go to that church if I were you. There you'll find no coin, only intrigue."
45 "What? You went to the church? How impetuous of you. And, you met the ghost? Well, there's no stopping you."
40 CS for RDM AF3 quest "Peace for the Spirit"; tells you to go to Fei Yin. 
41 repeats instructions to go to Fei Yin.
42 "What, you traveled to Fei'Yin? And you say that the ghost of Rainemard needs help?"
43 "So, that whole church uproar was Rainemard's doing.. Well, I am glad his spirit has found rest, and you made it out safely."
378

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

if (player:getMainJob() == 5) and (player:getMainLvl() >= AF1_QUEST_LEVEL) and (player:getQuestStatus(0,84) == 0) then
  if (player:getVar("has_seen_rdmaf1_quest_already") == 0) then
    player:startEvent(Event(0x46));
  else
  	player:startEvent(Event(0x47));
  end;
elseif (player:getQuestStatus(0,84) == 1) and (player:hasKeyItem(OrcishDriedFood) == 0) then
	player:startEvent(Event(0x4A));
elseif (player:hasKeyItem(OrcishDriedFood) == 1) then
  player:startEvent(Event(0x4B));
elseif (player:getQuestStatus(0,84) == 2) and (player:getQuestStatus(0,85) == 0) then
	player:startEvent(Event(0x44));
elseif (player:getQuestStatus(0,85) == 2) and (player:getQuestStatus(0,86) == 0) then
	player:startEvent(Event(0x45));
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 0) then
	player:startEvent(Event(0x40));
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 1) then
	player:startEvent(Event(0x41));
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 2) or (player:getVar("peace_for_the_spirit_status") == 3) then
	player:startEvent(Event(0x42));
else
  player:startEvent(Event(0x00F));
end; 
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
	end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x46) or (csid == 0x47) then
  if (csid == 0x46) and (option == 0) then
  	player:setVar("has_seen_rdmaf1_quest_already",1)
  end;
  if (option == 1) then
  	player:addQuest(0,84)
  	player:setVar("has_seen_rdmaf1_quest_already",0)
  end;
elseif (csid ==0x4B) then
	player:completeQuest(0,84);
	player:removeKeyItem(OrcishDriedFood);
	player:addItem(FencingDegen);
	player:specialMessage(ITEM_OBTAINED,FencingDegen);
	player:addFame(0,SAN_FAME*AF1_FAME);
elseif (csid == 0x40) then
	player:setVar("peace_for_the_spirit_status",1);
elseif (csid == 0x42) then
	player:setVar("peace_for_the_spirit_status",3);
end;
end;