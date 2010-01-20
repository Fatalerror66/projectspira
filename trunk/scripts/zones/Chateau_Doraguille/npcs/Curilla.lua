-----------------------------------
--	Author: ReaperX
-- 	Curilla
-- 	Sandy Missions, RDM AF quest
-- 
--  problem: right now event 0x33 would practically never be seen by players
--  because you'd have to kill Guardian statue, go back to Chateau, talk to
--  Curilla, then go back to Garlaige and get CS from Oaken Box.
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");

CURILLA_OFFSET = 1111;

CurillasBottle1 = 0xA4;
CurillasBottle2 = 0xA5;
  LynxBaghnakhs = 16409;
 OldPocketWatch = 0xC5;
	   OldBoots = 0xC6;
   CrawlerBlood = 0xC9;
--[[ events 

0233 Aht Urhgan Mission 5: Confessions of Royalty
0234 Aht Urhgan Mission 5: Confessions of Royalty
0042 ("Fit for a Prince" CS)
002B opening CS for Savage Blade quest
002E ask for new trial weapon/abort WS quest (Savage Blade quest)
002D not enough WS points on Sapara of Trials (Savage Blade quest)
002C gives you map to the Annals of Truth (Savage Blade quest)
002F repeats instructions for 2C
0030 final CS for "Old Wounds" (Savage Blade quest)
000A second CS for Sandy 9.2 "The Heir to the Light"
0009 (Halver: final CS for Sandy 9.2 "The Heir to the Light" + Promotion to rank 10!)
0064 (opening CS for Sandy 8.2 "Lightbringer")
0212 default response: introduces herself
0221 "things cannot be allowed to proceed as they are.. there must be a way to convince him" (after 5-1)?
0038 "it seems we avoided the worst.." (after 5-2)?
0039 "I have been assigned to the investigation of a remote island off the west of the Vollbow coast."
0067 "We located Lightbringer on a small, remote island off the coast of Vollbow."
0010 "I have heard the rumors of the fate of Rochefogne. However, I will not believe he is dead until I have seen the body with my own eyes."
0011 "we have increased the guard for the rites of succession twofold. "
0012 "we must retrieve Lightbringer at all costs!"
0013 "our mission is finally over..."
0014 offers you to join the Temple Knights (rank 10?)
0037 opening CS for quest "The General's Secret"
0035 repeats instructions for quest "The General's Secret"
0036 final CS for quest "The General's Secret"
005E opening CS for "Enveloped in Darkness" (RDM AF2 quest)
005D repeats instructions for "Enveloped in Darkness" 
005F CS for "Enveloped in Darkness"  (asks again if you want to take up quest)
005C CS for "Enveloped in Darkness" ("often would my father visist that place..")
0065 CS for "Enveloped in Darkness" after you return with key item Old Boots.
0075 repeats instructions to burry the old boots in the Crawler''s Nest
0072 "so the greaves were made for red mages.." 
006D starts RDM AF3
006C "I commend you for offering to help, but already you know as much as I do."
0071 "What? In Fei'yin you met the ghost of my father, and saw him suffering? The mystery deepens."
0033 "You've found my father's remains in Garlaige? My poor father's soul will never rest until his remains are properly buried."
0034 she thanks you for helping to uncover the mystery of her father''s death.
01FD (CS after returning from Magicite mission)
0216 (Halver event: 5-2 CS)
022B (CS for 3-2 "The Crystal Spring")
0232 (Lure of the Wildcat)

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------	
mission_status = player:getVar("mission_status");
		 level = player:getMainLvl();

if ((player:getMissionStatus(0,14) == 2) and (player:getMissionStatus(0,15) == 0)) or ((player:getMissionStatus(0,15) == 1) and (mission_status <= 3)) then
	player:startEvent(Event(0x221));	
elseif (player:getMissionStatus(0,11) == 1) and (mission_status == 3) then
	player:showText(npc, CURILLA_OFFSET + 262);
elseif (player:getMissionStatus(0,21) == 1) and ((mission_status == 2) or (mission_status == 3)) then
	player:startEvent(Event(0x39));	
elseif (player:getMissionStatus(0,22) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x10));	
elseif ((player:getMissionStatus(0,21) == 1) and (mission_status == 5)) or ((player:getMissionStatus(0,21) == 2) and (player:getMissionStatus(0,22) <= 1)) then
  player:startEvent(Event(0x67));	
elseif (player:getMissionStatus(0,22) == 2) and (player:getMissionStatus(0,23) == 0) then
	player:startEvent(Event(0x11));	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status >= 3) and (mission_status <= 4) then
	player:startEvent(Event(0x12)) 	
