-----------------------------------
--	Author: Psyclosis 
--	Wind Protocrystal
--	Allows qualified players to enter the battlefield to fight Garuda Prime.
--
--	Thanks ReaperX for all the research detailed below!
--
--	Problem: no matter what choice you make in the menu event 7D00, the option variable
--	comes back with the same value in onEventSelection and onEventFinish.
--
--	For now, mission BCs have been implemented so that you can enter, get the opening CS,
--	then click on the circle again and automatically get the closing CS and credit for 
--	completing the battle.
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

	---- 0: None
	---- 1: Trial by Fire
	---- 2: Carbuncle Debacle
	---- 4: Trial-Size Trial by Fire
	---- 8: Waking the Beast
	---- 16: Sugar-coated Directive

	-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

	-- 7D01 : final BC event.
	-- param 2: #time record for this mission
	-- param 3: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- 7D03 : stay/run away


	-----------------------------------

	if (npc:getXPos() >= -370 and npc:getXPos() <= -350 and npc:getZPos() >= -390 and npc:getZPos() <= -370) then --Entry crystal.
		event0x7d00 = Event(0x7D00);
		
		--Set event bitmask.
		battlefield = 0x1;
		
		event0x7d00:setParams(0,0,0,battlefield,0,0,0,0) 
		player:startEvent(event0x7d00); 
	else --Exit crystal.
		player:startEvent(Event(0x7D03)); --Run away.
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
	
	--[[if( count == 1 and npc:getId() == 17375454 ) then
	-- trades are not completed so that the orb doesn't get lost.
		event = Event(0x7D00);
		--if (trade:hasItemQty(CloudyOrb,1)) then
		--end
	end]]
	
end; 

function onEventSelection(player,csid,option)

	-- parameter 1: 0 or 1 = can't enter battlefield at present, 2 = can go in
	-- parameter 2: identifies the BC we are entering (to identify time record and play CS, if applicable. Not all BCs have CS.)
	-- parameter 4: current clear time record
	-- parameter 5: number of adventurers in clear time record
	-- parameter 6: 1 = offer menu to skip the event
	-- unknown: how to pass player name who holds time record to the event

	--print("CSID:",csid);         
	--print("OPTION:",option); 

	if (csid == 0x7d00 and option == 0) then
		record = getGlobalVar("TRIAL_BY_WIND_RECORD");
		player:updateEvent(2,0,0,record,6,1);
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)

	--print("CSID:",csid);         
	--print("OPTION:",option); 

	if (csid == 0x7D00 and option == 100) then --Enter the BC.
		--Spawn the man himself.
		zone0xc9 = Zone(0xc9);
		zone0xc9:spawnMob("GarudaPrime",500,42,-369,0x60,0);
		setGlobalVar("TRIAL_BY_WIND_ENTER_TIME",os.time());
	end	
end;