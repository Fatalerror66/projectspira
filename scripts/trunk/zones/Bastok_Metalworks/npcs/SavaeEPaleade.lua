-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	SavaeEPaleade
-- 	Basic Chat Text. Sandy Mission 2-3
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
MythrilSand = 599;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
--[[ Events:
00C8 no time to chitchat with adventurers
00D0 "Good luck on your misison. Bastokers like to do things by the book. Stay out of trouble and follow their rules."
00D1 "You've succesfully completed your mission. Congratulations and keep up the good work."
00CC CS for 2-3, Bastok first path.
00CE CS for 2-3, Bastok 2nd path.
00CD completion of 2-3 bastok first path.
00CF completion of 2-3 bastok second path (doesnt even mention the events of the BCNM, strangely.)
--]]
mission_status = player:getVar("mission_status");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(0,5) == 1) and (mission_status == 2) then
	player:startEvent(Event(0xCC)); -- CE same event???
elseif (player:getMissionStatus(0,6) == 1) and (mission_status >=3) and (mission_status <=5) then
	player:showText(npc,1086);
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 6) then
	player:showText(npc,1101);
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 14) then
	player:startEvent(Event(0xCE));
elseif (player:getMissionStatus(0,8) == 1) and (mission_status == 15) then
	player:startEvent(Event(0xD0));
elseif (player:hasKeyItem(KindredReport) == 1) and  (player:getMissionStatus(0,5) == 1) then 
	player:startEvent(Event(0xD1));
elseif (player:hasKeyItem(KindredCrest) == 1) and  (player:getMissionStatus(0,8) == 1) then 
	player:startEvent(Event(0xCF));
else	
	player:startEvent(Event(0xC8));
end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
       count = trade:getItemCount();
MythrilSand1 = trade:hasItemQty(MythrilSand,1)
if(count == 1 and MythrilSand1 and player:getMissionStatus(0,6) == 1 and player:getVar("mission_status") == 5)then
	trade:isComplete();
	player:startEvent(Event(0xCD));
end
end;  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0xCC) then
	player:setVar("mission_status",3);
	player:currentMission(0,6);
elseif (csid == 0xCD) then
	player:setVar("mission_status",6);
	player:currentMission(0,5);
elseif (csid == 0xCE) then
	player:setVar("mission_status",15);
	player:currentMission(0,8);
	player:removeKeyItem(LetterToConsulsSandy);
elseif (csid == 0xCF) then
	player:setVar("mission_status",16);  -- return to Sandy now
	player:currentMission(0,5);
	player:addKeyItem(KindredReport)
	player:specialMessage(KEYITEM_OBTAINED,KindredReport); 
	player:removeKeyItem(KindredCrest)
elseif (csid == 0xD1) and (DEBUG_MODE) then
	player:setPos(1, 0, -6, 200, 0xE9);	-- to Halver
end
end;