-----------------------------------
-- Ambrotien
-- San d'Oria Mission NPC
-- Area: Southern San d'Oria
-- by ReaperX

-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

--[[ 									Ambrotien Events
0000 
01F7 Sandy New Adventurer CS

07DB only citizens of San dOria can apply for missions
07D8 what? I dont want this
07DA before you bring me something, you must first accept the mission
07D9 mission menu
07D1 finish current mission first

07D0 first mission
07E4 final CS for first mission (first clear)
07D2 final CS for first mission (repeat)

07E5 repeats instructions for 1.2 "Bat Hunt"
07D3 final CS for 1.2 "Bat Hunt" (repeat) (param 5 modifies dialog)
07E7 final CS for 1.2 "Bat Hunt" (first clear)
07E6 "have you really searched the tomb"? (for 1.2 "Bat Hunt")

07E9 repeats instructions for 1.3 "Save the children"
07EA final CS for 1.3 "Save The Children" + rank 2! (this is the one reported on wiki)
07E8 final CS for 1.3 "Save The Children" repeat

---------------------------------------------------------
07D4 final CS for 1.3 "Save The Children" + rank 2 (rank point explanation)
07EB final CS for 1.3 "Save The Children" first completion but no rank 2 promotion??
These two events appear to be for a reversed order version of the mission that doesn't seem to exist
on retail. See http://www.projectxi.org/wiki/index.php/San_d%27Oria_Missions for a discussion of these two
events.
--------------------------------------------------------

07D5 final CS for 2.1 "The Rescue Drill"
07D6 final CS for 2.2 "The Davoi Report" (repeat)
07D7 CS for 2.3 "Journey Abroad"
07ED repeats instructions for 3.1 "Infiltrate Davoi" ("Prince Trion has called for you..")
07DC final CS for 3.1 "Infiltrate Davoi" (repeat)
07DD CS for 3.2 "The Crystal Spring" (repeat)
07EE CS for  3.2 "The Crystal Spring" - bandits have infiltrated the castle
07EF repeats information that bandits infiltrated the castle, and orders you to speak to Curilla

07DF final CS for 5.2 "The Shadow Lord"

07EC you were told to hand this to Prince Pieuje personally?
07F0 "I know not what prince Trion wanted you to do, but see it through to the end! Understand?" (5-2 probably)

003E tells you to hurry to the chateau since something terrible is in the works there (after Magicite mission)
040C will submit the book to scholars for deciphering (6.2 "Ranperre's Final Rest")
040E tells you to wait for the deciphering of the book
0410 go to Prince Trion (book has been deciphered)
040A promotion to Rank 7
0412 princess has invited you to see the flowers
0414 promotion to rank 8
0416 "princess coming of age ceremony is about to begin" (CS after 8-1 and before 8-2)
--]]
mission_status =  player:getVar("mission_status");
repeat_status = player:getVar("repeat_mission");

if (player:getNation() ~= 0) then
	player:startEvent(Event(0x7DB)); -- for Non-San d'Orians
elseif (player:getMissionStatus(0,0) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET-60);
elseif (repeat_status == 2) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET-36);
 	if (DEBUG_MODE) then
 		player:setPos(-156, -10, 80, 119, 0x8C);	-- to Ghelsba
 	end
elseif (player:getMissionStatus(0,3) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET-24);
 	if (DEBUG_MODE) then
 		player:setPos(-485, -8, 227, 42, 0x66);	-- to La Theine Plateau
 	end
elseif ((player:getMissionStatus(0,4) == 1) or (repeat_status == 4)) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET-16);
 	if (DEBUG_MODE) then
 		player:setPos(218, 0, -5, 84, 0x95);	-- to Davoi
 	end
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET-10);
 	if (DEBUG_MODE) then
 		player:setPos(1, 0, 91, 192, 0xE7);	-- to North San d'Oria
 	end
elseif (player:getMissionStatus(0,5) == 1) and (mission_status > 1) and (player:hasKeyItem(KindredReport) == 0) then
 	player:showText(npc,MISSION_OFFSET-9); -- "What? You haven't been certified in Bastok and Windurst yet? You may dally, but others are not! Get moving!"
