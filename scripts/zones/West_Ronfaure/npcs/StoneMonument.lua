-----------------------------------
--	Author: Tenjou
-- 	Stone Monument
-- 	Involved in quest "An Explorer's Footsteps"
--
--	Generalized as much as possible for a quick copy and paste to all the other zones.
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
player:startEvent(Event(0x384));
end;


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
explorer = player:getQuestStatus(4,19);
tablets = player:getVar("anExplorer-ClayTablets");
clay = trade:hasItemQty(0x23b,1);
count = trade:getItemCount();
currtab = 1;
if (count == 1 and clay) then
	trade:isComplete();
	player:addItem(0x23a);
	player:setVar("anExplorer-CurrentTablet",currtab);
	player:specialMessage(23,0x23a);
end
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

end;