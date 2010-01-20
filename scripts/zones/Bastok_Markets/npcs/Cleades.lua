-----------------------------------
--	Author: ReaperX
-- 	Cleades (Bastok Mission NPC)
--
--  Unverified behavior: there are 4 variations of the Fetichism final CS : with/without
--  rank promotion, with/without additional story CS that is specific to the zone. I have 
--  implemented them based on the hypothesis that you get the additional story CS whenever 
--  you finish Fetichism in that zone for the first time. I could find no information to
--  verify this.
--
--  Rank point rewards for repeat missions remain approximations/guesses.

-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

-- initialization

RANK_POINTS_DIALOG = 1315; -- You do not need to donate any more crystals ..
LOW_MISSION_OFFSET = 262;  -- You can consult the ..
MISSION_6_1_OFFSET = 1629; -- Go to Ore Street ..

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

--[[ 								 Events

0000 Bastok New Adventurer
03E8 "I'm in charge of assigning missions to Bastokers who wish to serve their country. Are you one of them?"
03E9 Mission Menu
03EA cannot do two missions at a time.
03EB Non-Bastokan citizens cannot do missions.

03EC final CS for "Fetichism" and promotion to rank 2, no additional CS
03ED final CS for 1.3 Fetichism repeat, no additional CS
03F0 final CS for "Fetichism" and promotion to rank 2, additional CS with Ironeater talking about the disappearance of Werei
03F1 final CS for "Fetichism" repeat  and promotion to rank 2, additional CS with Ironeater talking about the disappearance of Werei

03F2 final for "To the Forsaken Mines" (with CS involving Ironeater and Detzo)
03EE final CS for "To the Forsaken Mines" (repeat)

03EF you have returned from Jeuno, speak to Naji
03F3 "you've been ordered by the president to deliver the letter from Werei. Return when you have completed that task."
--]]

if (player:getNation() ~= 1) then
	player:startEvent(Event(0x3EB)); -- for Non-Bastokans
else
  rank = player:getRank()
  mission_status = player:getVar("mission_status");
  repeat_mission = player:getVar("repeat_mission");  
  if (player:getMissionStatus(1,0) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET);
  	if (DEBUG_MODE) then
  	  player:setPos(-58, 8, -329, 81, 0xAC);   -- to Makarim
  	end;
  elseif (player:getMissionStatus(1,1) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+3);
  	if (DEBUG_MODE) then
  	  player:setPos(-13, -11, 0, 196, 0xED);   -- to Cid
  	end;
  elseif ((player:getMissionStatus(1,2) == 1) and (mission_status == 1)) or (repeat_mission == 2) then
  	player:showText(npc,LOW_MISSION_OFFSET+6);
  elseif (player:getMissionStatus(1,3) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+19);
  	if (DEBUG_MODE) then
  	  player:setPos(-13, -11, 0, 196, 0xED);   -- to Cid
  	end;
  elseif ((player:getMissionStatus(1,4) == 1) or (repeat_mission == 4)) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+21);
  	if (DEBUG_MODE) then
  	  player:setPos(95, -20, 14, 120, 0xED);     -- to Alois
  	end;
  elseif (player:getMissionStatus(1,5) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+23);
  	if (DEBUG_MODE) then
  	  player:setPos(64, -14, 4, -5, 0xED);     -- to Naji
  	end;
  elseif (player:getMissionStatus(1,10) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+27);
  	if (DEBUG_MODE) then
  	  player:setPos(89, -20, 0, 240, 0xED);     -- to Iron Eater
  	end;
  elseif ((player:getMissionStatus(1,11) == 1) or (repeat_mission == 11)) and (mission_status == 1)  then
  	player:showText(npc,LOW_MISSION_OFFSET+30);
  	if (DEBUG_MODE) then
  	  player:setPos(83, 0, 29, 189, 0xEA);     -- to Davyad
  	end;
  elseif (player:getMissionStatus(1,12) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+35);
  	if (DEBUG_MODE) then
  	  player:setPos(55, -14, -14, 62, 0xED);      -- to Lucius
  	end;
  elseif (player:getMissionStatus(1,14) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+37);
  	if (DEBUG_MODE) then
  	  player:setPos(64, -14, 4, -5, 0xED);     -- to Naji
  	end;
  elseif (player:getMissionStatus(1,15) == 1) and (mission_status == 1) then
  	player:showText(npc,LOW_MISSION_OFFSET+39);
  	if (DEBUG_MODE) then
  	  player:setPos(89, -20, 0, 0, 0xED);     -- to President's Office
  	end;
  elseif (player:getMissionStatus(1,16) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET);
  	if (DEBUG_MODE) then
  	  player:setPos(-40, 0, 38, 209, 0xEA);     -- to Medicine Eagle in Mines
  	end;
  elseif (player:getMissionStatus(1,17) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET+3);
  	if (DEBUG_MODE) then
  	  player:setPos(64, -14, 4, -6, 0xED);     -- to Naji
  	end; 	
  elseif (player:getMissionStatus(1,18) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET+5);
  	if (DEBUG_MODE) then
  	  player:setPos(-13, -11, 0, 196, 0xED);   -- to Cid
  	end;
  elseif (player:getMissionStatus(1,19) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET+7);
  	if (DEBUG_MODE) then
  	  player:setPos(89, -20, 0, 0, 0xED);     -- to President's Office
  	end;
  elseif (player:getMissionStatus(1,20) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET+10);
  	if (DEBUG_MODE) then
  	  player:setPos(89, -20, 0, 240, 0xED);     -- to Iron Eater
  	end;
  elseif (player:getMissionStatus(1,21) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET+12);
  	if (DEBUG_MODE) then
  	  player:setPos(-71, 0, 60, 124, 0xAC);     -- to Drake Fang
  	end;
  elseif (player:getMissionStatus(1,22) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET+14);
  	if (DEBUG_MODE) then
  	  player:setPos(95, -20, 14, 120, 0xED);     -- to Alois
  	end;
  elseif (player:getMissionStatus(1,23) == 1) and (mission_status == 1) then
  	player:showText(npc,MISSION_6_1_OFFSET+19);
  	if (DEBUG_MODE) then
  	  player:setPos(89, -20, 0, 0, 0xED);     -- to President's Office
  	end;
  elseif (rank == 1) and (player:getMissionStatus(1,0) == 0) then
    player:startEvent(Event(0x03E8));
  elseif (rank == 5) and (player:hasKeyItem(MessageToJeunoBastok) == 1) then
    player:startEvent(Event(0x03EF));
  elseif (player:hasKeyItem(LetterFromWerei) == 1) then
    player:startEvent(Event(0x03F3));
  elseif (mission_status > 0) then
    player:startEvent(Event(0x03EA));  -- can't do two missions at once
  else  
    mission_mask, repeat_mask = get_mission_mask(player);
	  event = Event(0x03E9); -- default event: mission menu 
	  event:setParams(mission_mask,0,0,0,0,repeat_mask);
	  player:startEvent(event);
	end;
