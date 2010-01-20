-----------------------------------
--	Author: ReaperX
-- 	MISSION ARBITER: Zokima-Rokima
-- 	Gives Windurst Missions.  
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");

--[[ Events 

01BB long introductory CS (new adventurer Windurst?)
0057 this is Windurst Walls.. if you need help, ask ....
005D mission menu
005B complete your current mission before accepting anything else
0060 new recruit first mission CS
0061 explanation of gatehouses; offered as part of 0x60.
0062 yet another first mission CS
0063 repeats instructions for first mission
0066 well done! We give you rank points for your missions.
0067 same as 66
006A mission from the Manustery
006B repeats instructions for Manustery mission
006F tells you how to get to Windurst woods
0070 "head over to the rhinostery.."
0074 rank 2 promotion
0075 "let's keep working together.."
0079 urgent mission from the optistery 2-1
007A repeats instructions for optistery mission
007E Aurastery mission 2-2
007F repeats instructions for 2-2
0083 2-3
0086 repeats instructions for 2-3
0088 3-1
0089 repeats instructions for 3-1
008D 3-2
008E repeats instructions for 3-2
0091 3-3
0092 repeats instructions for 3-3
0096 emergency at the end of Magicite mission
0099 describes 5-1 mission (in case you didnt take it the first time) (played as part of menu event)
009A describes 5-1 destination again and reminds you to pick up the seal if you havent done it yet
009D I have a bad feeling about this but another .. is addressed to you. (5-2)
009E repeats instructions to meet the Star Sibyl (5-2)
015E 6-1 Full Moon Fountain
015F repeats instructions for 6-1 Full Moon Fountain
0163 6-2 "Saintly Invitation"
0164 repeats instructions for 6-2
0168 7-1 "The Sixth Ministry"
0169 repeats instructions for 7-1
016D 7-2 "Awakening of the Gods"
016E repeats instructions for 7-2
0172 8-1 "Vain"
0173 repeats instructions for 8-1
0177 8-2 "The Jester Who'd Be King"
0178 repeats instructions for 8-2
01A6 9-1
01A7 repeats instructions for 9-1
01AB 9-2
01AC repeats instructions for 9-2
01B3 thanks you for your service to Windurst (after reaching rank 10)
--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

nation = player:getNation();
mission_status = player:getVar("mission_status");
repeat_mission = player:getVar("win_repeat_mission");
--Standard,non-Windurst player dialogue--

if (nation ~= 2) then
	player:startEvent(Event(0x57));
else --Windurst player dialogue (most cases)
	if (player:getMissionStatus(2,0) == 0) then
		player:startEvent(Event(0x60));
	elseif (player:getMissionStatus(2,0) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x63));
	elseif (player:getMissionStatus(2,1) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x6B));
	elseif (player:getMissionStatus(2,2) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x70));
	elseif (player:getMissionStatus(2,2) == 1) and (mission_status == 3) then
		player:startEvent(Event(0x74));
	elseif (player:getMissionStatus(2,3) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x7A));
	elseif ((player:getMissionStatus(2,4) == 1) or (repeat_mission == 4)) and (mission_status == 1) then
		player:startEvent(Event(0x7F));
	elseif (player:getMissionStatus(2,5) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x86));
	elseif (player:getMissionStatus(2,10) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x89));
	elseif ((player:getMissionStatus(2,11) == 1) or (repeat_mission == 11)) and (mission_status == 1) then
		player:startEvent(Event(0x8E));
	elseif (player:getMissionStatus(2,12) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x92));
	elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) then
		player:startEvent(Event(0x96));
	elseif (player:getMissionStatus(2,14) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x9A));
	elseif (player:getMissionStatus(2,15) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x9E));
	elseif (player:getMissionStatus(2,16) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x15F));
	elseif (player:getMissionStatus(2,17) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x164));
	elseif (player:getMissionStatus(2,18) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x169));
	elseif (player:getMissionStatus(2,19) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x16E));
	elseif (player:getMissionStatus(2,20) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x173));
	elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x178));
	elseif (player:getMissionStatus(2,22) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x1A7));
	elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x1AC));
	elseif (mission_status ~= 0) then
		player:startEvent(Event(0x5B));
	else
		mission_mask, repeat_mask = get_mission_mask(player);
		-- repeat masks don't seem to influence gate guard dialogs in windurst.
		if (mission_mask == 2147483647) then     -- no missions available
			player:startEvent(Event(0x75));
		elseif (mission_mask == 2147483639) then -- only mission 2-1 available
			player:startEvent(Event(0x79));
		elseif (mission_mask == 2147483631) and (player:getMissionStatus(2,4) == 0) then -- only mission 2-2 available
			player:startEvent(Event(0x7E));
		else 
			event = Event(0x5D);
			event:setParams(mission_mask,0,0,0,StarCrestedSummons);
			player:startEvent(event);
		end;
	end;