elseif (player:getMissionStatus(0,10) == 1) and (mission_status == 1) then
 	player:startEvent(Event(0x7ED));
elseif (repeat_status == 10) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET);
 	if (DEBUG_MODE) then
 		player:setPos(218, 0, -5, 84, 0x95);	-- to Davoi
 	end
elseif ((player:getMissionStatus(0,11) == 1) or (repeat_status == 11)) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+8);
elseif (player:getMissionStatus(0,12) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+14);
 	if (DEBUG_MODE) then
 		player:setPos(1, 0, -6, 200, 0xE9);	-- to Halver
 	end
elseif (player:getMissionStatus(0,14) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+25);
 	if (DEBUG_MODE) then
 		player:setPos(1, 0, -6, 200, 0xE9);	-- to Halver
 	end
elseif (player:getMissionStatus(0,16) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+35);
 	if (DEBUG_MODE) then
 		player:setPos(1, 0, -6, 200, 0xE9);	-- to Halver
 	end
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+38);
 	if (DEBUG_MODE) then
 		player:setPos(-38, -3, 67, 192, 0xE9);	-- to Prince Trion's Chamber
 	end
elseif (player:getMissionStatus(0,18) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+47);
 	if (DEBUG_MODE) then
 		player:setPos(133, -11, 124, 100, 0xE7);	-- to Papal Chamber
 	end
elseif (player:getMissionStatus(0,19) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+56);
	if (DEBUG_MODE) then
 		player:setPos(-511, 159, -211, 8, 0x8B);	-- to Horlais Peak
 	end
elseif (player:getMissionStatus(0,20) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+64);
 	if (DEBUG_MODE) then
 		player:setPos(1, 0, -6, 200, 0xE9);	-- to Halver
 	end
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 1) then 	
	if (DEBUG_MODE) then
 		player:setPos(0, -2, 8, 192, 0xE9);	-- to Great Hall
 	end
 	player:showText(npc,MISSION_OFFSET+69);
elseif (player:getMissionStatus(0,22) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+73);
	if (DEBUG_MODE) then
 		player:setPos(0, -2, 8, 192, 0xE9);	-- to Great Hall
 	end
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 1) then 	
 	player:showText(npc,MISSION_OFFSET+83);
elseif (player:getRank() == 7) and (player:getMissionStatus(0,18) == 2) and (player:getMissionStatus(0,19) == 0)  and has_rank_points_for_mission(player, 19) and (mission_status == 1) then
	player:showText(npc,MISSION_OFFSET+51);
	if (DEBUG_MODE) then
 		player:setPos(-83, -3, 53, 186, 0xE9);	-- to Chateau Garden
 	end
elseif (player:hasKeyItem(MessageToJeunoSandy) == 1) then
	player:startEvent(Event(0x3E));
else
	rank = player:getRank()
	mission_mask, repeat_mask = get_mission_mask(player);
	--print(mission_mask,repeat_mask);
	event = Event(0x7D9); 	-- default event: mission menu 
	
	repeat_mask = 0; -- work in progress- old repeat_mask value is incorrect
	if (player:getMissionStatus(0,1) == 2) then
		repeat_mask = repeat_mask + 32;
	end
	if (player:getMissionStatus(0,2) == 2) then
		repeat_mask = repeat_mask + 256;
	end
	if (player:getMissionStatus(0,10) == 2) then
		repeat_mask = repeat_mask + 32768;
	end
	-- missions 2-2 and 3-2 appear to have same opening dialog for first time and repeat.	
	event:setParams(mission_mask, 0, 0 ,0 ,0 ,repeat_mask);
	 
if (rank == 1) and (player:getMissionStatus(0,0) == 0) then
	event = Event(0x7D0);
elseif (player:getMissionStatus(0,1) == 1) and (mission_status == 2) then
  	event = Event(0x7E6);
elseif (player:getMissionStatus(0,1) == 1) then
  	event = Event(0x7E5);
elseif (player:getMissionStatus(0,2) == 1) and (mission_status == 1) then
  	event = Event(0x7E9);
