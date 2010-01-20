-----------------------------------
--	Author: ReaperX
-- 	Rahal
-- 	Basic Chat Text, Sandy Mission 8-2
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");
-----------------------------------
--[[ events

003C CS for "The Holy Crest" (DRG job quest) (gives key item dragon curse remedy)
007A CS for "The Holy Crest" (DRG job quest) (repeats information)
006A CS for Sandy mission 8-2 "Lightbringer". Gives keyitem crystal dowser.
006B repeats instructions for 6A
0069 "So you were unable to locate Lightbringer.. Well, to our surprise, Curilla's expeditionary forces returned yesterday with the sword."
002A "To tell you the truth, I had my doubts about the Treasure of the Dragon King, but Curilla managed to find it. Still, I am vexed by this--why was the sword on that island??"
0025 "Rochefogne was slain? If if was not one of the royal knights, then.. No, it is not possible."
0026 "the rites of succession.. at last our new leader will be chosen.."
0027 9-2 (talks about the expedition to FeiYin)
0028 9-2 (thanks you for protecting the prince)
0029 9-2 "now that Lightbringer has been sealed in the Dragon King's tomb.."
0211 default event
0220 "I understand his lordship's fervor, but the risk is too great for us. I believe this requires the utmost caution." (after 5-1)
004D "Commendable work. With our mortal enemy vanquished, we must now restore glory to San d'Oria. Your cooperation is expected!" (after 5-2)
0079 opening CS for DRG AF3 "Knight Stalker"
0078 CS for DRG AF3 "Knight Stalker" (after you turn the quest down once?)
0077 repeats information for 0x78/79
004E CS for DRG AF3 after returning with key item "Challenge to the Royal Knights"
0045 repeats information for 0x4E
006E CS for DRG AF3 after speaking with Balasiel.
0076 after finishing DRG AF3
0216 (Halver CS for 5-1 "The Ruins of Fei'Yin" (after completing BCNM))
022F "Lure of the Wildcat" quest

--]]
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if ((player:getMissionStatus(0,14) == 2) and (player:getMissionStatus(0,15) == 0)) or ((player:getMissionStatus(0,15) == 1) and (mission_status <= 3)) then
	player:startEvent(Event(0x220));	
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x6A));	
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x6B));	
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 5) then
	player:startEvent(Event(0x69));		     
elseif (player:getMissionStatus(0,22) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x25));	
elseif (player:getMissionStatus(0,21) == 2) and (player:getMissionStatus(0,22) <= 1) then
	player:startEvent(Event(0x2A));	
elseif (player:getMissionStatus(0,22) == 2) and (player:getMissionStatus(0,23) == 0) then
	player:startEvent(Event(0x26));	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status >= 3) and (mission_status <= 4) then
	player:startEvent(Event(0x27)) 	
elseif (player:getMissionStatus(0,23) == 1) and ((mission_status == 6) or (mission_status == 7)) then
	player:startEvent(Event(0x28)) 	
elseif ((player:getMissionStatus(0,23) == 1) and (mission_status == 8)) or ((player:getRank() == 10) and (player:getNation() == 0)) then
	player:startEvent(Event(0x29)) 	
elseif ((player:getMissionStatus(0,15) == 1) and (mission_status == 4)) or (player:getMissionStatus(0,15) == 2) then
	player:startEvent(Event(0x4D)); -- starting at player's victory over the shadow lord, this is the new default message.
else
	player:startEvent(Event(0x211));
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
if (csid == 0x6A) then
	player:setVar("mission_status",3);
	player:addKeyItem(CrystalDowser);
	player:specialMessage(KEYITEM_OBTAINED,CrystalDowser);
elseif (csid == 0x6B) and (DEBUG_MODE) then
	player:setPos(-50, -17, -137, 64, 0x9f);	-- to Temple of Uggalepih
end
end;