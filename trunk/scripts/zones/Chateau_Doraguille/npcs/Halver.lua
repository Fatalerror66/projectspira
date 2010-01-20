-- Halver (Sandy Mission NPC)
-- By: ReaperX
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
require("scripts/globals/teleports");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");

HALVER_OFFSET = 547; -- "The princess is always speaking of your deeds for the Kingdom. "
-----------------------------------
--[[  Halver events: 

 0009 : Chateau_TheHeirToTheLight_Pt3: final CS for 9-2 "The Heir to the Light" + Promotion to rank 10!
 0041 : opening CS for quest "Fit for a Prince"
 0042 : final CS for quest "Fit for a Prince"
 0043 : to cancel quest "Fit for a Prince"
 0070 : CS for quest "A Timely Visit"
 001A : "You may proceed to the audience chamber" (probably  8-2 "Lightbringer")
 001B : (talks about rites of succession and the recovery of the king) (between 9-1 and 9-2)?
 001C : "I never doubted your ability on the front line." (9-2)
 001D : Sandy mission ("we can count on your assistance in our country's time of need") (9-2)
 001E : Sandy mission 8-2 "Lightbringer"
 001F : "thanks to your efforts,the chateau regained that sense of peacefulness that it had lacked for so long." (response at rank 10)
 0009 : final CS for Sandy 9-2 (Rank 10!)
 0016 : Sandy mission 6-1 "Leaute's Last Wishes" (after returning with the dream rose)
 0017 : Sandy mission 6-1 (the king is ready for your audience. Proceed to the great hall.)
 0018 : Sandy mission 6-1 repeats instructions to retrieve a dreamrose from Altep
 0019 : Sandy mission 6-1 (opening CS)
 0214 : "come back once you have been officially recognized" (while 2-3 has not been completed yet)
 01F5 : Bastok Mission 2.3 "The Emissary" (Sandy->Windy) : defeat Warchief Vatgit
 01F6 : Windurst Mission 2.3 "The Three Kingdoms" (Sandy->Bastok) : defeat Warchief Vatgit
 01F7 : Bastok Mission 2.3 "The Emissary" (Windy->Sandy) -> BCNM at Horlais Peak
 01F8 : Windurst Mission 2.3 "The Three Kingdoms" (Bastok->Sandy) -> BCNM at Horlais Peak
 
 01F9 : opening CS for Sandy 2-3 
 01FB : final CS for Sandy 2-3 -> Sandy Rank 3!
 
 01FC : opening CS for 3-3 "Appointment to Jeuno"
 01FE : Sandy 3-3 : repeats instructions to head to Jeuno
 
 0001 : repeats instructions for Sandy mission 9-1 "Breaking Barriers"
 021F : empty event?
 0215 : Chateau_TheRuinsOfFeiYin_Pt2: CS for 5-1 "The Ruins of Fei'Yin"
 0216 : Chateau_TheRuinsOfFeiYin_Pt3: CS for 5-1 "The Ruins of Fei'Yin" (after completing BCNM)
 0222 : CS for 5-2 "The Shadow Lord" (Trion is looking for you)
 0224 : CS for 5-2 "The Shadow Lord" (rank 6!)
 0225 : "someone gave you this envelope?"
 003A : CS for 8-1 "Coming of Age"
 0066 : "Ah, drops of Amnio." (8-1 "Coming of Age")
 022E : "Lure of the Wildcat" quest
 0233 : Aht Urhgan Mission 5: Confessions of Royalty
 0234 : same as 0x233?
 0235 : Aht Urhgan Mission 5 (repeats instructions to travel to Jeuno)

--]]
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(1,5) == 1) and (mission_status == 3) then         -- The Emissary (San d'Oria) (Sandy 1st path)
	player:startEvent(Event(0x1F5)) 
elseif (player:getMissionStatus(1,6) == 1) and (mission_status == 4) then
  player:showText(npc,HALVER_OFFSET+279) 
  if (DEBUG_MODE) then
    --player:setPos(-133, 3, 130, 185, 0xBF);   -- to Wadi
  end;
elseif (player:getMissionStatus(1,8) == 1) and (mission_status == 17) then    -- The Emissary (San d'Oria) (Sandy 2nd path) 
 	player:startEvent(Event(0x1F7)) 
elseif (player:getMissionStatus(1,8) == 1) and (mission_status == 18) then
	player:showText(npc,HALVER_OFFSET+279) 
	if (DEBUG_MODE) then
		player:setPos(-509, 159, -210, 0, 0x8B);   -- to Horlais Peak
	end;
elseif (player:getMissionStatus(2,6) == 1) and (mission_status == 3) then     -- The Three Kingdoms (San d'Oria) (Sandy 1st path)
	player:startEvent(Event(0x1F6)) 
elseif (player:getMissionStatus(2,6) == 1) and (mission_status == 4) then
	player:showText(npc,HALVER_OFFSET+279) 
	if (DEBUG_MODE) then
		player:setPos(-4, 32, 273, 94, 0x8C);   -- to Ghelsba Outpost
	end;
elseif (player:getMissionStatus(2,8) == 1) and (mission_status == 17) then    -- The Three Kingdoms (San d'Oria) (Sandy 2nd path) 
	player:startEvent(Event(0x1F8)) 
elseif (player:getMissionStatus(2,8) == 1) and (mission_status == 18) then
	player:showText(npc,HALVER_OFFSET+279) 
	if (DEBUG_MODE) then
		player:setPos(-509, 159, -210, 0, 0x8B);   -- to Horlais Peak
	end;
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x1F9)) 
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 2) then
  player:showText(npc,HALVER_OFFSET+252) 
elseif (player:hasKeyItem(KindredReport) == 1) then
	player:startEvent(Event(0x1FB)) 
elseif (player:getMissionStatus(0,5) == 1) and (mission_status >= 3) then
  player:startEvent(Event(0x214)) 
elseif (player:getMissionStatus(0,5) == 2) and (player:getMissionStatus(0,10) == 0) then
	player:showText(npc,HALVER_OFFSET+287)
elseif (player:getMissionStatus(0,5) == 1) then
	player:startEvent(Event(0x214)) 
elseif (player:getMissionStatus(0,11) == 1) and (mission_status == 3) then
	player:showText(npc,HALVER_OFFSET+831)
elseif (player:getMissionStatus(0,12) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x1FC)) 
elseif (player:getMissionStatus(0,12) == 1) and (mission_status == 2) then
	player:showText(npc,HALVER_OFFSET+294) 