elseif (player:getMissionStatus(0,2) == 1) and (mission_status == 4) then
  	event = Event(0x7EA);
elseif (player:getVar("repeat_mission") == 2) and (mission_status == 4) then
  	event = Event(0x7E8);
elseif (player:hasKeyItem(RescueTrainingCertificate) == 1) then
	event = Event(0x7D5);
elseif (player:hasKeyItem(TempleKnightsDavoiReport) == 1)  and (player:getVar("repeat_mission") == 4) then
	event = Event(0x7D6);
elseif (player:hasKeyItem(TempleKnightsDavoiReport) == 1)  then
	event = Event(0x7EC);
	event:setParams(0,0,0,TempleKnightsDavoiReport);
elseif (player:getVar("repeat_mission") == 10) and (mission_status == 3) then
	event = Event(0x7DC);
elseif (player:hasKeyItem(KindredReport) == 1) then
	event = Event(0x7D7);
elseif (player:getMissionStatus(0,11) == 1) and (mission_status == 2) then 	
 	event = Event(0x7ef);
elseif (player:hasKeyItem(ShadowFragment) == 1) then
	event = Event(0x7DF);
elseif (player:getMissionStatus(0,15) == 1) then
	event = Event(0x7F0);
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 4) then
	event = Event(0x40C);
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 5) then
	decyphering_started = player:getVar("BOOK_DECYPHERING_STARTED");
	if ((os.time()-decyphering_started) > WAIT_TIME_FOR_BOOK_DECIPHERING) then
		event = Event(0x410);
	else
		event = Event(0x40E);
	end
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 6) then
 	  event = Event(0x410);
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 8) then
 	  event = Event(0x40A);
elseif (player:getRank() == 7) and (player:getMissionStatus(0,18) == 2) and (player:getMissionStatus(0,19) == 0) and has_rank_points_for_mission(player, 19) and (mission_status == 2) then
    player:setVar("mission_status",0); 														-- player has seen the princess CS and is ready to take mission 7-2
elseif (player:getRank() == 7) and (player:getMissionStatus(0,18) == 2) and has_rank_points_for_mission(player, 19) and (mission_status == 0) then
 	  event = Event(0x412);
elseif (player:hasKeyItem(CrystalDowser) == 1) then
 	  event = Event(0x414);
elseif (player:getMissionStatus(0,20) == 2) and (player:getMissionStatus(0,21) == 0) and (mission_status == 5) then
 	  event = Event(0x416);
elseif (mission_status > 0) and (not ((player:getMissionStatus(0,14) == 1) and (mission_status == 2))) then
    event = Event(0x7D1);  														           -- can't do two missions at once
end
	player:startEvent(event);
end
end
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

weighted_sum = traded_crystals(trade,1);
repeat_mission = player:getVar("repeat_mission");
mission_status = player:getVar("mission_status")
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
	player:specialMessage(1488)
elseif (player:getMissionStatus(0,0) == 1) and (trade:getItemCount() == 1) and (trade:hasItemQty(OrcishAxe,1)) then
	trade:isComplete();
	player:startEvent(Event(0x7E4));
elseif (repeat_mission == -1) and (trade:getItemCount() == 1) and (trade:hasItemQty(OrcishAxe,1)) then
	trade:isComplete();
	player:startEvent(Event(0x7D2));
elseif (player:getMissionStatus(0,1) == 1) and (trade:getItemCount() == 1) and (trade:hasItemQty(OrcishMailScales,1)) then
	if (mission_status == 1) then
		player:startEvent(Event(0x7E6));
	else
		trade:isComplete();
		player:startEvent(Event(0x7E7));
	end
elseif (repeat_mission == 1) and (trade:getItemCount() == 1) and (trade:hasItemQty(BatFang,1)) then
	trade:isComplete();
	event = Event(0x7D3);
	if (player:getRank() > 1) then
		event:setParams(0,0,0,0,1);
	end
	player:startEvent(event);
elseif (player:getMissionStatus(0,11) == 1) and (trade:getItemCount() == 1) and (trade:hasItemQty(CrystalBass,1)) and (mission_status == 1) then
	player:startEvent(Event(0x7EE));
	trade:isComplete();
