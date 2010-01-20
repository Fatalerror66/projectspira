-----------------------------------
--	Author: ReaperX
-- 	Alois
-- 	Bastok Mission "Wading Beasts"
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
	LizardEgg = 4362;

-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
salt_of_the_earth = player:getMissionStatus(1,22);
if (salt_of_the_earth == 1) and (mission_status == 1) then
  player:startEvent(Event(0x305));
elseif (salt_of_the_earth == 1) and (mission_status == 2) then
  player:startEvent(Event(0x306));
elseif (salt_of_the_earth == 1) and (mission_status == 4) then		-- if player forgot to talk to Dancing Wolf first
  player:startEvent(Event(0x307)); 																
elseif (salt_of_the_earth == 1) and (mission_status == 5) then
  player:startEvent(Event(0x308)); 
elseif (salt_of_the_earth == 2) then
  player:startEvent(Event(0x30A));  															-- "young politicians these days have no respect for their elders!"
else
  player:startEvent(Event(0x0172));
end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

if (trade:getItemCount() == 1) and (trade:hasItemQty(LizardEgg,1)) then
	if (player:getMissionStatus(1,4) == 1) then
    trade:isComplete();
    player:startEvent(Event(0x174))
  elseif (player:getVar("repeat_mission") == 4) then
  	trade:isComplete();
    player:startEvent(Event(0x175))
  end;
end 
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x0174) then
  add_rank_points_for_mission(player)
  player:completeMission(1,4);
  player:setVar("mission_status",0);
elseif (csid == 0x0175) then
  player:addRankPoints(BASTOK_RANK2_MISSION_REPEAT);
  player:setVar("mission_status",0);
  player:setVar("repeat_mission",0);
elseif (csid == 0x305) then
  player:setVar("mission_status",2);
elseif (csid == 0x306) and (DEBUG_MODE) then
	player:setPos(5, 8, 77, 215, 0xF7);     -- to Rabao
elseif (csid == 0x308) then
  add_rank_points_for_mission(player)
  player:removeKeyItem(MiracleSalt);
  player:completeMission(1,22);
  player:setVar("mission_status",0);
end
end;