-----------------------------------
--	Author: Tenjou
-- 	Abelard
-- 	Starts and ends quest "An Explorer's Footsteps"
--
--	This quest was changed to require a minimum amount of fame to combat RMTs POS-Hacking around to
--	quickly earn gil.  However, as this is not a legitimate concern on private servers players may
--	complete this quest even with no fame.
--
--	West Ronfaure	1
--	East Ronfaure	2
--	La Theine		4
--	Valkurm			8
--	Jugner			10
--	North Gustaberg	20
--	South Gustaberg	40
--	Konschtat		80
--	Pashhow			100
--	Rolanberry		200
--	West Saruta		400
--	East Saruta		800
--	Tahrongi		1000
--	Buburimu		2000
--	Meriphataud		4000
--	Sauromugue		8000
--	Batallia		10000
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
explorer = player:getQuestStatus(4,19);
tablets = player:getVar("anExplorer-ClayTablets");
if (explorer == 0) then
	player:startEvent(Event(0x28));
elseif (explorer == 1) then
	clay = player:hasItem(0x23b);
	tab = player:hasItem(0x23a);
	if (clay ~= 1 and tab == 0) then
		player:startEvent(Event(0x2c));
		player:setVar("anExplorer-CurrentTablet",0);
	else
		if (tablets ~= 0) then
			hints = math.random();
			--print("HINTS:",hints);
			if (hints >= 0.5) then
				event0x2b = Event(0x2b);
				hint = math.random(1,8);
				if (hint == 6) then hint = 7; end
				event0x2b:setParams(hint);
				player:startEvent(event0x2b);
			else
				event0x31 = Event(0x31);
				hint = math.random(0,7);
				if (hint == 7) then hint = 6; end
				event0x31:setParams(hint);
				player:startEvent(event0x31);
			end
		else
			player:startEvent(Event(0x2b));
		end
	end
end
end;


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
explorer = player:getQuestStatus(4,19);
tablets = player:getVar("anExplorer-ClayTablets");
clay = trade:hasItemQty(0x23a,1);
count = trade:getItemCount();
if (count == 1 and clay) then
	--2d: has this tablet already
	--2e: not the one he asked for
	--29: the tablet he asked for
	--2f: recieve map
	currtab = player:getVar("anExplorer-CurrentTablet");
	if (tablets % 2*currtab >= currtab) then --New tablet
	else --Old one :/
	end
end
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x28 and option ~= 0) then
	player:addQuest(4,19);
	player:addItem(0x23b);
	player:specialMessage(20,0x23b);
elseif (csid == 0x2c) then
	player:addItem(0x23b);
	player:specialMessage(20,0x23b);
end
end;