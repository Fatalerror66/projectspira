-----------------------------------
--	Author: ReaperX
-- 	Door:Prince Regent's Rm (Pieuje's door) 
-- 	Involved in Sandy quests and missions
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
require("scripts/globals/teleports");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");

--[[ Door:Prince Regent's Rm (Pieuje's door) Events 

004A Chateau_Lightbringer_Pieuje: "If by chance Lightbringer selects me.." (8-2)
004B Chateau_ComingOfAge_Pieuje: "Cladie has finally come of age.." (8-1)
0042 (Halver CS for "Fit for a Prince")
0004 Guard: "Prince Pieuje has left with the expedition to Fei'Yin." (9-2)
0006 Guard: "Prince Pieuje has returned without injury and is awaiting your arrival in the Audience chamber." (9-2 CS?)
0005 "I have heard from my brother of your bravery in Fei'Yin." (9-2)
0049 final CS after obtaining rank 10
0218 entry event
0227 WHM AF quest
0228 WHM AF quest


--]]

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

npcname = npc:getName();
npcid = npc:getId();
mission_status = player:getVar("mission_status");

if (player:getVar("may_watch_final_pieuje_cs") == 1) then
	player:startEvent(Event(Chateau_TheHeirToTheLight_Pieuje)) 	
elseif (player:getVar("may_watch_coming_of_age_pieuje") == 1) then
	player:startEvent(Event(Chateau_ComingOfAge_Pieuje)) 	
elseif ((player:getMissionStatus(0,21) == 1) and (mission_status == 5)) or ((player:getMissionStatus(0,21) == 2) and (player:getMissionStatus(0,22) == 0)) then
  player:startEvent(Event(Chateau_Lightbringer_Pieuje));	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x4)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x6)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x5)) 	
elseif (player:getQuestStatus(0,87) == 2) and (player:getQuestStatus(0,88) == 0) and (player:getMainJob() == 3) and (player:getMainLvl() >=AF2_QUEST_LEVEL) then
	player:startEvent(Event(0x227));
elseif (player:getQuestStatus(0,88) == 2) and (player:getQuestStatus(0,89) == 0) and (player:getMainJob() == 3) then
	player:startEvent(Event(0x228));
else
	player:specialMessage(785);
end
end
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x49) then
	player:setVar("may_watch_final_pieuje_cs",0);
elseif (csid == Chateau_ComingOfAge_Pieuje) then
	player:setVar("may_watch_coming_of_age_pieuje",0);
elseif (csid == 0x227) then
	player:setVar("WHM_AF2_STATUS",1);
	player:addQuest(0,88);
elseif (csid == 0x228) then
	player:setVar("WHM_AF3_STATUS",1);
	player:addQuest(0,89);
	if (DEBUG_MODE) then
		toFeiYin(player)
	end;
end;
end;