elseif (repeat_mission == 11) and (trade:getItemCount() == 1) and (trade:hasItemQty(CrystalBass,1)) then
	player:startEvent(Event(0x7DD));
	trade:isComplete();
elseif (player:getRank() >=2) and (weighted_sum > 0) then -- can only trade crystals if rank at least 2.
	if (player:getRankPoints() >= 4095) then
		player:showText(npc,RANK_POINTS_DIALOG);
	else
		trade:isComplete();
		rank_points = add_crystals_to_rank_points(player, weighted_sum)
		if (player:getRankPoints() >= 4095) then
			player:showText(npc,RANK_POINTS_DIALOG+1); -- rank points are full now
		else
			player:showText(npc,RANK_POINTS_DIALOG+2);
		end
	end
elseif (mission_status == 0) and (player:getRank() == 1) then
	player:startEvent(Event(0x7DA));
elseif (trade:getItemCount() == 1) then
	player:startEvent(Event(0x7D8));
end
end; 


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x7D0) and (option == 0) then 
	player:currentMission(0,0);
	player:specialMessage(MISSION_OFFSET-71); -- "You accept the mission."
	player:setVar("mission_status",1); 		  -- on mission 1.1 now.
	player:setVar("chalvatot",1);      		  -- flag indicates that we haven't met the royal gardener yet.
elseif (csid == 0x7E4) then					  -- 1.1 "Smash the Orcish Scouts" first completion
	player:completeMission(0,0);
	add_rank_points_for_mission(player);
	player:setVar("mission_status",0);
elseif (csid == 0x7D2) then				  	  -- 1.1 "Smash the Orcish Scouts" repeat
	player:addRankPoints(SANDY_RANK1_MISSION_REPEAT);
	player:setVar("mission_status",0);
	player:setVar("repeat_mission",0);
elseif (csid == 0x7E5) and (DEBUG_MODE) then
	player:setPos(-2, 0, -95, 53, 0xBE);    -- to KRT
elseif (csid == 0x7E7) then					-- 1.2 "Bat Hunt" first completion
	player:completeMission(0,1);
	add_rank_points_for_mission(player);
	player:setVar("mission_status",0);
elseif (csid == 0x7E9) and (DEBUG_MODE) then
	player:setPos(148, 0, 139, 220, 0xE7);	-- to Arnau
elseif (csid == 0x7D3) then					-- 1.2 "Bat Hunt" repeat
	player:addRankPoints(SANDY_RANK1_MISSION_REPEAT); 
	player:setVar("mission_status",0);
	player:setVar("repeat_mission",0);
elseif (csid == 0x7EA) then
	player:completeMission(0,2);			-- 1.3 Save the Children first completion 
	player:addGil(GIL_RATE*1000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*1000); 
	player:setVar("mission_status",0); 
	player:rankUp()
	player:specialMessage(MISSION_OFFSET2-8); -- "you achieve rank 2".
elseif (csid == 0x7E8) then					  -- 1.3 Save the Children repeat
	player:addRankPoints(SANDY_RANK1_MISSION_REPEAT);
	player:setVar("mission_status",0); 
	player:setVar("repeat_mission",0);
	  --player:specialMessage(MISSION_OFFSET2-6); -- "I award you with rank points commensurate with your achievement." verified: not on retail
elseif (csid == 0x7D5) then						  -- Rescue Drill completion
	add_rank_points_for_mission(player);
	player:removeKeyItem(RescueTrainingCertificate);
	player:completeMission(0,3);
	player:setVar("mission_status",0); 
elseif (csid == 0x7EC) and (DEBUG_MODE) then
	player:setPos(132, -11, 125, 93, 0xE7);	-- to Papal chamber
elseif (csid == 0x7D6) then					-- Davoi Report repeat (original completion has no oneventfinish)
	add_rank_points_for_mission(player);
	player:removeKeyItem(TempleKnightsDavoiReport);
 	player:setVar("repeat_mission",0); 			
 	player:setVar("mission_status",0);
elseif (csid == 0x7ED) and (DEBUG_MODE) then
	player:setPos(-38, -3, 67, 192, 0xE9);	-- to Prince Trion's Chamber
