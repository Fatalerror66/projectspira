-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Leepe-Hoppe
-- 	Involved in Windurst Missions 1-3, 7-2, Fenrir quest, CoP quests "Tuning In" and "Tuning Out"
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

--[[ Events

0131
0137
0159
008C opening CS for Windurst mission 1-3
008E repeats instructions for 1-3
0092 final CS for 1-3, tells you to go back to gate guard
0093 repeats instructions to go back to gate guard
02DE CS for Windurst mission 7-2
02DF repeats instructions
02E3 tells you again to go to the southern continent
02E6 final CS for Windurst mission 7-2
02E7
0311 (opening CS for quest "Toraimarai Turmoil" which grants the Rhinostery Certificate.)
0316 reminds you to be responsible with the Rhinostery Certificate.
031A "Doctor Yoran-Oran is going to study starmite ecology.."
034A opening CS for quest "The Moonlit Path" (Fenrir access quest)
034B repeats instructions to get all 6 whispers
034C after gathering 6 whispers, gives Moon Bauble. 
034D repeats instructions to go to Full Moon Fountain and that every person needs a Moon Bauble.
034E after killing Fenrir: final CS + reward
034F
0350
0351
0352
0353
0374
0375
0376
0378
0379
0381

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,2) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x8c));
elseif (player:getMissionStatus(2,2) == 1) and (mission_status == 2) and (player:hasKeyItem(FoodOffering) == 0) and (player:hasKeyItem(DrinkOffering) == 0) then
	player:startEvent(Event(0x92));
elseif (player:getMissionStatus(2,2) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x93));
elseif (player:getMissionStatus(2,2) == 1) and (mission_status == 2) then
  player:startEvent(Event(0x8E));
elseif (player:getMissionStatus(2,19) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x2DE));
elseif (player:getMissionStatus(2,19) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x2DF));
elseif (player:getMissionStatus(2,19) == 1) and ((mission_status == 3) or (mission_status == 4)) then
	player:startEvent(Event(0x2E3));
elseif (player:getMissionStatus(2,19) == 1) and (mission_status == 5) then
	player:startEvent(Event(0x2E6));
else
	player:startEvent(Event(0x137));
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
if (csid == 0x8C) then
	player:addKeyItem(FoodOffering);
	player:addKeyItem(0x12);
	player:specialMessage(KEYITEM_OBTAINED,FoodOffering);
	player:specialMessage(KEYITEM_OBTAINED,DrinkOffering);
	player:setVar("mission_status",2);
elseif (csid == 0x9E) then
	player:setPos(-140, 0, 161, 59, 0x91);
elseif (csid == 0x92) then
	player:setVar("mission_status",3);
elseif (csid == 0x93) and (DEBUG_MODE) then
	toWindurstMissionOverseer(player);
elseif (csid == 0x2DE) then
	player:setVar("mission_status",2);
elseif (csid == 0x2DF) and (DEBUG_MODE) then
	player:setPos(8, -4, -161, 227, 0xEE);
elseif (csid == 0x2E6) then
	player:completeMission(2,19);
  player:addGil(GIL_RATE*60000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*60000); 
  player:setVar("mission_status",0);
  player:rankUp()
end
end;