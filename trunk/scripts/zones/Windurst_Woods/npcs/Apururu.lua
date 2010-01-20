-----------------------------------
--	Author: Tenjou, ReaperX
-- 	MANUSTERY MINISTER: Apururu
-- 	Involved in Mission 1-2, 8-2 and probably several other quests and missions.
-----------------------------------

package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
require("scripts/globals/rankpoints");
require("scripts/globals/settings");
 
--[[ Events 

0112
011B
011C
0089 mission 1-2
008A mission 1-2
008F mission 1-2
0090 mission 1-2
0091 mission 1-2
0121 "Cardian's aren't people you know.." (unclear where this event belongs)
0129
012C
0131
0134
0136
013A
013E
0188
0189
018D
018E
013F
0140
0145
0146
014A
0257 "I must help my brother.. I must be strong.."
024C opening CS for 8-2	
0002
024D repeats instructions
0259 after returning with 4 of the rings
024E after returning with last ring (8-2)
024F repeats instructions
0250 tells you to go to dark dungeon
0251 repeats instructions
025D repeats 261 information
0261 final CS for 8-2
0255 "You want to talk to me about Mana orbs? I'm sorry but I'm up to my earlobes at work at the moment.."
0258 talks about cardian cards
026B opening for 9-1
026A repeats instructions for 26B
026C next CS for 9-1
026E repeats instructions for 26C
026D third CS for 9-1
026F repeats instructions for 26D
028D
027C
027D
028C
0281
--]]
 
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,1) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x89)); -- starts mission
elseif (player:getMissionStatus(2,1) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x8a)); -- repeats instructions
elseif (player:getMissionStatus(2,1) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x8f));
elseif (player:getMissionStatus(2,1) == 2) and (player:getMissionStatus(2,2) == 0) then
	player:startEvent(Event(0x90));
elseif (player:getMissionStatus(2,1) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x91)); -- finishes mission
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 5) then
	player:startEvent(Event(0x24E));
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x24F));
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x250));
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 8) then
	player:startEvent(Event(0x251));
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 9) then
	event = Event(0x261);
	event:setParams(0,GloveOfPerpetualTwilight);
	player:startEvent(event);
elseif (player:getMissionStatus(2,21) == 2) and (player:getMissionStatus(2,22) == 0) then 
	player:startEvent(Event(0x25D));
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 3) then
	player:showText(npc,2774);
	if (DEBUG_MODE) then
		toKupipi(player);
	end;
elseif (player:hasKeyItem(ManusteryRing) == 1) and (player:hasKeyItem(RhinosteryRing) == 1) and (player:hasKeyItem(OptisteryRing) == 1) then
	event = Event(0x259);
	event:setParams(0,OrasteryRing);
	player:startEvent(event);
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 1) then
	event = Event(0x24C);
	event:setParams(0,ManusteryRing);
	player:startEvent(event);
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x24D));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x26B));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x26A));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x26C));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status == 5) then
	player:startEvent(Event(0x26E));
elseif (player:hasKeyItem(LetterFromZonpaZippa) == 1) then
	player:startEvent(Event(0x26D));
elseif (player:getMissionStatus(2,22) == 1) and (mission_status == 10) then
	player:startEvent(Event(0x26F));
elseif (1==2) then
	player:startEvent(Event(0x121));
else
	player:startEvent(Event(0x112));
end
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
if (csid == 0x89) then
	player:addKeyItem(FirstDarkManaOrb);
	player:addKeyItem(SecondDarkManaOrb);
	player:addKeyItem(ThirdDarkManaOrb);
	player:addKeyItem(FourthDarkManaOrb);
	player:addKeyItem(FifthDarkManaOrb);
	player:addKeyItem(SixthDarkManaOrb);
	player:specialMessage(KEYITEM_OBTAINED,FirstDarkManaOrb);
	player:specialMessage(KEYITEM_OBTAINED,SecondDarkManaOrb);
	player:specialMessage(KEYITEM_OBTAINED,ThirdDarkManaOrb);
	player:specialMessage(KEYITEM_OBTAINED,FourthDarkManaOrb);
	player:specialMessage(KEYITEM_OBTAINED,FifthDarkManaOrb);
	player:specialMessage(KEYITEM_OBTAINED,SixthDarkManaOrb);
	player:setVar("mission_status",2);
elseif (csid == 0x8A) and DEBUG_MODE then
	toMargueriteTower(player);
elseif (csid == 0x8f) then
	player:completeMission(2,1);
	player:setVar("mission_status",0);
elseif (csid == 0x91) then
	player:removeKeyItem(FirstGlowingManaOrb);
	player:removeKeyItem(SecondGlowingManaOrb);
	player:removeKeyItem(ThirdGlowingManaOrb);
	player:removeKeyItem(FourthGlowingManaOrb);
	player:removeKeyItem(FifthGlowingManaOrb);
	player:removeKeyItem(SixthGlowingManaOrb);
	player:completeMission(2,1);
	player:setVar("mission_status",0);
elseif (csid == 0x90) and (DEBUG_MODE) then
	toWindurstMissionOverseer(player);
elseif (csid == 0x24C) then
	player:setVar("mission_status",2);
	player:addKeyItem(ManusteryRing);
	player:specialMessage(KEYITEM_OBTAINED,ManusteryRing);
elseif (csid == 0x24D) and (DEBUG_MODE) then
	toOptistery(player);
elseif (csid == 0x259) then
	player:setVar("mission_status",3);
elseif (csid == 0x24E) then
	player:setVar("mission_status",6);
elseif ((csid == 0x24F) or (csid == 0x25D)) and (DEBUG_MODE) then
	toShantotto(player);
elseif (csid == 0x250) then
	player:setVar("mission_status",8);
	if (DEBUG_MODE) then
		toRoseTower(player)
	end;
elseif (csid == 0x261) then
	player:completeMission(2,21);
	player:addGil(GIL_RATE*80000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*80000); 
	player:setVar("mission_status",0);
	player:rankUp();
elseif (csid == 0x26B) then
	player:setVar("mission_status",2);
elseif (csid == 0x26A) and (DEBUG_MODE) then
	toStarSibyl(player)
elseif (csid == 0x26C) then
	player:setVar("mission_status",5);
elseif (csid == 0x26E) and (DEBUG_MODE) then
	player:setPos(100, 9, 120, 192, 0x99); -- to Boyahda Tree
elseif (csid == 0x26D) then
	player:setVar("mission_status",10);
	player:removeKeyItem(LetterFromZonpaZippa);
elseif (csid == 0x26F) and (DEBUG_MODE) then
	toFullMoonFountain(player);
end;
end;
