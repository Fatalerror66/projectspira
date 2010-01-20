-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Karst, Bastokan President
-- 	Basic Chat Text, Bastok Mission 5.2 "Xarcabard, Land of Truths "
--  this should probably be moved to the door to his office
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
require("scripts/globals/teleports");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--[[ 										Karst Events
0259 default response - stop bothering me
02C9 opening CS for 2.3 "The Emissary"
02CA final CS for 2.3 "The Emissary" - rank 3!s
02D0 CS for 5.1 "Darkness Rising"
02D1 CS for 5.1 "Darkness Rising"
02D2 final CS for 5.1 "Darkness Rising"
025A opening CS for 5.2 "Xarcabard, Land of Truths"
025B final CS for 5.2 "Xarcabard, Land of Truths"
02FD first CS for 7.2 "On My Way"
02FE final CS for 7.2 "On My Way"
030C opening CS for 9.2 "Where Two Paths Converge"
030E final CS for 9.2."Where Two Paths Converge"- Rank 10!
033B
033C    
033D
--]]

mission_status = player:getVar("mission_status")
on_my_way_status = player:getMissionStatus(1,19);

if (player:getMissionStatus(1,5) == 1) and (mission_status == 1) and (player:hasKeyItem(LetterToConsulsBastok) == 1) then
  player:showText(npc,1045)
elseif (player:hasKeyItem(ShadowFragment) == 1) then
  player:startEvent(Event(0x025B))
elseif (player:getMissionStatus(1,15) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x025A))
elseif (player:getMissionStatus(1,15) == 1) and (mission_status == 2) then
  player:showText(npc,1334)
  if (DEBUG_MODE) then
  	toThroneRoom(player);
  end;
elseif (on_my_way_status == 1) and (mission_status == 4) then
  event = Event(0x02FE);
  if (player:hasKeyItem(LetterFromWerei) == 1) then
    event:setParams(1);
  end
  player:startEvent(event)
elseif (player:hasKeyItem(LetterFromWerei) == 1) then
  player:showText(npc,2109)
  if (DEBUG_MODE) then
  	player:setPos(52, 0, -32.5, 60, 0xEA);     -- to Gumbah
  end;
elseif (on_my_way_status == 1) and (mission_status == 1) then
  player:startEvent(Event(0x02FD))
elseif (on_my_way_status == 1) and (mission_status == 2) then
  player:showText(npc,2105)
  if (DEBUG_MODE) then
    player:setPos(-156, -11.4, 16, 200, 0xEC); -- to Hilda
  end;
elseif (player:getMissionStatus(1,23) == 1) and (player:getVar("mission_status") == 2) then
  player:showText(npc,2285)
else
  player:startEvent(Event(0x0259));
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
if (csid == 0x025A) then
  player:setVar("mission_status",2);
elseif (csid == 0x025B) then
  player:completeMission(1,15);
  player:removeKeyItem(ShadowFragment);
  player:addGil(GIL_RATE*20000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*20000); 
  player:setTitle(ShadowBanisher);
  player:setVar("mission_status",0);
  player:rankUp()
elseif (csid == 0x02FE) then
  add_rank_points_for_mission(player)
  player:completeMission(1,19);
  player:addGil(GIL_RATE*60000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*60000); 
  player:setVar("mission_status",0);
  player:rankUp()
elseif (csid == 0x02FD) then
  player:setVar("mission_status",2);
end
end;