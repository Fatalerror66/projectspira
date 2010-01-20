-----------------------------------
--	Author: ReaperX
-- 	Guslam
-- 	AF hands quests
--  see http://wiki.ffxiclopedia.org/wiki/Artifact_Armor
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/spell_definitions"); -- for job constants

OldGauntlets = 0xD2;

-- events: 
-- 9A: standard greetings
-- 9B: opening CS for Borghertz hands and AF coffer quests
-- 2B: repeat instructions for af quests
-- 1A: he can't repair the old gauntlets.
-- 9C: when you have completed a hands quest.

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-- check if any hands quests are already open.
if (player:getVar("AF_HANDS_JOB") > 0) then
	if (player:hasKeyItem(OldGauntlets) == 1) then 
		if (player:getVar("BORGHERTZ_QUEST") == 0) then
			player:setVar("BORGHERTZ_QUEST",1); -- indicates that player now knows about this step, permanently. On the next
			-- job's hands quest, this step can be skipped. 
		end;
		player:startEvent(Event(0x1A)); -- he can't repair the old gauntlets.
	else
		player:startEvent(Event(0x2B)); -- repeat instructions for AF quest
	end;
else -- no af hands quest is open.
	jobquesttoflag = 0;
	job = player:getMainJob();
	if (player:getMainLvl() < 50) then
		job = 0;
	end;
	
	AF2questIDs = { 55, 52, 88, 67, 85, 70, 91, 58, 61, 64, 73, 141, 144, 95, 82 }
	AF2logIDs   = { 1, 1, 0, 2, 0, 2, 0, 1, 3, 3, 2, 5, 5, 0, 2} 
	
	if (job > 0) then
		if (player:getQuestStatus(AF2logIDs[job], AF2questIDs[job]) == 1) and (player:getQuestStatus(3, 43+job) == 0) then
			jobquesttoflag = job;
		end;
	end;
	
	if (jobquesttoflag > 0) then		
		player:addQuest(3,43 + jobquesttoflag);
		player:setVar("AF_HANDS_JOB",jobquesttoflag); -- this stores the job while the quest is active.
		player:setVar("KNOWS_ABOUT_BORGHERTZ",1); -- this var indicates that the player has learned about Borghertz and has previously started an AF quest.
		player:startEvent(Event(0x9B));
	else -- no quest started, no quest to flag
		if (player:getVar("KNOWS_ABOUT_BORGHERTZ") == 1) then
			player:startEvent(Event(0x9C));
		else
			player:startEvent(Event(0x9A));
		end;
	end;
end;
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
end;