end
end; 

function onEventSelection(player,csid,option) 
--print("onEventSelection")
--print("onEventSelection - CSID:",csid);         
--print("onEventSelection - option ===",option); 

mission_status = player:getVar("mission_status");

end

 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
weighted_sum = traded_crystals(trade,1);
if (weighted_sum > 0) then -- player traded crystals and only crystals
  if (player:getRank() >=2) then -- can only trade crystals if rank at least 2.
    if (player:getRankPoints() >= 4095) then
      player:showText(npc,RANK_POINTS_DIALOG);
    else 
      trade:isComplete();
      rank_points = add_crystals_to_rank_points(player, weighted_sum)
      --print("rank points added: ", rank_points);
      if (player:getRankPoints() >= 4095) then
        player:showText(npc,RANK_POINTS_DIALOG+1); -- rank points are full now
      else
        player:showText(npc,RANK_POINTS_DIALOG+2);
      end;
    end;
  end;
 end
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print(csid,option);
if (csid == 0x60) and (option == 1) then
	player:currentMission(2,0);
	player:setTitle(HeavensTowerGatehouseRecruit);
	player:setVar("mission_status",1);
	player:specialMessage(485); -- You have accepted the mission.
	player:setVar("firstmissionguard",1); -- stands for walls.
elseif (csid == 0x63) and (DEBUG_MODE) then
	toOrastery(player);
elseif (csid == 0x6B) and (DEBUG_MODE) then
	toManustery(player);
elseif (csid == 0x70) and (DEBUG_MODE) then
	toLeepeHoppe(player);
elseif (csid == 0x7F) and DEBUG_MODE then
	toAurastery(player);
elseif ((csid == 0x5D) or (csid == 0x79) or (csid == 0x7e)) and (option~= 31) and (option~=1073741824) then -- has chosen a mission
	if (option == 4) and player:getMissionStatus(2,4) == 2 then
		player:setVar("win_repeat_mission",4);
	elseif (option == 11) and player:getMissionStatus(2,11) == 2 then
		player:setVar("win_repeat_mission",11);
	else
		player:currentMission(2,option);
	end;
	player:setVar("mission_status",1); 	-- on a mission now.
	player:specialMessage(485); -- You have accepted the mission.
	if (option == 12) or (option == 15) then
		player:addKeyItem(StarCrestedSummons);
		player:specialMessage(KEYITEM_OBTAINED,StarCrestedSummons);
	end;
elseif (csid == 0x74) then
	player:completeMission(2,2);
	player:addGil(GIL_RATE*1000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*1000); 
	player:setVar("mission_status",0); 
	player:rankUp()
elseif ((csid == 0x86) or (csid == 0x89)) and DEBUG_MODE then
	toKupipi(player);
--elseif (csid == 0x8E) and DEBUG_MODE then
--	toZubaba(player);
elseif ((csid == 0x92) or (csid == 0x9E) or (csid == 0x164) or (csid == 0x96) or (csid == 0x1AC)) and (DEBUG_MODE) then
	toStarSibyl(player);
elseif (csid == 0x15F) and DEBUG_MODE then
	toOrastery(player);
elseif ((csid == 0x169) or (csid == 0x7A)) and DEBUG_MODE then
	toOptistery(player);
elseif (csid == 0x16E) and (DEBUG_MODE) then
	toLeepeHoppe(player);
elseif (csid == 0x173) and (DEBUG_MODE) then
	toAurastery(player);
elseif ((csid == 0x178) or (csid == 0x1A7)) and (DEBUG_MODE) then
	toManustery(player);
end;
end;