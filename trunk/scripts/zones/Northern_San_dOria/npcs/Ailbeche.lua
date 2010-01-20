-- Auto-Generated Script from FFXImonV3 
-- By: Mana  
-- Quests "Father and Son" and PLD AF1 quest "Sharpening the Sword" by ReaperX

WillowFishingRod = 17391;
OrdelleWhetstone = 0xE9;
      HonorSword = 17643;

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	elseif trade:hasItemQty(WillowFishingRod,1) and (trade:getItemCount() == 1) and (player:getVar("father_sun_status") == 3) then 
		player:startEvent(Event(0x3D));
		trade:isComplete();
	end 
end; 
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 

if (player:getQuestStatus(0,4) == 0) then
  player:startEvent(Event(0x1FC));
elseif (player:getVar("father_sun_status") == 1) then
	player:showText(npc,1441);
elseif (player:getVar("father_sun_status") == 2) then
  player:startEvent(Event(0x1FD));
elseif (player:getVar("father_sun_status") == 3) then
  player:showText(npc,2635); -- "Oh, when will my father take me fishing..." (not sure this is correct response)
elseif (player:getMainJob() == 7) and (player:getMainLvl() >= 40) and (player:getQuestStatus(0,90) == 0) then
  if (player:getVar("has_not_seen_pldaf1_yet") ==1) then
    player:setVar("sharpening_the_sword_status",0);
    player:startEvent(Event(0x2D)); --  offers the quest for the first time
  else
  	player:startEvent(Event(0x2B)); --  offers the quest after you've turned him down already
  end;
elseif (player:getVar("sharpening_the_sword_status") == 2) then
  player:startEvent(Event(0x2A));	 
elseif (player:hasKeyItem(OrdelleWhetstone) == 1) then
  player:startEvent(Event(0x2C));	 
else
  player:showText(npc,2635)  -- not sure this is correct default response
end
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option); 
if (csid == 0x1FC) then
  player:addQuest(0,4);
  player:setVar("father_sun_status",1);
elseif (csid == 0x1FD) then
	player:specialMessage(ITEM_OBTAINED,WillowFishingRod);
	player:addItem(WillowFishingRod);
	player:completeQuest(0,4);
	player:setVar("father_sun_status",3);       -- need to give the boy his fishing rod back before you can take the next quest.
elseif (csid == 0x3D) then
	player:setVar("father_sun_status",0);       -- ready for next quests.
	player:setVar("has_not_seen_pldaf1_yet",1); 
elseif (csid == 0x2D) and (option == 1) then
	player:setVar("sharpening_the_sword_status",1);
	player:addQuest(0,90);
elseif (csid == 0x2C) then
	player:setVar("sharpening_the_sword_status",0);
	player:removeKeyItem(OrdelleWhetstone);
	player:completeQuest(0,90);
	player:specialMessage(ITEM_OBTAINED,HonorSword);
	player:addItem(HonorSword);
	player:addFame(0,SAN_FAME*AF1_FAME);
end;
end;