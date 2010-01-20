-----------------------------------
--	Author: Tenjou
-- 	Ada
-- 	Involved in Bastok Mission 2-3.  The other text events she has during and after are: 0x2f,0x33,0x3a,0x3f,and 0x45.
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


-- events
-- 0x2c: describes Bastok
-- 0x2f: "Oh, you have some business with Consul Melek?"
-- 0x33: "You are wondering what you should do if the Yagudo realize you switched weapons on them, aren't you?"
-- 0x3a after you switched weapons and return.
-- 0x3f "Go ahead and savage the brutes"
-- 0x45 Better hurry back to motherland

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(1,5) == 1) and ( (mission_status == 6) or (mission_status == 1)) then 
  player:startEvent(Event(0x2f));
elseif (player:getMissionStatus(1,7) == 1) and (mission_status == 14) then
	player:startEvent(Event(0x3a));
elseif (player:getMissionStatus(1,7) == 1) and (mission_status >= 10) and (mission_status <= 12) then
	player:startEvent(Event(0x33));
elseif (player:getMissionStatus(1,9) == 1) and (mission_status >= 7) and (mission_status <= 8) then
  player:startEvent(Event(0x3f));
elseif (player:hasKeyItem(KindredReport) == 1) or (player:hasKeyItem(KindredCrest) == 1) then 
  player:startEvent(Event(0x45));
else
  player:startEvent(Event(0x2c));
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
end;