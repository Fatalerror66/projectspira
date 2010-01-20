-----------------------------------
--	Author: ReaperX
-- 	Rhy Epocan
--  one of the Sibyl Guards, involved in Windurst Missions
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");

--[[ events:
005D default message
0006 Ajido-Marujido appears (incomplete CS, played as part of 6B)
006B 3-1: CS with Semih Lafihna, Ajido-Marujido appears
006C 3-1 reaction after 6B
0072 3-1 CS after you're back from castle O.
0073 3-1 reaction after 72
009E for 3-3
00A0 "remember, you will be representing your country. Act accordingly!"
00AA "proceeed to the door in the back." (currently not used)
00AF "The talisman sealing Castle Zvahl has been stolen from the Horutoto Rrruins."
00C3 "proceeed to the door in the back." (end of mission 5-2)
00C8 "I knew it! The beastmen were planning the rrreturn of the shadow lord all along."
00DA her reaction to the Shadow Lord's death
013E her reaction after you reach rank 6.
0143
012E "proceeed to the door in the back." (beginning of mission 6-2 ?)
0133 "The Shadow Lord has fallen, but the beastmen are still stirring.."
0171 "I feel so useless.. our best attacks merely rebounded off that ring. So this is what it feels like to be completely outmatched.." (9-1)
0176 talks about the Joker and the bearer of Darkness (after 9-1)
0178 "Semih Lafihna awaits you in the Vestal Chamber" (9-2)
017C "Let us join our strength and change the flow of fate." (9-2)
0195 Talks about the yagudo (9-2?)
0x182 (CS for 9-2)
--]]

require("scripts/globals/settings");

function onTrigger(player,npc)
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,10) == 1) and mission_status == 2 then
	player:startEvent(Event(0x6B));
elseif (player:getMissionStatus(2,10) == 1) and mission_status == 3 then
	player:startEvent(Event(0x6C));
elseif (player:getMissionStatus(2,10) == 1) and mission_status == 4 then
	player:startEvent(Event(0x72));
elseif (player:getMissionStatus(2,10) == 2) and (player:getMissionStatus(2,11) == 0) then
	player:startEvent(Event(0x73));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x195));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status >= 2) then
	player:startEvent(Event(0x17C));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x178));
elseif (player:getMissionStatus(2,22) == 2) then
	player:startEvent(Event(0x176));
	
elseif (player:getMissionStatus(2,22) == 1) and (mission_status >= 2) then
	player:startEvent(Event(0x171));
elseif (player:getMissionStatus(2,17) == 1) and mission_status == 1 then
	player:startEvent(Event(0x12E));
elseif (player:hasKeyItem(StarCrestedSummons) == 1) then
	player:startEvent(Event(0x9E));
elseif (player:hasKeyItem(LetterToTheAmbassador) == 1) then
	player:startEvent(Event(0xA0));
elseif (player:hasKeyItem(BurntSeal) == 1) then
	player:startEvent(Event(0xC3));
elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) or (player:getMissionStatus(2,14) == 1) then
	player:startEvent(Event(0xAF));
elseif player:getMissionStatus(2,15) == 2 then
	player:startEvent(Event(0x13E));
elseif (player:hasKeyItem(ShadowFragment) == 1) then
	player:startEvent(Event(0xDA));
elseif (player:getMissionStatus(2,14) == 2) then
	player:startEvent(Event(0xC8));
else
	player:startEvent(Event(0x5D));
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
if (csid == 0x6B) then
	player:setVar("mission_status",3);
elseif (csid == 0x6C) and DEBUG_MODE then
	toOrastery(player);
elseif (csid == 0x72) then
	add_rank_points_for_mission(player)
	player:setVar("mission_status",0);
	player:completeMission(2,10);
elseif (csid == 0x73) then
	if (DEBUG_MODE) then
		toWindurstMissionOverseer(player)
	end;
end;
end;