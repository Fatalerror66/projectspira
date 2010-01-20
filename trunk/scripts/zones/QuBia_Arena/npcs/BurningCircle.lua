-----------------------------------
--	Author: ReaperX
--	QuBia Arena Burning Circle
--	Lets you enter and exit BCNMs by trading orbs.
--
--	To do: mark orbs as used (cracked) after they've been traded (server variables?)
--
--	Problem: no matter what choice you make in the menu event 7D00, the option variable
--	comes back with the same value in onEventSelection and onEventFinish.
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/bcnm"] = nil;
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
	--- Param 4 is a bitmask for the choice of battlefields in the menu:

	-- 0: The Rank 5 Mission
	-- 1: Come into My Parlor (Clotho Orb)
	-- 2: E-vase-ive Action (Lachesis Orb)
	-- 3: Infernal Swarm (Atropos Orb)
	-- 4: The Heir to the Light (San d'Oria Mission 9-2)
	-- 5: Shattering Stars (PLD)
	---6: Shattering Stars (DRK)
	---7: Shattering Stars (BRD)
	---8: Demolition Squad (Moon Orb)
	---9: Die by the Sword (Sky Orb)
	--10: Let Sleeping Dogs Die (Sky Orb)
	--11: Brothers D'Aurphe (Moon Orb)
	--12: Undying Promise (Star Orb)
	--13: Factory Rejects  (Star Orb)
	--14: Idol Thoughts (Comet Orb)
	--15: An Awful Autopsy (Comet Orb)
	--16: Celery (Moon Orb)
	--17: Mirror Images (Fellow)
	--18: A Furious Finale (DNC limitbreak quest)
	--19: Clash of the Comrades (Fellow)
	--20: Those who Lurk in Shadows (A Crystalline Prophecy )
	
	-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

	-- 7D01 : final BC event.
	-- param 2: #time record for this mission
	-- param 3: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- 7D03 : stay/run away


----------------------------------

mission_status = player:getVar("mission_status");

if (player:getXPos() >= -220 and player:getXPos() <= -200 and player:getZPos() >= 10 and player:getZPos() <= 30) then -- we on the outside circle, so need enter menu
	event = Event(0x7D00);
	missionFlag = 0;
	
	if (player:hasKeyItem(NewFeiYinSeal) == 1) then	
		missionFlag = missionFlag + 1;
		player:setVar("qubia_option",0);
	elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 4) then 	
		missionFlag = missionFlag + 16;
		player:setVar("qubia_option",4);
	end;
	event:setParams(0,0,0,missionFlag,0,0,0,0)  -- 
	if (missionFlag > 0) then
		player:startEvent(event); 
	else
		player:specialMessage(993); -- a cursed seal has been placed upon this platform.
	end
else
	bc = player:getVar("qubia_option");
   	if (bc == 4) then
		player:setVar("mission_status",5);
		event = Event(0x7D01);
		time = os.time()-getGlobalVar("QUBIA_ENTER_TIME");
		record = getGlobalVar("SANDY_9_2_MISSION_RECORD");
		if (record == 0) then 
			record = time + 1;
		end;
		if (time < record) then
			setGlobalVar("SANDY_9_2_MISSION_RECORD",time);
		end;	
		setGlobalVar("QUBIA_ENTER_TIME",0);
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

	-----------------------------------
	-- Trades go below.
	-----------------------------------
	count = trade:getItemCount();
	
	if (count == 1 and player:getXPos() >= -220 and player:getXPos() <= -200 and player:getZPos() >= 10 and player:getZPos() <= 30) then -- we on the outside circle, so need enter menu
	-- orb trades are not completed so that the orb doesn't get lost.
		event = Event(0x7D00);
		if (trade:hasItemQty(PaladinsTestimony,1)) then
			event:setParams(0,0,0, 32, 0, 0, 0, 0);
			player:setVar("qubia_option",5);
			trade:isComplete();
			player:startEvent(event);
		elseif (trade:hasItemQty(DarkknightsTestimony,1)) then
			event:setParams(0,0,0, 64, 0, 0, 0, 0);
			player:setVar("qubia_option",6);
			trade:isComplete();
			player:startEvent(event);
		elseif (trade:hasItemQty(BardsTestimony,1)) then
			event:setParams(0,0,0, 128, 0, 0, 0, 0);
			player:setVar("qubia_option",7);
			trade:isComplete();
			player:startEvent(event);
		elseif (trade:hasItemQty(DancersTestimony,1)) then
			event:setParams(0,0,0, 262144, 0, 0, 0, 0);
			player:setVar("qubia_option",18);
			trade:isComplete();
			player:startEvent(event);
		elseif (trade:hasItemQty(SkyOrb,1)) then
			event:setParams(0,0,0, 1536, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(StarOrb,1)) then
			event:setParams(0,0,0, 12288, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(CometOrb,1)) then
			event:setParams(0,0,0, 49152, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(MoonOrb,1)) then
			event:setParams(0,0,0, 67840, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(ClothoOrb,1)) then
			event:setParams(0,0,0, 2, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(LachesisOrb,1)) then
			event:setParams(0,0,0, 4, 0, 0, 0, 0);
			player:startEvent(event);
		elseif (trade:hasItemQty(AtroposOrb,1)) then
			event:setParams(0,0,0, 8, 0, 0, 0, 0);
			player:setVar("qubia_option",3);
			player:startEvent(event);
		end
	end
	
