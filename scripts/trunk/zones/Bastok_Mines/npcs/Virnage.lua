-----------------------------------
--	Author: SharXeniX, Almendro, Numbaone
-- 	Virnage
-- 	Quest: "Altana's Sorrow" ; "A Question of Faith"
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- Initialization
BucketofDivinePaint = 0xAD;
LetterfromVirnage = 0xAE;

DawnTalisman = 0x262;
virnageevent = Event(0xEF);
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

bflvl = player:getFameLevel(1); 						-- Get Bastok Fame Level
lvl = player:getMainLvl();								-- Has at least lvl 10
altanasSorrow = player:getQuestStatus(1,49);			-- Get Altana's Sorrow quest status
keyBucket = player:hasKeyItem(BucketofDivinePaint);		-- Get "Bucket of divine paint" key item status
keyLetter = player:hasKeyItem(LetterfromVirnage);		-- Get "Letter from Virnage" key item status
AQuestionofFaith_temp = player:getVar("AQuestionofFaithprogress"); --Current progress of "A Question of Faith"
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if(bflvl >= 4 and lvl >= 10 and altanasSorrow == 0)then
		player:startEvent(Event(0x8D));
		player:addQuest(1,49);
	elseif(altanasSorrow == 1 and keyBucket == 0 and keyLetter == 0)then
		player:startEvent(Event(0x8E));
	elseif(altanasSorrow == 1 and keyBucket == 1 and keyLetter == 0)then
		player:startEvent(Event(0x8F));		
	elseif(altanasSorrow == 1 and keyBucket == 0 and keyLetter == 1)then
		player:startEvent(Event(0x90));		
	elseif(OutoftheDephts == 2 and Bastokfamelevel >= 4) then    
		player:startEvent(Event(0xEF));	 -- Flag Cutscene for a "A Question of Faith"
										 -- Event Parameters needed?
	elseif (AQuestionofFaith_temp == 3) then  
		player:startEvent(Event(0xF1)); -- "A Question of Faith" , Final CS
	elseif (AQuestionofFaith_temp == 4) then  --(After Final CS value of)
		player:startEvent(Event(0xF3)); -- "A Question of Faith" , Additional Optional Final CS
	else								
		player:startEvent(Event(0x8C));
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
if(csid == 0x8F)then
	player:removeKeyItem(BucketofDivinePaint);			--Remove "Bucket of divine paint" key item
	player:addKeyItem(LetterfromVirnage);				--Add "Letter from Virnage" key item
	player:specialMessage(KEYITEM_OBTAINED,LetterfromVirnage);
elseif(csid == 0xEF)then       							
	player:setVar("AQuestionofFaithprogress",2);        --progresses "A Question of Faith" to Second Step
	player:addKeyItem(DawnTalisman);				    --Gives key item Dawn Talisman
	player:specialMessage(KEYITEM_OBTAINED,DawnTalisman);
	player:addQuest(1,77);
elseif(csid == 0xF1)then  
	player:completeQuest(1,77); -- Quest Complete -- "A Question of Faith"
	player:setVar("AQuestionofFaithprogress",4); --(Final Value of variable needs to be updated)
	-- need to add title set here--
end
end;

--Revised on 12/26/2009, Fixed reverse cutscenes