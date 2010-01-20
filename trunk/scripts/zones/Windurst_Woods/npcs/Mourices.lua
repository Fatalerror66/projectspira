-----------------------------------
--	Author: ReaperX
-- 	San D'orian Consul: Mourices
-- 	For Sandy mission 2-3.
--  questionable behavior: 
--  1. On 2-3, Windy first path, he calls you a fool when you return and just click on him, even if you actually have the 2 shields. 
--  2. On 2-3, Windy first path, talking to Kupipi first after returning from Gideus is skippable.
-----------------------------------

package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

--[[ Mourices events:
0x1b9: default - I have no business with you.
0x1c0: opening CS for Windy first path of mission 2-3
0x1c1: repeats instructions to give magic shield to yagudo and to take 2 shields in return
0x1c2: "now, be off with you!"
0x1c3: repeats instructions to give a magic shield to the Yagudo.(nearly same as 0x1c1)
0x1c7: berates you for not delivering the shield
0x1c8: berates you for not bringing back 2 shields in return
0x1c9: final CS for Windy first path of mission 2-3
0x1ca: repeats instructions to head to Bastok
0x1ce: opening CS for Windy second path of mission 2-3
0x1cf: repeats instructions to kill monster in Giddeus
0x1d3: CS after monster has been killed
0x1d4: repeats instructions to return to Sandy
--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();

nation = player:getNation();
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(0,5) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x1ce));
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x1c0));
elseif (player:getMissionStatus(0,7) == 1) and (mission_status == 10) then
	player:startEvent(Event(0x1c1));
elseif (player:getMissionStatus(0,7) == 1) and (mission_status == 11) then
	player:startEvent(Event(0x1c3));
elseif (player:getMissionStatus(0,7) == 1) and ((mission_status == 12) or (mission_status == 13)) then
	player:startEvent(Event(0x1c8));
	player:setVar("sandy_shield_mission",1);
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 14) then
	player:startEvent(Event(0x1ca));
elseif (player:hasKeyItem(KindredCrest) == 1) and (player:getMissionStatus(0,9) == 1) then 
  player:startEvent(Event(0x1d3));
elseif (player:hasKeyItem(KindredReport) == 1) and (player:getMissionStatus(0,9) == 1) then 
  player:startEvent(Event(0x1d4));
elseif (player:getMissionStatus(0,9) == 1) and (mission_status >= 7) then
	player:startEvent(Event(0x1cf));
else
  player:startEvent(Event(0x1b9));
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

mission_status = player:getVar("mission_status");
if (trade:getItemCount() == 2) and (trade:hasItemQty(ParanaShield,2)) and (player:getMissionStatus(0,7) == 1) and ((mission_status == 12) or (mission_status == 13)) then
  trade:isComplete();
  player:startEvent(Event(0x1c9));
elseif (trade:getItemCount() == 2) and (trade:hasItemQty(ParanaShield,2)) and (player:getMissionStatus(0,7) == 1) and (mission_status == 11) then
  player:setVar("sandy_shield_mission",1);
  player:startEvent(Event(0x1c7)); -- player brought back two shields but failed to deliver the shield to the Yagudo
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x1c0) then
	player:setVar("mission_status",10);
	player:currentMission(0,7);  
elseif (csid == 0x1c1) and (DEBUG_MODE) then
	toKupipi(player)
elseif (csid == 0x1ca) and (DEBUG_MODE) then
	player:setPos(24, -14, -15, 0, 0xED);  -- to Bastok Metalworks
elseif (csid == 0x1c9) then
	player:setVar("mission_status",14);
	player:setVar("sandy_shield_mission",0);
	player:currentMission(0,5);  
elseif (csid == 0x1ce) then
	player:setVar("mission_status",7);
	player:currentMission(0,9);
	player:removeKeyItem(LetterToConsulsSandy);
elseif (csid == 0x1d3) then
	player:setVar("mission_status",9);  -- return to Sandy
	player:addKeyItem(KindredReport)
	player:specialMessage(KEYITEM_OBTAINED,KindredReport); 
	player:removeKeyItem(KindredCrest)
	player:currentMission(0,5);
end;
end;