-----------------------------------
--	Author: ReaperX
--	Balga's Dais Burning Circle
--	Lets you enter and exit BCNMs by trading orbs.
--
--	To do: mark orbs as used (cracked) after they've been traded (server variables?)
--
--	Problem: no matter what choice you make in the menu event 7D00, the option variable
--	comes back with the same value in onEventSelection and onEventFinish.
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/bcnm");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
require("scripts/zones/Balgas_Dais/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	-----------------------------------
	-- Dialogues,cutscenes,etc. go below.
	-----------------------------------
	-- events:
	-- 7D00 : BC menu 
	-- Param 4 is a bitmask for the choice of battlefields in the menu:

	---- 0: Rank 2 Final Mission for Bastok "The Emissary" and Sandy "Journey Abroad"
	---- 1: Steamed Sprouts (BCNM 40, Star Orb)
	---- 2: Divine Punishers (BCNM 60, Moon Orb)
	---- 3: Saintly Invitation (Windurst mission 6-2)
	---- 4: Treasure and Tribulations (BCNM 50, Comet Orb)
	---- 5: Shattering Stars (MNK)
	---- 6: Shattering Stars (WHM)
	---- 7: Shattering Stars (SMN)
	---- 8: Creeping Doom (BCNM 30, Sky Orb)
	---- 9: Charming Trio (BCNM 20, Cloudy Orb)
	---- 10: Harem Scarem (BCNM 30, Sky Orb)
	---- 11: Early Bird Catches the Wyrm (KSNM 99, Themis Orb)
	---- 12: Royal Succession (BCNM 40, Star Orb)
	---- 13: Rapid Raptors (BCNM 50, Comet Orb)
	---- 14: Wild Wild Whiskers (BCNM 60, Moon Orb)
	---- 15: Season's Greetings (KSNM 30, Clotho Orb)
	---- 16: Royale Ramble (KSNM 30, Lachesis Orb)
	---- 17: Moa Constrictors (KSNM 30, Atropos Orb

	-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

	-- 7D01 : final BC event.
	-- param 2: #time record for this mission
	-- param 3: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- 7D03 : stay/run away


	-----------------------------------
	mission_status = player:getVar("mission_status");

	if (player:getXPos() >= 280 and player:getXPos() <= 320 and player:getZPos() >= 315 and player:getZPos() <= 345) then -- we on the outside circle, so need enter menu
		event = Event(0x7D00);
		missionFlag = 0;
		if player:hasKeyItem(HolyOnesInvitation) == 1 then
			missionFlag = 8;                                                                       
		elseif player:hasKeyItem(DarkKey) == 1 then
			missionFlag = missionFlag + 1;
		end;
		event:setParams(0,0,0,missionFlag,0,0,0,0)  -- 
		if (missionFlag > 0) then
			player:startEvent(event); 
		else
			player:specialMessage(812); -- a cursed seal has been placed upon this platform.
		end
	else
		if (player:hasKeyItem(HolyOnesInvitation) == 1) then
			event = Event(0x7D01);
			time = os.time()-getGlobalVar("BALGAS_ENTER_TIME");
			record = getGlobalVar("BALGAS_SAINTLY_INVITATION_RECORD");
			if (time < record) then
				setGlobalVar("BALGAS_SAINTLY_INVITATION_RECORD",time);
			end;	
			setGlobalVar("BALGAS_ENTER_TIME",0);
			-- param 2: #time record for this mission
			-- param 4: #clear time in seconds
			-- param 6: #which mission (linear numbering as above)
			-- param 7: 1: offer skip event menu 
			-- one of the 1s switches the skip event menu.
			event:setParams(0,record,0,time,0,3,1);
			player:startEvent(event);
		else
			player:startEvent(Event(0x7D03)); -- inside circle: stay/run away menu.
		end;
	end
	
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

	count = trade:getItemCount();
	
	if( count == 1 and npc:getId() == 0x10920DE ) then
	-- trades are not completed so that the orb doesn't get lost.
		event = Event(0x7D00);
		if (trade:hasItemQty(CloudyOrb,1)) then
			event:setParams(0,0,0, 512, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(SkyOrb,1)) then
			event:setParams(0,0,0, 1280, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(StarOrb,1)) then
			event:setParams(0,0,0, 4098, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(CometOrb,1)) then
			event:setParams(0,0,0, 8208, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(MoonOrb,1)) then
			event:setParams(0,0,0, 16388, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(ClothoOrb,1)) then
			event:setParams(0,0,0, 32768, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(LachesisOrb,1)) then
			event:setParams(0,0,0, 65536, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(AtroposOrb,1)) then
			event:setParams(0,0,0, 131072, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(ThemisOrb,1)) then
			event:setParams(0,0,0, 2048, 0, 0, 0, 0);
			player:startEvent(event);
		end
	end
	
end; 

function onEventSelection(player,csid,option)

	-- parameter 1: 0 or 1 = can't enter battlefield at present, 2 = can go in
	-- parameter 2: identifies the BC we are entering (to identify time record and play CS, if applicable. Not all BCs have CS.)
	-- parameter 4: current clear time record
	-- parameter 5: number of adventurers in clear time record
	-- parameter 6: 1 = offer menu to skip the event
	-- unknown: how to pass player name who holds time record to the event

	--print("onEventSelection")
	--print("onEventSelection - CSID:",csid);         
	--print("onEventSelection - option ===",option); 

	mission_status = player:getVar("mission_status");
	if (option == 0) then
		--print("Setting second set of update params.");
		if (player:hasKeyItem(DarkKey) == 1) then
			record = getGlobalVar("BALGAS_RANK2_MISSION_RECORD");
			player:updateEvent(2,0,0,record,6,1);
		elseif (player:hasKeyItem(HolyOnesInvitation) == 1) then
			record = getGlobalVar("BALGAS_SAINTLY_INVITATION_RECORD");
			player:updateEvent(2,3,0,record,6,1);
		end
	elseif (option == 255) then
		--print("Setting first set of update params.");
		-- these don't seem to do anything.
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)

	if (csid == 0x7D00) and (player:hasKeyItem(DarkKey) == 1) then
		loc = Zone(0x92);
		loc:spawnMob("BlackDragon",-139, 56, -226,192,nil);
		loc:spawnMob("Searcher",-139, 56, -230,192,nil);
		setGlobalVar("BALGAS_DAIS",2) -- how many monsters need to be killed.
		setGlobalVar("BALGAS_ENTER_TIME",os.time());
	elseif (csid == 0x7D00) and (player:hasKeyItem(HolyOnesInvitation) == 1) then
		loc = Zone(0x92);
		loc:spawnMob("ChaaPaqathePro",-139, 56, -226,192,nil);
		loc:spawnMob("BuuXolotheBloo",-129, 56, -226,192,nil);
		loc:spawnMob("JuuZenithePois",-149, 56, -226,192,nil);
		loc:spawnMob("NuuKofutheGent",-149, 56, -226,192,nil);
		setGlobalVar("BALGAS_DAIS",4) -- how many monsters need to be killed.
		setGlobalVar("BALGAS_ENTER_TIME",os.time());
	elseif (csid == 0x7D01) and (player:hasKeyItem(HolyOnesInvitation) == 1) then
		player:setVar("mission_status",3);
		player:addKeyItem(BalgaChampionCertificate);
		player:specialMessage(KEYITEM_OBTAINED,BalgaChampionCertificate);
		player:setTitle(VictorOfTheBalgaContest)
		player:removeKeyItem(HolyOnesInvitation);
		if (DEBUG_MODE) then
			player:addItem(1142);  -- judgment key
			player:setPos(-100, -61, 75, 192, 0x97);
		end
	end	
end;