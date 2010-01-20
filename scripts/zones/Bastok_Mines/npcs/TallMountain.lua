-----------------------------------
--	Author: Almendro, ReaperX
-- 	Tall Mountain
-- 	NPC that is involved with the quest "Stamp Hunt" + Bastok Mission 6.2
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end

        StampSheet = player:hasKeyItem(0x66);
    StampHuntCount = player:getVar("StampHunt-Counter");
        StampHuntC = testflag(tonumber(StampHuntCount),0x4);

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Stamp Hunt"
if(StampSheet == 1 and StampHuntC == false) then
	player:setVar("StampHunt-Counter",StampHuntCount+0x4);
	player:startEvent(Event(0x55));
elseif (player:hasKeyItem(AltepaMoonpebble) == 1) then
  player:startEvent(Event(0xB6))  -- Bastok Mission 6.2
else
	player:startEvent(Event(0x37));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 


function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0xB6) then
  add_rank_points_for_mission(player);
  player:setVar("mission_status",0);
  player:completeMission(1,16); 
  player:removeKeyItem(AltepaMoonpebble)
end
end;