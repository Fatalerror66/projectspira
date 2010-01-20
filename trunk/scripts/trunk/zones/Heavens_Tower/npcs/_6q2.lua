-----------------------------------
--	Author: ReaperX
-- 	Door: Vestal Chamber (chamber of the Star Sibyl)
--  Closed, only opens in cutscenes.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
require("scripts/zones/Heavens_Tower/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

--[[ Events
009A door is locked shut
0099 opening CS for 3-3
00A5 ?
00A4 ?
00A6 CS between Magicite and 5-1, offers mission "The Final Seal"
00BE offers mission "The Final Seal" if you turned it down the first time and gives you seal
00BF gives you the seal when youve already accepted the mission from the gate guard
00C0 final CS for 5-1 
00D6 opening CS for 5-2
00D8 final CS for 5-2, rank 6
0136 opening CS for 6-2 "Saintly Invitation"
0138 closing CS for 6-2 "Saintly Invitation"
014F 9-1 "The Doll of the Dead" first CS
016A 9-1 "The Doll of the Dead" second CS
0180 9-2 "Moon Reading" first CS
0181 9-2 "Moon Reading" second CS
0182 9-2 "Moon Reading" CS after the events at the Full Moon Fountain
0197 9-2 "Moon Reading" final CS


--]]

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,15) == 1) and mission_status == 1 then
	player:startEvent(Event(0xD6));
elseif (player:hasKeyItem(StarCrestedSummons) == 1) then
  player:startEvent(Event(0x99));
elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) then
	player:startEvent(Event(0xA6));
elseif (player:getMissionStatus(2,13) == 2) and (player:getMissionStatus(2,14) == 0) then
	player:startEvent(Event(0xBE));
elseif (player:hasKeyItem(BurntSeal) == 1) then
	player:startEvent(Event(0xC0));
elseif (player:getMissionStatus(2,14) == 1) and (player:hasKeyItem(NewFeiYinSeal) == 0) then
	player:startEvent(Event(0xBF));
elseif (player:hasKeyItem(ShadowFragment) == 1) then
	player:startEvent(Event(0xD8));
elseif (player:getMissionStatus(2,17) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x136));
elseif (player:getMissionStatus(2,17) == 1) and (mission_status == 2) and (DEBUG_MODE) then
	player:setPos(300, -123, 352, 69, 0x92);
elseif (player:getMissionStatus(2,17) == 2) and (player:getMissionStatus(2,18) == 0) and (DEBUG_MODE) then
	toWindurstMissionOverseer(player);
elseif (player:hasKeyItem(HolyOnesOath) == 1) then
	player:startEvent(Event(0x138));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x16A));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x180));
elseif player:hasKeyItem(AncientVerseOfRoMaeve) == 1 and player:hasKeyItem(AncientVerseOfAltepa) == 1 and player:hasKeyItem(AncientVerseOfUggalepih) == 1 then 
	player:startEvent(Event(0x181));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 4) then
	event = Event(0x182);
	event:setParams(0,0,OrasteryRing);
	player:startEvent(event);
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 5) then
	player:startEvent(Event(0x197));
else
	player:startEvent(Event(0x9A));
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x9a) and DEBUG_MODE then
	if (player:getMissionStatus(2,14) == 1) and (player:hasKeyItem(NewFeiYinSeal) == 1) then
		toFeiYin(player);
	elseif (player:getMissionStatus(2,15) == 1) and (player:getVar("mission_status") == 2) then
		toThroneRoom(player);
	elseif (player:getMissionStatus(2,23) == 1) and (player:getVar("mission_status") == 2) then
		toQuHauSpring(player);
	elseif (player:getMissionStatus(2,23) == 1) and (player:getVar("mission_status") == 3) then
		toFullMoonFountain(player);
	end;
elseif (csid == 0x99) then
	player:setVar("mission_status",2);
	player:removeKeyItem(StarCrestedSummons);
	player:addKeyItem(LetterToTheAmbassador);
	player:specialMessage(KEYITEM_OBTAINED,LetterToTheAmbassador);
	if (DEBUG_MODE) then
		toRuLudeEmbassyArea(player)
	end;
elseif (csid == 0xA6) then
	player:removeKeyItem(MessageToJeunoWindurst);
	if (option == 0) then                 -- player may or may not accept the mission at this point
	  player:setVar("mission_status",2);
	  player:addKeyItem(NewFeiYinSeal);
	  player:specialMessage(KEYITEM_OBTAINED,NewFeiYinSeal);
	  player:currentMission(2,14);
	end;
elseif (csid == 0xBE) and (option == 0) then
	player:setVar("mission_status",2);
	player:addKeyItem(NewFeiYinSeal);
	player:specialMessage(KEYITEM_OBTAINED,NewFeiYinSeal);
	player:currentMission(2,14);
elseif (csid == 0xBF) then
	player:addKeyItem(NewFeiYinSeal);
	player:specialMessage(KEYITEM_OBTAINED,NewFeiYinSeal);
	player:setVar("mission_status",2);
elseif (csid == 0xC0) then
	add_rank_points_for_mission(player)
	player:completeMission(2,14);
	player:removeKeyItem(BurntSeal);
	player:setVar("mission_status",0);
elseif (csid == 0xD6) then
	player:setVar("mission_status",2);
	player:removeKeyItem(StarCrestedSummons);
	player:setTitle(StarOrdainedWarrior);
elseif (csid == 0xD8) then
	player:removeKeyItem(ShadowFragment);
	player:rankUp();
	player:addGil(GIL_RATE*20000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*20000); 
	player:setTitle(ShadowBanisher);
	player:completeMission(2,15);
	player:setVar("mission_status",0);
elseif (csid == 0x136) then
	player:setVar("mission_status",2);
	player:addKeyItem(HolyOnesInvitation);
	player:specialMessage(KEYITEM_OBTAINED,HolyOnesInvitation);
	player:setTitle(HeroOnBehalfOfWindurst);
elseif (csid == 0x138) then
	player:removeKeyItem(HolyOnesOath);
	player:completeMission(2,17);
	player:rankUp();
	player:addGil(GIL_RATE*40000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*40000); 
	player:setVar("mission_status",0);
elseif (csid == 0x16A) then
	player:setVar("mission_status",4);
	if DEBUG_MODE then
		toManustery(player);
	end;
elseif (csid == 0x180) then
	player:setVar("mission_status",2);
elseif (csid == 0x181) then
	player:removeKeyItem(AncientVerseOfRoMaeve); -- should be changed since character performs the verses at the full moon fountain
	player:removeKeyItem(AncientVerseOfAltepa);
	player:removeKeyItem(AncientVerseOfUggalepih);
	player:setVar("mission_status",3);
elseif (csid == 0x182) then
	player:setVar("mission_status",5);
elseif (csid == 0x197) then
	player:setVar("mission_status",6);
	player:setPos(-30, -16, 138, 100, 0xEF); -- to Windurst Walls for final CS
end;
end;