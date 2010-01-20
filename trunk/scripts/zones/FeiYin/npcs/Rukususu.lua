-----------------------------------
--	Author: Kegsay, ReaperX
-- 	Rukususu
-- 	Quest: Curses, Foiled A-Golem?! (Warp II Quest)
--  Windurst Mission 8-2
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
require("scripts/zones/FeiYin/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status") 

spell = player:hasKeyItem(0xAB); --Key Item: Shantoto's New Spell
exspell = player:hasKeyItem(0xAC); -- Key Item: Shantoto's Ex Spell
--event0xD is when killed too many magic monsters, weakened spell.
--Shows CS then need to go to B.Glacier and get a new spell.

if (exspell ==1) then
  local event0xD = Event(0xD);
  event0xD:setParams(0,2);
  player:startEvent(event0xD);
end

--event0xE is when spell is intact, magic monsters were not killed.
--Shows CS then takes Shantoto's Spell.
if (spell ==1) then
  player:removeKeyItem(0xAB);
  local event0xE = Event(0xE);
  event0xE:setParams(0,2);
  player:startEvent(event0xE);
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 2) and (player:hasKeyItem(RhinosteryRing) == 0) then
	event = Event(0x16);
	event:setParams(0,RhinosteryRing);
	player:startEvent(event);
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 2) and (player:hasKeyItem(RhinosteryRing) == 1) then
	player:showText(npc,966); --needs to be fixed
	if (DEBUG_MODE) then
		player:setPos(-14, -3, 14, 221, 0xF1);   -- to Apururu (Manustery)
	end;
else
  --event0xF is when Quest isn't active.
  --event0x0016 is for Book of the Gods, Mission Windurst presumably.
  local event0xF = Event(0xF);
  event0xF:setParams(0,2);
  player:startEvent(event0xF);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x16) then
	player:addKeyItem(RhinosteryRing);
	player:specialMessage(KEYITEM_OBTAINED,RhinosteryRing);
end;
end;