end;
end
 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

fetichism_active = (player:getMissionStatus(1,2) == 1) or (player:getVar("repeat_mission") == 2)
forsaken_mines_active = (player:getMissionStatus(1,11) == 1) or (player:getVar("repeat_mission") == 11)

if (player:getNation() == 1) then
  if fetichism_active and (trade:getItemCount() == 4) and 
     (trade:hasItemQty(QuadavFetichHead,1)) and (trade:hasItemQty(QuadavFetichTorso,1)) and 
     (trade:hasItemQty(QuadavFetichArms,1)) and (trade:hasItemQty(QuadavFetichLegs,1)) then
    if (player:getRank() == 1) then
      player:startEvent(Event(0x03F0))
      player:setVar("FetichismMarkets",1)
    else
      if (player:getVar("FetichismMarkets") == 1) then
        player:startEvent(Event(0x03ED))
      else
        player:setVar("FetichismMarkets",1)
        player:startEvent(Event(0x03F1))
      end;
    end;
    trade:isComplete();
  elseif forsaken_mines_active and (trade:getItemCount() == 1) and (trade:hasItemQty(ChunkOfGlocolite,1)) then
    if (player:getVar("ForsakenMinesMarkets" == 0)) then
      player:startEvent(Event(0x03F2)); -- first time this mission has been finished in this area.
      player:setVar("ForsakenMinesMarkets",1);
    else
      player:startEvent(Event(0x03EE))
    end
    trade:isComplete();
  elseif (player:getRank() >=2) then -- can only trade crystals if rank at least 2.
    weighted_sum = traded_crystals(trade,1);  
    --print("sum of crystals: ",weighted_sum);
    if (weighted_sum > 0) then
      if (player:getRankPoints() >= 4095) then
        player:showText(npc,RANK_POINTS_DIALOG);
      else
        trade:isComplete();
        rank_points = add_crystals_to_rank_points(player, weighted_sum)
        --print("rank points added: ", rank_points);
        if (player:getRankPoints() >= 4095) then
          player:showText(npc,RANK_POINTS_DIALOG+1); -- rank points are full now
        else
          player:showText(npc,RANK_POINTS_DIALOG+2);
        end;
      end;
    end;
  end
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x3E8) and (option == 0) then 
  player:currentMission(1,0);
  player:setVar("mission_status",1); -- on a mission now.
elseif (csid == 0x3E9) and (option~= 31) and (option~=1073741824) then 			-- has chosen a mission
  if ( ((option == 2) and (player:getMissionStatus(1,2) ==2))  or             -- Fetichism repeat
       ((option == 4) and (player:getMissionStatus(1,4) ==2)) or							-- Wading Beasts repeat
       ((option ==11) and (player:getMissionStatus(1,11) == 2)) ) then          -- To the Forsaken Mines
    player:setVar("repeat_mission",option);
  else
    player:currentMission(1,option);
  end;
  player:setVar("mission_status",1); -- on a mission now.
elseif (csid == 0x3EC) or (csid == 0x3F0) then
  player:completeMission(1,2);																							  -- Fetichism first completion 
  player:addGil(GIL_RATE*1000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*1000); 
  player:setVar("mission_status",0); 
  player:rankUp()
elseif (csid == 0x3ED) or (csid == 0x3F1) then															-- Fetichism repeat
  player:addRankPoints(BASTOK_RANK1_MISSION_REPEAT); 
  player:setVar("mission_status",0); 
  player:setVar("repeat_mission",0);
elseif (csid == 0x3F2) then																									-- Forsaken Mines First Completion
  add_rank_points_for_mission(player);
  player:completeMission(1,11); 
  player:setVar("mission_status",0); 
elseif (csid == 0x3EE) then																									-- Forsaken Mines Repeat
  player:addRankPoints(BASTOK_RANK3_MISSION_REPEAT);
  player:setVar("mission_status",0); 
  player:setVar("repeat_mission",0);
elseif (csid == 0x3EF) and (DEBUG_MODE) then
	player:setPos(64, -14, -5, 7, 0xED);     -- to Naji
end
end; 