elseif (player:getMissionStatus(0,12) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x1FE)) 
elseif (player:getMissionStatus(0,12) == 1) then
	player:showText(npc,HALVER_OFFSET+465) -- "How are things in Jeuno? Remember--you're on a direct mission for our king. Do your best."
elseif (player:getMissionStatus(0,13) == 1) then
	player:showText(npc,HALVER_OFFSET+466) -- "I heard you've received a mission directly from the Archduke of Jeuno himself"
elseif (player:getMissionStatus(0,14) == 1) and (mission_status == 1) then
  player:startEvent(Event(Chateau_TheRuinsOfFeiYin_Pt2)) 
elseif (player:getMissionStatus(0,14) == 1) and (mission_status == 2) then
  player:showText(npc,HALVER_OFFSET+334) 
  if (DEBUG_MODE) then
    toFeiYin(player);
  end;
elseif (player:hasKeyItem(BurntSeal) == 1) then
	player:startEvent(Event(Chateau_TheRuinsOfFeiYin_Pt3)) 
elseif (player:getMissionStatus(0,14) == 2) and (player:getMissionStatus(0,15) == 0) then
	player:showText(npc,HALVER_OFFSET+865) 
elseif (player:getMissionStatus(0,13) == 2) and (player:getMissionStatus(0,14) == 0) and (mission_status == 0) then
	player:showText(npc,HALVER_OFFSET+323);
elseif (player:getMissionStatus(0,15) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x222)) 
elseif (player:hasKeyItem(ShadowFragment) == 1) then
	player:startEvent(Event(0x224)) 
elseif (player:getMissionStatus(0,15) == 1) and (mission_status == 4) then
	player:showText(npc,HALVER_OFFSET+471);
elseif (player:getMissionStatus(0,15) == 2) and (player:getMissionStatus(0,16) == 0) then
	player:showText(npc,HALVER_OFFSET+500);
elseif (player:hasKeyItem(Dreamrose) == 1) then
	player:startEvent(Event(0x16)) 
elseif (player:getMissionStatus(0,16) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x19)) 
elseif (player:getMissionStatus(0,16) == 1) and (mission_status == 2) then
  player:startEvent(Event(0x17)) 
elseif (player:getMissionStatus(0,16) == 1) and (mission_status == 3) then
  player:startEvent(Event(0x18)) 
elseif (player:getMissionStatus(0,20) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x3A)) 
elseif (player:hasKeyItem(DropsOfAmnio) == 1) then
	player:startEvent(Event(0x66)) 
elseif (player:getMissionStatus(0,20) == 1) and (mission_status == 3) then
	player:showText(npc,HALVER_OFFSET)  
elseif (player:getMissionStatus(0,20) == 2) and (player:getMissionStatus(0,21) == 0) and (mission_status == 5) then
	player:showText(npc,HALVER_OFFSET+11)  
elseif (player:getMissionStatus(0,21) == 2) and (player:getMissionStatus(0,22) <= 1) then
  player:showText(npc,HALVER_OFFSET+43)  
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x1A));	
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 5) then
	player:showText(npc,HALVER_OFFSET+415) 
