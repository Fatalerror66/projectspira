-----------------------------------
--	Author: ReaperX
-- 	Dkhaaya (Olduum Quest giver)

--  MISSING: Event ID or input parameters for one of the identified events to start a repeat of the quest.Currently using 0x0004 instead.

--  Behavior needing verification: this implementation of the quest will produce the message "I wouldn't be surprised if that ring 
--  had some secret use.."  while you still have the lightning band AND when you have the Olduum ring. 

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

-------- Dkhaaya events -------------------
-- 0x0004 : Introduction and Olduum quest start (Dkhaaya is a researcher into the Olduum civilization and is looking for Olduum artifacts.)
-- 0x0005 : player already has Olduum quest but hasn't found key items
-- 0x0006 : player turned in key item, completes quest (reward: lightning band)
-- 0x0007 : "I wouldn't be surprised if that ring had some secret use that we're not aware of" (repeats hint about the lightning band)
--   ???? : Oh, the mercenary. Sorry, "adventurer". Hm? You want another one of those rings?? (starting repeat of the quest)
-- 0x0008 : "Here's your new lightning band" (repeatable quest has been completed again)

-- debug code --
-- player:setVar("OLDUUM_QUEST_STATUS",0);

--quest_status = player:getQuestStatus(6,2) -- not using this to track quest status
quest_status = player:getVar("OLDUUM_QUEST_STATUS"); -- a value that tracks the original and repeat status:

-- quest_status == 0 : quest hasn't been activated
-- quest_status == 1 : on quest for the first time
-- quest_status == 2 : completed for the first time
-- quest_status == 3 : restarted, not yet completed again
-- quest_status == 4 : completed again (distinction is important for setting correct CS at leypoint)

--print("Olduum Quest status:",quest_status);

keyitem = 0;

if (quest_status == 0) then
  event = Event(0x0004);
  player:addKeyItem(0x02FF) -- add keyitem Dkhaaya's research journal  
  player:addQuest(6,2)
  player:setVar("OLDUUM_QUEST_STATUS",1);
elseif ((quest_status ==1) or (quest_status ==3 )) then
  if (player:hasKeyItem(0x0300) == 1) then -- electrocell
    keyitem = 0x300;
  end
  if (player:hasKeyItem(0x0301) == 1) then -- electropod
    keyitem = 0x301;
  end
  if (player:hasKeyItem(0x0302) == 1) then -- electrolocomotive
    keyitem = 0x302;
	end
	if (keyitem ==0) then
	  event = Event(0x0005);
	else
	  if (quest_status == 3) then -- quest is being finished again
	    event = Event(0x0008);
	  else                   	    -- quest is being finished for the first time
	    event = Event(0x0006);
	  end;
	  event:setParams(keyitem);
	end
elseif ((quest_status ==2) or (quest_status ==4)) then
    if ((player:hasItem(2217) == 1) or (player:hasItem(15769) == 1)) then -- player has lightning band or olduum ring?
      event = Event(0x0007);
    else
      event = Event(0x0004); -- NEED TO FIX THIS for starting repeat of the quest, but this will do for now
      player:setVar("OLDUUM_QUEST_STATUS",3);
    end
end

player:startEvent(event);
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
--print("CSID:",csid);
--print("RESULT:",option);
if ((csid == 6) or (csid == 8)) then
  player:completeQuest(6,2) -- mark quest as completed
  player:addItem(2217) -- player receives lightning band
  player:specialMessage(20,2217);   
  if (csid == 6) then
    player:setVar("OLDUUM_QUEST_STATUS",2);
  elseif (csid == 8) then
    player:setVar("OLDUUM_QUEST_STATUS",4);
  end;
    
  if (player:hasKeyItem(0x300) == 1) then 
    player:removeKeyItem(0x300) -- electrocell
  end
  if (player:hasKeyItem(0x301) == 1) then 
    player:removeKeyItem(0x301) -- electropod
  end
  if (player:hasKeyItem(0x302) == 1) then 
    player:removeKeyItem(0x302) -- electrolocomotive
	end
end
end;