-----------------------------------
--	Author: Almendro, ReaperX, Numbaone
-- 	Ayame
-- 	Basic Chat Text & "Lure of the Wildcat (Bastok)"+ Bastok Mission "The Crystal Line"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
XalmoFeather = 1100;
TempleHose = 14215;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end

---- events -------------------------
-- (0x032D) opening CS for conflict (Ballista license quest)
-- 0x02C8 final CS for "The Crystal Line"

BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x00200);
	
has_c_l_report = player:hasKeyItem(0xc);
Bastokfamelevel = player:getFameLevel(1);
TrueStrength = player:getQuestStatus(1,53);
TheFirstMeeting = player:getQuestStatus(1,52);
OutoftheDephts = player:getQuestStatus(1,75);
AQuestionofFaith = player:getQuestStatus(1,77);
ReturntotheDephts = player:getQuestStatus(1,78);

OutoftheDephts_temp = player:getVar("OutoftheDephtsprogress"); --Use to record progress of quest
AQuestionofFaith_temp = player:getVar("AQuestionofFaithprogress");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00200);
	player:startEvent(Event(0x3A7));
-----------------------------------
-- "The Crystal Line"
elseif(has_c_l_report == 1) then
  player:startEvent(Event(0x02C8));
-----------------------------------
-- "True Strength"
elseif(TheFirstMeeting == 2 and TrueStrength == 0)then
	player:startEvent(Event(0x2EC));
	player:addQuest(1,53);
	player:setVar("temp_TrueStrength",1);
-----------------------------------
-- "Out of the Dephts"
elseif(OutoftheDephts == 0 and Bastokfamelevel >= 4)then
	player:startEvent(Event(0x35B));  --CS flags "Out of the Dephts"
	player:addQuest(1,75);
elseif(OutoftheDephts == 1 and Bastokfamelevel >= 4)then
	player:startEvent(Event(0x35C));  --CS to Assist with "Out of the Dephts"
---------------------------------------------------
-- "A Question of Faith" -- "Out of the Dephts" is prerequisite quest for "A Question of Faith"
elseif(OutoftheDephts == 2 and Bastokfamelevel >= 4 and AQuestionofFaith == 0) then
	player:startEvent(Event(0x36B));  --CS Prelude to "A Question of Faith"
elseif(OutoftheDephts == 2 and Bastokfamelevel >= 4 and AQuestionofFaith == 1) then
	player:startEvent(Event(0x36C));  --CS to Assist with "A Question of Faith" Quest
	
---------------------------------------------------
-- "Return to the Dephts"--"A Question of Faith" is prerequisite quest for "A Question of Faith"
	elseif(AQuestionofFaith == 2 and Bastokfamelevel >= 5 and ReturntotheDephts == 0) then
	player:startEvent(Event(0x36F)); -- CS flags "Return to the Dephts"
else
	player:startEvent(Event(0x2BD)); -- General chat text
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
XalmoFeather1 = trade:hasItemQty(XalmoFeather,1);
TrueStrength = player:getQuestStatus(1,53);
count = trade:getItemCount();
gil = trade:getGil();
if(XalmoFeather1 and TrueStrength == 1 and count == 1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0x2ED));
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x02C8) then
	add_rank_points_for_mission(player);
	player:completeMission(1,3);
	player:setVar("mission_status",0);
	player:removeKeyItem(0xc);
elseif(csid == 0x2ED)then
	player:completeQuest(1,53);
	player:addFame(1,BAS_FAME*350);
	player:addItem(TempleHose);
	player:specialMessage(ITEM_OBTAINED,TempleHose);
	player:setTitle(219); -- Paragon of Monk Excellence 
elseif(csid == 0x35B)then  
	player:completeQuest(1,75); -- This line needs to be removed once Port Bastok is fixed, 12/26/09
	player:setVar("OutoftheDephtsprogress",1);
elseif(csid == 0x36B)then       --CS Prelude to "A Question of Faith"
	player:setVar("AQuestionofFaithprogress",1);
elseif(csid == 0x36F)then       --CS event flags "Return to the Dephts"
	player:setVar("AQuestionofFaithprogress",nil);
	player:setVar("ReturntotheDephtsprogress",1);
	player:addQuest(1,78);
end
end;