--------------------------------------------------------------------
--	Author: ReaperX
-- 	Zubaba
--  "Head lady-in-waiting of Windurst."
---------------------------------------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
require("scripts/zones/Heavens_Tower/TextIDs");
require("scripts/globals/rankpoints");

RustyDagger = 0x403F;

function onTrigger(player,npc)
--[[ events:

0x038 standard 'greetings'.
0x09D "to think that the Star Sibyl would want to see a slimy-grimy adventurers! Have all my lessons in proper etiquette been in vain? .." (not yet scripted)
0x079 opening CS for mission 3-2 (1st run unskipped)
0x101 opening CS for mission 3-2 (1st run after you skipped it initially or 1st repeat)
0x07A repeats instructions for 3-2
0x087 closing CS for 3-2 (1st run, unskipped)
0x088 repeats from 0x87 that she thinks the Orastery minister is behind it.
0x095 opening CS for 3-2 (repeat run)
0x096 repeats instructions for 3-2 (repeat run)
0x097 closing CS for 3-2 (repeat run)
0x098 "Strictly speaking, adventurers are forbidden to enter the central tower of the Horutoto ruins.. we make exceptions, however, since adventurers make such efficient monster exterminators."
0x0A9 "So this is what the Star Sibyl had envisioned? After twenty years hard work to build bridges between Windurst and the beastmen, to have the Yagudo burn them down.." (not yet scripted)
0x0C2 her reaction after 5-1.
0x0D9 her reaction to the Shadow Lord's death.
0x13B
0x13C
0x12D
0x148
0x150
0x15D
0x183
--]]

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,11) == 1) and (player:getMissionStatus(2,12) == 0) then -- first run (unskipped)
	if mission_status == 1 then -- first run no skip
		player:startEvent(Event(0x79));
	elseif mission_status == 2 then
		player:startEvent(Event(0x7A));		
	elseif mission_status == 3 then
		player:startEvent(Event(0x87));
	end;
elseif (player:getMissionStatus(2,11) == 1) or (player:getVar("not_repeated_win3_2") == 1 and (player:getVar("win_repeat_mission") == 11)) then -- first run (previously skipped) or first repeat
	if mission_status == 1 then
		event = Event(0x101);
		event:setParams(0,RustyDagger);
		player:startEvent(event);
	elseif mission_status == 2 then
		event = Event(0x96);
		event:setParams(0,RustyDagger);
		player:startEvent(event);
	end;
elseif (player:getVar("win_repeat_mission") == 11) then -- repeat
	if mission_status == 1 then
		player:startEvent(Event(0x95));
	elseif mission_status == 2 then
		event = Event(0x96);
		event:setParams(0,RustyDagger);
		player:startEvent(event);
	end;
elseif (player:hasKeyItem(StarCrestedSummons) == 1) then
	player:startEvent(Event(0x9D));
elseif (player:hasKeyItem(ShadowFragment) == 1) or (player:getMissionStatus(2,15) == 2) then
	player:startEvent(Event(0xD9));
elseif (player:getMissionStatus(2,14) == 2) then
	player:startEvent(Event(0xC2));
elseif (player:getMissionStatus(2,11) == 2) and (player:getVar("not_repeated_win3_2") == 0) then
	player:startEvent(Event(0x98));
else
	player:startEvent(Event(0x38));
end;
end;

---------------------------------------------------------------------
-- onTrade Action
---------------------------------------------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 3) and (trade:hasItemQty(RustyDagger,3)) then
	if (( player:getMissionStatus(2,11) == 1 and player:getMissionStatus(2,12) == 2) -- first completion after skipped earlier or first repeat
		or player:getVar("win_repeat_mission") == 11) and player:getVar("mission_status") == 2 then
		trade:isComplete();
		player:startEvent(Event(0x97));
	end;
end;
end; 
 
---------------------------------------------------------------------
-- onEventFinish Action
---------------------------------------------------------------------
function onEventFinish(player,csid,option)
print("CSID:",csid);
print("RESULT:",option);
if (csid == 0x79) then
	player:addKeyItem(CharmOfLight);
	player:specialMessage(KEYITEM_OBTAINED,CharmOfLight);
	player:setVar("mission_status",2);
elseif (csid == 0x7A) and DEBUG_MODE then
	toRoseTower(player);
elseif (csid == 0x87) then
	player:setVar("mission_status",0);
	player:completeMission(2,11);
	add_rank_points_for_mission(player);
	player:setVar("not_repeated_win3_2",1);
	if (DEBUG_MODE) then
		toWindurstMissionOverseer(player);
	end;
elseif (csid == 0x95) or (csid == 0x101) then
	player:setVar("mission_status",2);
elseif (csid == 0x97) then
	player:setVar("mission_status",0);
	player:setVar("win_repeat_mission",0);
	player:completeMission(2,11);
	add_rank_points_for_mission(player);
	player:setVar("not_repeated_win3_2",0);
elseif (csid == 0x98) and DEBUG_MODE then
	toWindurstMissionOverseer(player);
end;
end;