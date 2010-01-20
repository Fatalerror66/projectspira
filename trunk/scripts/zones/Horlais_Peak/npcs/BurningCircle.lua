-----------------------------------
--	Author: ReaperX
--	Balga's Dais Burning Circle
--	Lets you enter and exit BCNMs by trading orbs.
--
--	BCs are empty for the time being.
--	To do: mark orbs as used (cracked) after they've been traded (server variables?)
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/bcnm");
require("scripts/globals/rankpoints");

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

	--- 0: The Rank 2 Final Mission
	--- 1: Tails of Woe
	--- 2: Dismemberment Brigade
	--- 3: The Secret Weapon (Sandy Mission 7-2)
	--- 4: Hostile Herbivores
	--- 5: Shattering Stars (WAR)
	--- 6: Shattering Stars (BLM)
	--- 7: Shattering Stars (RNG)
	--- 8: Carapace Combatants 
	--- 9: Shooting Fish
	--- 10: Dropping like Flies
	--- 11: Horns of War
	--- 12: Under Observation
	--- 13: Eye of the Tiger     
	--- 14: Shots in the Dark
	--- 15: Double Dragonian
	--- 16: Today's Horoscope
	--- 17: Contaminated Colosseum

	-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

	-- 7D01 : final BC event.
	-- param 2: #time record for this mission
	-- param 3: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- 7D03 : stay/run away

mission_status = player:getVar("mission_status");

if (player:getXPos() >= -520 and player:getXPos() <= -500 and player:getZPos() >= -220 and player:getZPos() <= -200) then -- we on the outside circle, so need enter menu
	event = Event(0x7D00);
	missionFlag = 0;
	
	if (player:getMissionStatus(0,19) == 1) and (mission_status == 1) then
		missionFlag = missionFlag + 8;
		player:setVar("horlais_option",3);
	elseif ((player:getMissionStatus(2,8) == 1) or (player:getMissionStatus(1,8) == 1)) and (mission_status == 18)  then
		missionFlag = missionFlag + 1;
		player:setVar("horlais_option",0);
	end;
	event:setParams(0,0,0,missionFlag,0,0,0,0)  -- 
	if (missionFlag > 0) then
		player:startEvent(event); 
	else
		player:specialMessage(993); -- a cursed seal has been placed upon this platform.
	end
else
	bc = player:getVar("horlais_option");
	if (bc == 3) then
		player:addKeyItem(CrystalDowser);
   	player:setVar("mission_status",2);
   	event = Event(0x7D01);
   	time = os.time()-getGlobalVar("HORLAIS_ENTER_TIME");
   	record = getGlobalVar("SANDY_7_2_MISSION_RECORD");
   	if (record == 0) then 
	 		record = time + 1;
	 	end;
	 	if (time < record) then
	 		setGlobalVar("SANDY_7_2_MISSION_RECORD",time);
	 	end;	
	 	setGlobalVar("HORLAIS_ENTER_TIME",0);
	 event:setParams(0,record,0,time,0,bc,1);
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
	if (option == 0) then
		player:updateEvent(2,5,1,60,6,1);
		bc = player:getVar("horlais_option");
		--print("Setting second set of update params.");
		if (bc == 0) then
			record = getGlobalVar("HORLAIS_RANK2_MISSION_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 3) then
			record = getGlobalVar("SANDY_7_2_MISSION_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 5) then
			record = getGlobalVar("SHATTERING_STARS_WAR_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 6) then
			record = getGlobalVar("SHATTERING_STARS_BLM_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 7) then
			record = getGlobalVar("SHATTERING_STARS_RNG_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		end
	elseif (option == 255) then
		--print("Setting first set of update params.");
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
loc = Zone(0x8B);
if (csid == 0x7D00) then
	bc = player:getVar("horlais_option");
	if (bc == 0) then
		--print("spawning mobs..");
		loc:spawnMob("Spotter",-401, 94.5, -60.8,38,nil);
		loc:spawnMob("DreadDragon",-396.5, 94.6, -64,50,nil);
		--sendTellMsg("[pXI]Altana",player:getName(),"Mobs don't spawn right now. Exit BCNM area to complete mission and receive key item crystal dowser.");
		setGlobalVar("HORLAIS_PEAK",2) -- how many monsters need to be killed.
		setGlobalVar("HORLAIS_ENTER_TIME",os.time());
	elseif (bc == 3) then
		--print("spawning mobs..");
		loc:spawnMob("DarokbokofClan",-395.3, 94, -66.3,50,nil);
		loc:spawnMob("JagidbodofClan",-393.6, 94, -65.3,50,nil);
		loc:spawnMob("DerakbakofClan",-397,   94, -67.3,50,nil);
		loc:spawnMob("WolfClanWarmac",-394.7, 94, -62.4,50,nil);
		loc:spawnMob("ReaperClanWarm",-398.5, 94, -65.2,50,nil);
		sendTellMsg("[pXI]Altana",player:getName(),"Mobs don't spawn right now. Exit BCNM area to complete mission and receive key item crystal dowser.");
		setGlobalVar("HORLAIS_PEAK",5) -- how many monsters need to be killed.
		setGlobalVar("HORLAIS_ENTER_TIME",os.time());
	end;
end	
end;
