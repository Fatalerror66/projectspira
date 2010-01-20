-----------------------------------
--	Author: ReaperX
-- 	Kupipi
-- 	Involved in Windurst Missions, and Bastok,Sandy 2.3.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
require("scripts/zones/Heavens_Tower/TextIDs");

StarwayStairwayBauble = 0x24;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- Kupipi events ---------------------------------

-- 00FE : can't take two missions at once
-- 0102 " the star Sibyl is not taking the recent happenings very well"
-- 00FF : mission menu
-- 00FB : default
-- 005F : CS for Windurst Mission 2-3: "The Three Kingdoms"
-- 0061 : repeats instructions for 2-3
-- 0062 : "that is all. Now skedaddle!"
-- 00EE : for other nations' 2-3 mission (Windy first path)
-- 00EF : for other nations' 2-3 mission (Windy first path)
-- 00F0 : for other nations' 2-3 mission (Windy first path)
-- 00F1 : "back so soon?" (2-3)
-- 00F2 : for other nations' 2-3 mission (Windy last path)
-- 00F3 : "Giddeus is a scary place.."
-- 00F4 : Bastok 2-3 mission success
-- 00F5 : Bastok 2-3 repeats instructions to go back to embassy
-- 00F6 : Sandy 2-3 mission success
-- 00F7 : Sandy 2-3 repeats instructions to go back to embassy
-- 0065 : windy 2-3 final CS: Rank 3
-- 0066 : Portal Charm quest
-- 0123 : Portal Charm quest
-- 0124 : Portal Charm quest
-- 0125 : Portal Charm quest
-- 0127 : Portal Charm quest
-- 0067 : Windy 3.1 "To Each His Own Right"
-- 0068 : Windy 3.1 "To Each His Own Right"
-- 0071 : something about the orastery minister
-- 0078 : Zubaba requests your audience
-- 009B : describes how to get to the Star Sibyl's chamber
-- 009C : don't say anything, I am the one who wrote the crested summons you carry
-- 00A7 : describes how to get to the Star Sibyl's chamber
-- 00A8 : The Sibyl is not taking what has happened very well.. Lady Lafihna has also returned
-- 00C1 : "to get to the Star Sibyl's chambers, you must pass through the Planetarium.. I never thought that you would ever accept such a dangerous mission."
-- 00EB : "so happy to see you back"
-- 011B
-- 013A 
-- 012C
-- 0137
-- 014D "you're back!" I had heard that even if you win at Balgas's Dais, the Yagudo still treat you.."
-- 0139 "you are the champion of windurst"
-- 0149 you have had many hardships to overcome.. what drives you to meet these challenges? .. We appreciate everything you have done for us.
-- 0146 CS for 8-2 
-- 0147 CS for 8-2 
-- 014C something is not right here.. Why do I get the feeling you are hiding something from me (between 8-2 and 9-1?)
-- 016B Oh you are far too late! Minister Ajido-Marujido and Semih Lafihna have already gotten rid of the evil creature.. (9-1)
-- 016C I can't get the Star Sibyl's signature.. please help her (9-2)
-- 0190 There hasn't been a rank 10 adventurer around her for decades!
-- 0198 Rank 10.. this is such uncharted territory.. (she thanks you for your service to windurst)
-- 01AA about conflict
-- 01AB
-- 01AC

emissary_status1 = player:getMissionStatus(1,9);      -- The Emissary Windurst (Windy 2nd path)
emissary_status2 = player:getMissionStatus(1,7);      -- The Emissary Windurst (Windy first path)

journey_abroad_status1 = player:getMissionStatus(0,9);      -- Journey Abroad - Windurst (Windy 2nd path)
journey_abroad_status2 = player:getMissionStatus(0,7);      -- Journey Abroad - Windurst (Windy first path)

mission_status = player:getVar("mission_status");

if ((emissary_status1 == 1) or (journey_abroad_status1==1)) and (mission_status == 7) then
  event = Event(0xF2);
  event:setParams(1,1,1,1,player:getNation());
