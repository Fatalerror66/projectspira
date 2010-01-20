---------------------------------------------------------------------
--	Author: ReaperX
-- 	Ufu Koromoa
--  one of the Sibyl Guards, involved in Windurst Missions
---------------------------------------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");

function onTrigger(player,npc)
--[[ events:
0x05E default greetings
0x006 Ajido-Marujido appears (incomplete CS, played as part of 6B)
0x06B (3-1: CS with Semih Lafihna, Ajido-Marujido appears)
0x06F her reaction after 6B
0x072 (3-1 CS after you're back from castle O.)
0x076 her reaction after 72
0x09F for 3-3
0x0A1 "I Shall pray to the stars that your mission is a success."
0x0AB "Watch yourself in there or you will have Lady Semih Lafihna to answerrr to!"
0x0B0 Who could have stolen the talisman from right under our tails? (after Magicite mission)
0x0C4 "Watch yourself in there or you will have Lady Semih Lafihna to answerrr to!"
0x0C9 "My Mithra blood is boiling. I still have dreams about my motherrr being slaughtered by the beastmen."
0x0DB her reaction after you return from 5-2 BCNM.
0x13F her reaction after you reach rank 6.
0x144 "The strongest of the Sibyl Guards is, without a doubt, Semih Lafihna. She has the ability to read the flow of things."
0x12F "Watch yourself in there or you will have Lady Semih Lafihna to answerrr to!" (start of 6-2 ?)
0x134 
0x16E 
0x172 "Those soulless eyes.. a chill runs down my spine just thinking about it."
0x177 says that it was too dangerous for the Star Sibyl to head to the Full Moon Fountain (after 9-1)
0x179 "Semih Lafihna awaits you in the Star Sibyl's Chambers" (9-2)
0x17D "You look nervous. I understand. A heavy fate rides upon your shoulders." (9-2)
0x192 "by killing the great beast, Karaha-Baruha saved Windurst from its fate of destruction.." (9-2?)
0x182 (CS for 9-2)
--]]
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,10) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x6F));
elseif (player:getMissionStatus(2,10) == 2) and (player:getMissionStatus(2,11) == 0) then
	player:startEvent(Event(0x76));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x192));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status >= 2) then
	player:startEvent(Event(0x17D));
elseif (player:getMissionStatus(2,23) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x179));
elseif (player:getMissionStatus(2,22) == 2) then
	player:startEvent(Event(0x177));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status >= 2) then
	player:startEvent(Event(0x172));
elseif (player:getMissionStatus(2,17) == 1) and mission_status == 1 then
	player:startEvent(Event(0x12F));
elseif (player:hasKeyItem(StarCrestedSummons) == 1) then
	player:startEvent(Event(0xAB));
elseif (player:hasKeyItem(LetterToTheAmbassador) == 1) then
	player:startEvent(Event(0x91));
elseif (player:hasKeyItem(BurntSeal) == 1) then
	player:startEvent(Event(0xC4));
elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) or (player:getMissionStatus(2,14) == 1) then
	player:startEvent(Event(0xB0));
elseif player:getMissionStatus(2,15) == 2 then
	player:startEvent(Event(0x13F));
elseif (player:hasKeyItem(ShadowFragment) == 1) then
	player:startEvent(Event(0xDB));
elseif (player:getMissionStatus(2,14) == 2) then
	player:startEvent(Event(0xC9));
else
	player:startEvent(Event(0x5E));
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