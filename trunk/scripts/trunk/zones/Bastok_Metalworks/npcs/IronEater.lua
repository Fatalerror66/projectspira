-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	IronEater
-- 	Basic Chat Text, Bastok Mission 3.1 "The Four Musketeers"
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization					
BastokanFlag = 182;
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--[[							Ironeater events

0174 CS for 2.2 "Wading Beasts"
02BE "Only those on special missions and high-ranking Bastokan adventurers may enter."
02CB opening CS for 3.1 "The Four Musketeers"
02CC repeats instructiosn for "The Four Musketeers"
02D0 CS for 5.1 "Darkness Rising"   
02EE final CS for WAR AF1 "The Doorman"
025C "The doors lead to the president's office. Enter (yes/no)  "
02FF opening CS for 8.2 "The Chains That Bind Us"
0300 CS for 8.2 after returning from Quicksands
0301 mini-CS about Gumbah mentioned at http://wiki.ffxiclopedia.org/wiki/Enter_the_Talekeeper ?
0305 opening CS for 9.1 "The Salt of the Earth"
0308 final CS for 9.1 "The Salt of the Earth"
030C opening CS for Bastok 9.2 "Where Two Paths Converge"
030E final CS for 9.2."Where Two Paths Converge"- Rank 10!
0316 opening CS for "The Weight of Your Limits" (Steel Cyclone quest)
0317 get new axe of trials or give up
0318 need more WS points
0319 gives annals of truth
031A final CS for "The Weight of Your Limits"
0325 Alois CS: final CS for quest "Faded Promises"
033B participate in Conflict (Bastok citizen)    
033C participate in Conflict (Sandy citizen)
033D participate in Conflict (Windy citizen)
036E about the multinational expedition
03BC says something about him and Gumbah traveling to Grauberg
03BD repeats clue
--]]

musketeers = player:getMissionStatus(1,10); 
chains_that_bind_us = player:getMissionStatus(1,20);
two_paths_converge = player:getMissionStatus(1,23);
mission_status =  player:getVar("mission_status");

if (musketeers == 1) and (mission_status == 1) then
  player:startEvent(Event(0x2CB));
elseif (musketeers == 1) and (mission_status == 2) then
  player:startEvent(Event(0x2CC));
elseif (chains_that_bind_us == 1) and (mission_status == 1) then
  player:startEvent(Event(0x2FF));
elseif (chains_that_bind_us == 1) and (mission_status == 2) then
  player:showText(npc, 2336);
  if (DEBUG_MODE) then
    player:setPos(-468, 0, 617,240, 0xD0);   -- to Quicksand Caves
  end;
elseif (chains_that_bind_us == 1) and (mission_status == 4) then
  player:startEvent(Event(0x300));
elseif (two_paths_converge == 1) and (mission_status == 1) then  -- When Two Paths Converge
  player:startEvent(Event(0x30C))
elseif (player:getNation() == 1) and (player:getRank() >=9) then
  player:startEvent(Event(0x301))
elseif (two_paths_converge == 1) and (mission_status == 4) then -- has returned from Castle Zvahl, killed Zeid and watched CS
  player:startEvent(Event(0x30E))
else
  player:startEvent(Event(0x301));
  --player:startEvent(Event(0x02BE));
end
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
--print(csid,option);
if (csid == 0x02CB) and (option ==0) then
  player:setVar("mission_status",2);
elseif (csid == 0x2CC) and (DEBUG_MODE) then
	player:setPos(577, 25, -376, 1, 0x6D);     -- to Beadeaux
elseif (csid == 0x02FF) then
  player:setVar("mission_status",2);
elseif (csid == 0x0300) then
  add_rank_points_for_mission(player)
  player:completeMission(1,20);
  player:setVar("mission_status",0);
elseif (csid == 0x30C) then
  player:setVar("mission_status",2);
elseif (csid == 0x30E) then
  player:completeMission(1,23);
  player:addItem(BastokanFlag);
  player:specialMessage(ITEM_OBTAINED,BastokanFlag); 
  player:addGil(GIL_RATE*100000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*100000); 
  player:setTitle(296) -- "Hero among Heroes"
  player:setVar("mission_status",0);
  player:setRank(10) 
end;
end;