elseif (csid == 0x7DC) then					-- Infiltrate Davoi repeat
	add_rank_points_for_mission(player);
 	player:setVar("repeat_mission",0); 
 	player:setVar("mission_status",0);
elseif (csid == 0x7EE) then				-- The Crystal Spring
	player:setVar("mission_status",2); 
elseif (csid == 0x7DD) then				-- The Crystal Spring	
	player:addRankPoints(SANDY_RANK3_MISSION_REPEAT);
	player:setVar("mission_status",0); 
	player:setVar("repeat_mission",0);
elseif (csid == 0x7EF) and (DEBUG_MODE) then
 	player:setPos(1, 0, 91, 192, 0xE7);	-- to North San d'Oria
elseif (csid == 0x3E) and (DEBUG_MODE) then
 	player:setPos(1, 0, -6, 200, 0xE9);	-- to Halver
elseif (csid == 0x7F0) and (DEBUG_MODE) then
	player:setPos(-38, -3, 67, 192, 0xE9);	-- to Prince Trion's Chamber
elseif (csid == 0x40C) then
	player:setVar("mission_status",5); 
	player:setVar("BOOK_DECYPHERING_STARTED",os.time());
	player:removeKeyItem(AncientSandOrianBook);
elseif (csid == 0x410) then
	player:setVar("mission_status",6); 
	player:setVar("BOOK_DECYPHERING_STARTED",0);
	if (DEBUG_MODE) then
 		player:setPos(-38, -3, 67, 192, 0xE9);	-- to Prince Trion's Chamber
 	end
elseif (csid == 0x7DF) then -- undocumented, but apparently, promotion to rank 6 is possible at the gate guard too.
 	player:removeKeyItem(ShadowFragment);
  	player:rankUp(); -- rank-up but mission not completed until we've watched a final CS
  	player:addGil(GIL_RATE*20000)
  	player:specialMessage(GIL_OBTAINED,GIL_RATE*20000); 
  	player:setTitle(ShadowBanisher);
  	player:setVar("mission_status",4);
elseif (csid == 0x40A) then
	player:completeMission(0,17);
	player:addGil(GIL_RATE*40000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*40000); 
	player:setVar("mission_status",0); 
	player:rankUp();
elseif (csid == 0x414) then
	player:completeMission(0,19);
	player:removeKeyItem(CrystalDowser);
	player:addGil(GIL_RATE*60000);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*60000); 
	player:setVar("mission_status",0); 
	player:rankUp();
elseif (csid == 0x412) then
	player:setVar("mission_status",1); 
elseif (csid == 0x7D9) and (option~= 31) and (option~=1073741824) then 		-- has chosen a mission
	if (option>=100) then
		option = option -100;
		--print("Adjusting the mission ID");
	end
	if ( ((option == 0) and (player:getMissionStatus(0,0) ==2))  or          --  "Smash the Orcish Scouts" repeat
		((option == 1) and (player:getMissionStatus(0,1) ==2))  or           --  "Bat Hunt" repeat
		((option == 2) and (player:getMissionStatus(0,2) ==2))  or			 --  "Save the Children" repeat
		((option == 4) and (player:getMissionStatus(0,4) ==2))  or			 --  "The Davoi Report" repeat
		((option == 10) and (player:getMissionStatus(0,10) == 2))  or        --  "Infiltrate Davoi" repeat
		((option == 11) and (player:getMissionStatus(0,11) == 2)) ) then     --  "The Crystal Spring" repeat
    if (option == 0) then
    	player:setVar("repeat_mission",-1); 								-- special treatment for mission 0
    else
    	player:setVar("repeat_mission",option);
    end
else
	player:currentMission(0,option);
end
	player:setVar("mission_status",1); -- on a mission now.
	player:specialMessage(MISSION_OFFSET-71); -- "You accept the mission."
end
end; 
 
--------------------------------------
-- Self defined function that will be triggered on event 0x80073 finish.
--------------------------------------
function onEventXFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);


-- Used outside ALL loops to release NPC after event to prevent freezing. REQUIRED FUNCTION
--player:sendRelease()

end;