end; 

function onEventSelection(player,csid,option)

	-- parameter 1: 0 or 1 = can't enter battlefield at present
  --	            2 = can go in
  --              3 = fade to black, no message
  --	 						4 = You are cleared to enter the battlefield, but you cannot while party members are engaged in combat.
  --              5 = You do not meet the requirements to enter the battlefield. Access is denied.
  --              6 = This Room Has reached its maximum capacity. Only one more member can enter the battlefield.
	--              7 = Room is full. (After receiving this update, the event will call OnEventSelection again but for the next BC "instance".)
	-- parameter 2: identifies the BC we are entering (to identify time record and play CS, if applicable. Not all BCs have CS.)
	-- parameter 4: current clear time record
	-- parameter 5: number of adventurers in clear time record
	-- parameter 6: 1 = offer menu to skip the event
	-- unknown: how to pass player name who holds time record to the event
  -- unknown: how to determine which BC the player selected. "option" is always the same value (0 or 255) when this 
  -- event is called.
	--print("onEventSelection")
	--print("onEventSelection - CSID:",csid);         
	--print("onEventSelection - option ===----->",option); 
	if (option == 0) and (csid == 0x7D00) then
		player:updateEvent(2,5,1,60,6,1);
		bc = player:getVar("qubia_option");
		--print("Setting second set of update params.");
		if (bc == 0) then
			record = getGlobalVar("RANK5_MISSION_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 3) then
			record = getGlobalVar("INFERNAL_SWARM_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 4) then
			record = getGlobalVar("RANK9_MISSION_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
			sendTellMsg("[pXI]Altana",player:getName(),"BC mobs don't currently spawn. Exit BCNM area to complete mission.");
		elseif (bc == 5) then
			record = getGlobalVar("SHATTERING_STARS_PLD_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 6) then
			record = getGlobalVar("SHATTERING_STARS_DRK_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		elseif (bc == 18) then
			record = getGlobalVar("SHATTERING_STARS_DNC_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
	  elseif (bc == 7) then
			record = getGlobalVar("SHATTERING_STARS_BRD_RECORD");
			player:updateEvent(2,bc,0,record,6,1);
		end
	elseif (option == 255) then
		--print("Setting first set of update params.");
	else 
		--print("3rd set of updates");
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid, option);
loc = Zone(0xCE);
if (csid == 0x7D00) then
	bc = player:getVar("qubia_option");
  if (bc == 0) then
		loc:spawnMob("ArchlichTaber_",-400, -202, 388,192,nil);
		loc:spawnMob("AncientSorcere",-390, -202, 405,170,nil);
		loc:spawnMob("AncientSorcere",-410, -202, 405,212,nil);
		setGlobalVar("QUBIA_ARENA",3) -- how many monsters need to be killed.
		setGlobalVar("QUBIA_ENTER_TIME",os.time());
	elseif (bc == 3) then
		loc:spawnMob("Beelzebub",-400, -202, 388,192,nil);
		loc:spawnMob("HellFly",-397, -202, 388,192,nil);
		loc:spawnMob("HellFly",-396.5, -202, 388,192,nil);
		loc:spawnMob("HellFly",-394, -202, 388,192,nil);
		loc:spawnMob("HellFly",-393.5, -202, 388,192,nil);
		loc:spawnMob("HellFly",-403, -202, 388,192,nil);
		loc:spawnMob("HellFly",-406, -202, 388,192,nil);
		loc:spawnMob("HellFly",-406.5, -202, 388,192,nil);
		setGlobalVar("QUBIA_ARENA",8) -- how many monsters need to be killed.
		setGlobalVar("QUBIA_ENTER_TIME",os.time());
	elseif (bc == 4) then
		loc:spawnMob("YukvokofClanDe",-400, -202, 388,192,nil);
		loc:spawnMob("DeathClanDestr",-400, -202, 386,192,nil);
		loc:spawnMob("RallbrogofClan",-397, -202, 387,192,nil);
		loc:spawnMob("WorgbutofClanD",-394, -202, 388,192,nil);
		loc:spawnMob("WorgbutofClanD",-391, -202, 389,192,nil);
		loc:spawnMob("WorgbutofClanD",-388, -202, 390,192,nil);
		loc:spawnMob("RallbrogofClan",-403, -202, 387,192,nil);
		loc:spawnMob("RallbrogofClan",-406, -202, 388,192,nil);
		loc:spawnMob("VangknokofClan",-409, -202, 389,192,nil);
		loc:spawnMob("VangknokofClan",-412, -202, 390,192,nil);
		setGlobalVar("QUBIA_ARENA",10) -- how many monsters need to be killed.
		-- FFXIclopedia mentions 3 of each NQ orc, but I could only see 8 of them in the video at
		-- http://www.youtube.com/watch?v=j8IXcWnvw7w .
		setGlobalVar("QUBIA_ENTER_TIME",os.time());
	elseif (bc == 5) or (bc == 6) or (bc == 7) then
		loc:spawnMob("Maat",-400, -200, 400,192,nil);
		setGlobalVar("QUBIA_ARENA",1)
		setGlobalVar("QUBIA_ENTER_TIME",os.time());
	elseif (bc == 18) then
		loc:spawnMob("Laila",-400, -200, 400,192,nil);
		setGlobalVar("QUBIA_ARENA",1)
		setGlobalVar("QUBIA_ENTER_TIME",os.time());
	end;
end	
end;