elseif (player:getMissionStatus(0,23) == 1) and ((mission_status == 6) or (mission_status == 7)) then
	player:startEvent(Event(0x13)) 	
elseif ((player:getMissionStatus(0,23) == 1) and (mission_status == 8)) or ((player:getRank() == 10) and (player:getNation() == 0)) then
	player:startEvent(Event(0x14)) 	
elseif ((player:getMissionStatus(0,15) == 1) and (mission_status == 4)) or (player:getMissionStatus(0,15) == 2) then
	player:startEvent(Event(0x38)); -- starting at player's victory over the shadow lord, this is the new default message.
elseif (player:getQuestStatus(0,60) == 0) and (player:getFameLevel(0) >=2) and (level >= 15) then
	player:startEvent(Event(0x37));
elseif (player:getQuestStatus(0,60) == 1) and (player:hasKeyItem(CurillasBottle1) == 1) then
	player:startEvent(Event(0x35));
elseif (player:getQuestStatus(0,60) == 1) and (player:hasKeyItem(CurillasBottle2) == 1) then
	player:startEvent(Event(0x36));
elseif (player:getMainJob() == 5) and (player:getMainLvl() >= AF2_QUEST_LEVEL) and (player:getQuestStatus(0,84) == 2) and (player:getQuestStatus(0,85) == 0) then
	player:startEvent(Event(0x5E));
elseif (player:getQuestStatus(0,85) == 2) and (player:getQuestStatus(0,86) == 0) then
	player:startEvent(Event(0x6D));
elseif (player:getQuestStatus(0,86) == 1) and ((player:getVar("peace_for_the_spirit_status") >= 2) and (player:getVar("peace_for_the_spirit_status") <= 4)) then
	player:startEvent(Event(0x71));
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 5) then
	player:startEvent(Event(0x33));
elseif (player:getQuestStatus(0,86) == 2) then
	player:startEvent(Event(0x34));
elseif (player:getQuestStatus(0,86) == 1) then
	player:startEvent(Event(0x6C));
elseif (player:getQuestStatus(0,85) == 2) and (player:getQuestStatus(0,86) == 0) then
	player:startEvent(Event(0x72));
elseif (player:getVar("BOOTS_BURRIED_AT") > 0) then
	player:showText(npc,1008);
elseif (player:hasKeyItem(CrawlerBlood) == 1) then
  player:startEvent(Event(0x75)); -- wiki mentions another event here but that seems like an error. She told you to find the blood AND bury the boots.
elseif (player:hasKeyItem(OldBoots) == 1) and (player:getVar("needs_crawler_blood") == 0) then
  player:startEvent(Event(0x65));
elseif (player:getVar("needs_crawler_blood") == 1) then
  player:startEvent(Event(0x75));
elseif (player:getQuestStatus(0,85) == 1) and (player:hasKeyItem(OldPocketWatch) == 1) then
	player:startEvent(Event(0x5D));
else
  player:startEvent(Event(0x212));
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
if (csid == 0x37) and (option == 1) then 
  player:addKeyItem(CurillasBottle1);
  player:specialMessage(KEYITEM_OBTAINED,CurillasBottle1);
  player:addQuest(0,60)
elseif (csid == 0x36) then 
  player:removeKeyItem(CurillasBottle2);
  player:specialMessage(ITEM_OBTAINED,LynxBaghnakhs);
  player:addItem(LynxBaghnakhs);
  player:completeQuest(0,60);
  player:addFame(0,SAN_FAME*80); -- I made up that number. I have no idea how much fame this quest should give.
elseif (csid == 0x5E) and (option == 1) then
	player:addKeyItem(OldPocketWatch);
  player:specialMessage(KEYITEM_OBTAINED,OldPocketWatch);
  player:addQuest(0,85)
elseif (csid == 0x6D) and (option == 1) then
  player:addQuest(0,86)
elseif (csid == 0x65) then 
	player:setVar("needs_crawler_blood",1);
end;
end;