elseif (player:getMissionStatus(0,22) == 2) and (player:getMissionStatus(0,23) == 0) then
	player:startEvent(Event(0x1B)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x1C)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 7) then
	player:showText(npc,HALVER_OFFSET+1034);
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 8) then
	player:startEvent(Event(0x9)) 	
elseif (player:getNation() == 0) and (player:getRank() == 10) then
	player:startEvent(Event(0x1F)) 	
elseif (player:getMissionStatus(0,22) == 1) or (player:getMissionStatus(0,23) == 1) then
	player:startEvent(Event(0x1D));	
else
	player:showText(npc,HALVER_OFFSET+1092) 
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
if (csid == 0x1F5) then
 	player:currentMission(1,6);        -- update mission to "The Emissary (San d'Oria)"
 	player:setVar("mission_status",4); -- defeat Warchief Vatgit now
elseif (csid == 0x1F5) or (csid == 0x1F6) then
 	player:setVar("mission_status",4); -- defeat Warchief Vatgit now
elseif (csid == 0x1F7) or (csid == 0x1F8) then
 	player:setVar("mission_status",18); -->  BCNM at Horlais Peak
elseif (csid == 0x1F9) then
  	player:addKeyItem(LetterToConsulsSandy);
  	player:specialMessage(KEYITEM_OBTAINED,LetterToConsulsSandy); 
  	player:setVar("mission_status",2);
elseif (csid == 0x1FE) and (DEBUG_MODE) then
	player:setPos(0, 7, -23, 63, 0xF3); -- to Ru'Lude Gardens
elseif (csid == 0x1FB) then
	player:removeKeyItem(KindredReport);
  	player:completeMission(0,5);
  	player:setVar("mission_status",0);
  	player:addKeyItem(AdventurersCertificate);
  	player:setTitle(CertifiedAdventurer)
  	player:specialMessage(KEYITEM_OBTAINED,AdventurersCertificate); 
	player:addGil(GIL_RATE*3000)
  	player:specialMessage(GIL_OBTAINED,GIL_RATE*3000); 
  	player:rankUp()
	player:specialMessage(72); -- "you achieve rank 3"
elseif (csid == 0x1FC) then
 	player:setVar("mission_status",2);
elseif (csid == Chateau_TheRuinsOfFeiYin_Pt2) then
 	player:addKeyItem(NewFeiYinSeal);
  	player:specialMessage(KEYITEM_OBTAINED,NewFeiYinSeal); 
  	player:setVar("mission_status",2); -- heard briefing and acceped mission;
elseif (csid == Chateau_TheRuinsOfFeiYin_Pt3) then
 	player:removeKeyItem(BurntSeal);
  	player:setVar("mission_status",0);
  	add_rank_points_for_mission(player)
  	player:completeMission(0,14);
elseif (csid == 0x224) then
 	player:removeKeyItem(ShadowFragment);
  	player:rankUp(); -- rank-up but mission not completed until we've watched a final CS
  	player:addGil(GIL_RATE*20000)
  	player:specialMessage(GIL_OBTAINED,GIL_RATE*20000); 
  	player:setTitle(ShadowBanisher);
  	player:setVar("mission_status",4);
elseif (csid == 0x19) then
  	player:setVar("mission_status",2);
elseif (csid == 0x18) and (DEBUG_MODE) then
  	player:setPos(-285, -6, 67,20, 0x7D);     -- to Western Altepa Desert
elseif (csid == 0x16) then
  	player:setVar("mission_status",4);
elseif (csid == 0x3A) then
  	player:setVar("mission_status",3);
  	if (DEBUG_MODE) then
  		player:setPos(553, 18, -942, 0, 0xD0);     -- to Quicksand Caves Fountain of Kings
  	end;
elseif (csid == 0x66) then
  	player:removeKeyItem(DropsOfAmnio);
  	add_rank_points_for_mission(player)
  	player:completeMission(0,20);
  	player:setVar("mission_status",5);  -- mission is complete for the log, but must watch North Sandy CS before next mission can be undertaken.
  	player:setVar("COMING_OF_AGE_CEREMONY",os.time());
elseif (csid == 0x9) then
  	player:completeMission(0,23);
  	player:setVar("mission_status",0);  
  	player:setTitle(SandOrianRoyalHeir)
  	player:specialMessage(ITEM_OBTAINED,SandOrianFlag); 
  	player:addItem(SandOrianFlag);
  	player:addGil(GIL_RATE*100000)
  	player:specialMessage(GIL_OBTAINED,GIL_RATE*100000); 
  	player:rankUp()
  	player:setVar("may_watch_final_pieuje_cs",1);
  	player:setVar("may_watch_final_trion_cs",1);
  	player:setVar("must_watch_shamonde_cs",1);
  	player:setVar("must_watch_ssandy_cs",1);
end
end;