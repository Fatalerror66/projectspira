---------------------------------------------------------------------
--	Author: ReaperX
-- 	Vahn Paineesha
--  one of the Sibyl Guards, involved in Windurst Missions
---------------------------------------------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)
--[[ events:

0x059 standard greeting
0x006 Ajido-Marujido appears (incomplete CS, played as part of 6B)
0x06B (3-1: CS with Semih Lafihna, Ajido-Marujido appears)
0x06D her reaction to 6B
0x072 (3-1 CS after you're back from castle O.)
0x074 her reaction to 72
0x0AD about the stolen talisman
0x0C6 about the shadow lord's return (after 5-1 has been completed)
0x0DD her reaction to the shadow lord's death (after 5-2)
0x142 talks about renegade missions given out by the gatehouse (during and after mission 6-1)
0x131 talks about the dark dungeon (pre-jailbreak)
0x170 talks about the creature that attacked the Star Sibyl (9-1)
0x175 talks about the frustration the Star Sibyl must have felt faking those readings (during 9-1)
0x17B talks about rescuing the Star Sibyl from the cardians (between 9-1 and 9-2)
0x17E Semih Lafihna has given the order to rescue the Star Sibyl
0x194 talks about the Moon Reading
--]]

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,10) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x6D));
elseif (player:getMissionStatus(2,10) == 2) and (player:getMissionStatus(2,11) == 0) then
	player:startEvent(Event(0x74));
elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) or (player:getMissionStatus(2,14) == 1) then
	player:startEvent(Event(0xAD));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x194));
elseif (player:getMissionStatus(2,23) == 1) and mission_status ==3 then
	player:startEvent(Event(0x17E));
elseif (player:getMissionStatus(2,22) == 2) then
	player:startEvent(Event(0x17B));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status >= 4) then
	player:startEvent(Event(0x175));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status >= 2) then
	player:startEvent(Event(0x170));
elseif (player:getMissionStatus(2,17) >= 1) then 
	player:startEvent(Event(0x131));
elseif (player:getMissionStatus(2,16) == 1) then
	player:startEvent(Event(0x142));
elseif (player:hasKeyItem(ShadowFragment) == 1) or ((player:getMissionStatus(2,15) == 2) and (player:getMissionStatus(2,16) == 0)) then
	player:startEvent(Event(0xDD));
elseif player:getMissionStatus(2,14) == 2 and player:getMissionStatus(2,15) <= 1 then
	player:startEvent(Event(0xC6)); 
else
	player:startEvent(Event(0x59));
end;
end;

---------------------------------------------------------------------
-- onTrade Action
---------------------------------------------------------------------
function onTrade(player,npc,trade)
end; 
 
---------------------------------------------------------------------
-- onEventFinish Action
---------------------------------------------------------------------
function onEventFinish(player,csid,option)
print("CSID:",csid);
print("RESULT:",option);
end;