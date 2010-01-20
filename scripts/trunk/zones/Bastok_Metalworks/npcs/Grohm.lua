-----------------------------------
--	Author: ReaperX
-- 	Grohm
-- 	San d'Oria Mission 2.3 "Journey Abroad", Windurst Mission 2.3 "The Three Kingdoms"
-----------------------------------

Pickaxe = 605;

package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");

on_first_path = (player:getMissionStatus(0,6) == 1) or (player:getMissionStatus(2,7) == 1) -- on Sandy or Windy 2-3, 1st path?
on_second_path = (player:getMissionStatus(0,8) == 1) or (player:getMissionStatus(2,9) == 1) -- on Sandy or Windy 2-3, second path?

if on_first_path and mission_status == 4 then
	event = Event(0x1A7);
	if (player:getNation() == 2) then
		event:setParams(1);
	end;
	player:startEvent(event);
elseif on_first_path and mission_status == 5 then
	player:startEvent(Event(0x1A8));
elseif on_second_path and mission_status == 16 then
	event = Event(0x1AA);
	if (player:getNation() == 2) then
		event:setParams(1);
	end;
	player:startEvent(event);
elseif on_second_path and mission_status == 17 then
	player:startEvent(Event(0x1AB));
else
	player:startEvent(Event(0x1A6));
end;
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
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x1A7) then
	player:addItem(Pickaxe,3);
	player:specialMessage(ITEM_OBTAINED,Pickaxe);
	player:setVar("mission_status",5);
elseif (csid == 0x1AA) then
	player:setVar("mission_status",17);
	if (DEBUG_MODE) then
  	player:setPos(-357, 104, -260, 0, 0x90);     -- to Waughroon Shrine
  end;
end
end;