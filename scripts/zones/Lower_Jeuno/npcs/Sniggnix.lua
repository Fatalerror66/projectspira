-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Sniggnix
-- 	Basic Chat Text, THF AF2
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

RegalDie = 0x444;
SecondForgedEnvelope = 0xBC;
SecondSignedForgedEnvelope = 0xBE;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if player:getQuestStatus(2,70) == 1 and player:getVar("THF_AF2_GAMBLING") == 0 then
	event = Event(0x2728);
	playerscore = math.random(0,999);
	goblinscore = math.random(0,999);
	event:setParams(0,RegalDie,playerscore,goblinscore);
	player:startEvent(event);
elseif player:getVar("THF_AF2_GAMBLING") == 1 then
	event = Event(0x2729);
	event:setParams(0,RegalDie);
	player:startEvent(event);
elseif player:getVar("THF_AF2_GAMBLING") == 7 then
	event = Event(0x272A);
	playerscore = math.random(0,998);
	pauluartscore = math.random(playerscore,999); -- player always rolls smaller number.
	event:setParams(0,RegalDie,playerscore,pauluartscore);
	player:startEvent(event);
else	
	player:startEvent(Event(0x2727));
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
if (csid == 0x2728) and (option == 1) then
	player:setVar("THF_AF2_GAMBLING",1);
elseif (csid == 0x2729) and DEBUG_MODE then
	player:setPos(-369,4, 233, 42, 0xbf); -- to Dangruf Wadi,Saltvix
elseif (csid == 0x272A) then
	player:removeKeyItem(SecondForgedEnvelope);
	player:addKeyItem(SecondSignedForgedEnvelope);
	player:specialMessage(KEYITEM_OBTAINED,SecondSignedForgedEnvelope);
	player:setVar("THF_AF2_GAMBLING",8);
end;
end;