elseif ((emissary_status1 == 1) or (journey_abroad_status1==1)) and (mission_status == 8) then
  event = Event(0xF3);
elseif ((emissary_status2 == 1) or (journey_abroad_status2==1)) and (mission_status == 10) then
  event = Event(0xEE);
  event:setParams(1,1,1,1,player:getNation()); -- 5th param controls Sandy(0) or Bastok (1)
elseif ((emissary_status2 == 1) or (journey_abroad_status2==1)) and (mission_status == 11) then
  event = Event(0xF1);
elseif (emissary_status2==1) and (mission_status == 14) then
  event = Event(0xF4);
elseif (emissary_status2==1) and (mission_status == 14.5) then
  event = Event(0xF5);
elseif (journey_abroad_status2==1) and (mission_status == 12) then
  event = Event(0xF6);
elseif (journey_abroad_status2==1) and (mission_status == 13) then
  event = Event(0xF7);
elseif (player:getMissionStatus(2,5) == 1) and (mission_status == 1) then
	event = Event(0x5F);
	event:setParams(0,0,0,LetterToConsulsWindy);
elseif (player:getMissionStatus(2,5) == 1) and (mission_status == 2) then
	event = Event(0x61);
elseif (player:hasKeyItem(KindredReport) == 1) then 
	event = Event(0x65);
	event:setParams(0,0,AdventurersCertificate);
elseif (player:getMissionStatus(2,10) == 1) and (player:getVar("mission_status") == 1) then
	event = Event(0x67);
	event:setParams(0,0,StarwayStairwayBauble);
elseif (player:getMissionStatus(2,10) == 1) and (player:getVar("mission_status") == 2) then
	event = Event(0x68);
elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) then
	event = Event(0xA8);
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 3) then
	event = Event(0x146);
	event:setParams(0,OrasteryRing);
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 4) then
	event = Event(0x147);
	event:setParams(0,OrasteryRing);
elseif (player:getMissionStatus(2,21) == 2) and (player:getMissionStatus(2,22) == 0) then
	event = Event(0x14C);
elseif (player:getMissionStatus(2,22) == 1) and (mission_status >= 2) then
	event = Event(0x16B);
else
  event = Event(0xFB);
end

player:startEvent(event);
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
if (csid == 0xF2) then
	player:addKeyItem(DarkKey);
	player:specialMessage(KEYITEM_OBTAINED,DarkKey); 
	player:setVar("mission_status",8); -- BCNM in Giddeus now
elseif (csid == 0xEE) then
	if (player:getMissionStatus(1,7) == 1) then
		player:addKeyItem(SwordOffering)
		player:specialMessage(KEYITEM_OBTAINED,SwordOffering); 
	elseif (player:getMissionStatus(0,7) == 1) then
		player:addKeyItem(ShieldOffering)
		player:specialMessage(KEYITEM_OBTAINED,ShieldOffering); 
	end
player:setVar("mission_status",11);
elseif (csid == 0xF6) then
	player:setVar("mission_status",13);
elseif (csid == 0xF4) then
	player:setVar("mission_status",14.5);
elseif (csid == 0x5F) then
	player:setVar("mission_status",2);
	player:addKeyItem(LetterToConsulsWindy);
	player:specialMessage(KEYITEM_OBTAINED,LetterToConsulsWindy);
elseif (csid == 0x65) then
	player:removeKeyItem(KindredReport);
	player:completeMission(2,5);
	player:setVar("mission_status",0);
	player:addKeyItem(AdventurersCertificate);
	player:setTitle(CertifiedAdventurer)
	player:specialMessage(KEYITEM_OBTAINED,AdventurersCertificate); 
	player:addGil(GIL_RATE*3000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*3000); 
	player:rankUp()
elseif (csid == 0x67) then
	player:addKeyItem(StarwayStairwayBauble);
	player:specialMessage(KEYITEM_OBTAINED,StarwayStairwayBauble);
	player:setVar("mission_status",2);
elseif (csid == 0x146) then
	player:setVar("mission_status",4);
elseif (csid == 0x147) and (DEBUG_MODE) then
	toAmaryllisTower(player)
end
end;