---------------------------------------------------------------------
--	Author: ReaperX
-- 	Shaz Norem
--  one of the Sibyl Guards, involved in Windurst Missions
---------------------------------------------------------------------

require("scripts/globals/settings");

function onTrigger(player,npc)

--[[ events:
0x05B standard greetings
0x006 Ajido-Marujido appears (incomplete CS, played as part of 6B)
0x06B (3-1: CS with Semih Lafihna, Ajido-Marujido appears)
0x06E her reaction to 6B
0x072 (3-1 CS after you're back from castle O.)
0x075 her reaction to 72
0x0AE after the talisman was stolen
0x0C7 her reaction after 5-1
0x0DE her reaction to the Shadow Lord's death
0x141 as you can see, we Sibyl guards are not a chosen few.. 
0x132 do you remember the bearer of darkness that appeared here? Someone came here claiming to have seen it in another country..
0x16D 9-1 (talks about the bearer of darkness)
0x173 "Rescuing the Star Sibyl will best be accomplished by a small, well-coordinated team. " (after 9-1, into 9-2)
0x17F talks about the Yagudo's attack plans (9-2)
0x191 talks about the Yagudo's obsession with the magix towers (?)
--]]

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,10) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x6E));
elseif (player:getMissionStatus(2,10) == 2) and (player:getMissionStatus(2,11) == 0) then
	player:startEvent(Event(0x75));
elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) or (player:getMissionStatus(2,14) == 1) then
	player:startEvent(Event(0xAE));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x191));
elseif (player:getMissionStatus(2,23) == 1) and mission_status ==3 then
	player:startEvent(Event(0x17F));
elseif (player:getMissionStatus(2,22) == 2) then
	player:startEvent(Event(0x173));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status >= 2) then
	player:startEvent(Event(0x16D));
elseif (player:getMissionStatus(2,17) == 1) then
	player:startEvent(Event(0x132));
elseif (player:getMissionStatus(2,16) == 1) then
	player:startEvent(Event(0x141));
elseif (player:hasKeyItem(ShadowFragment) == 1) or ((player:getMissionStatus(2,15) == 2) and (player:getMissionStatus(2,16) == 0)) then
	player:startEvent(Event(0xDE));
elseif (player:getMissionStatus(2,14) == 2) then
	player:startEvent(Event(0xC7));
else
	player:startEvent(Event(0x5B));
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