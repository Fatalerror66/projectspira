-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Nanaa Mihgo
--	She starts the quests "Mihgo's Amigo" and "Rock Racketeer."  She also starts THF AF quests.
-- 	She is also involed in the quest "Lure of the Wildcat."  See Ibwam for designated bitmask values.
--	She is also a part of Windurst Mission 2-1 and starts THF AF1 "The Tenshodo Showdown."
-----------------------------------
-- Includes

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/Gearsets");

LetterFromTheTenshodo = 0xB7;
SignedEnvelope = 0xB9;
TenshodoEnvelope = 0xB8;
GangWhereaboutsNote = 0xBA;
FirstForgedEnvelope = 0xBB;
SecondForgedEnvelope = 0xBC;
FirstSignedForgedEnvelope = 0xBD;
SecondSignedForgedEnvelope = 0xBE;
CatBurglarsNote = 0xCA;


-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


function testflag(set,flag)
return (set % (2*flag) >= flag)
end
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Lure of the Wildcat variables
local wildcat = player:getVar("lureOfTheWildcat-Windurst");
local wildcatcount = player:getVar("lureOfTheWildcat-W-Counter");
local wildcatc = testflag(tonumber(wildcatcount),0x10);
--Mihgo's Amigo variables
local amigo = player:getVar("mihgosAmigo");
local onionknow = player:getVar("knowOnesOnions"); --some text changes with this quest

--Check status of quest "Lure of the Wildcat"
if (wildcat == 1 and wildcatc == false) then
	player:startEvent(Event(0x2dc));
	player:setVar("lureOfTheWildcat-W-Counter",wildcatcount+0x10);
elseif (player:hasKeyItem(LapisCoral) == 1) then
	player:startEvent(Event(0xA9));
elseif (player:hasKeyItem(HideoutKey) == 1) then
	player:startEvent(Event(0xAA));
elseif (player:getMissionStatus(2,3) == 1) and (player:getVar("mission_status") == 2) then -- Windurst mission 2-1
	event = Event(0xA5);
	event:setParams(0,LapisCoral,LapisMonocle);
	player:startEvent(event);
elseif (player:getMissionStatus(2,3) == 1) and (player:getVar("mission_status") == 3) then -- Windurst mission 2-1
	event = Event(0xA6);
	event:setParams(0,LapisCoral,LapisMonocle);
	player:startEvent(event);
elseif player:getMainLvl() >=AF1_QUEST_LEVEL and player:getMainJob() == 6 and player:getQuestStatus(2,69) == 0 then -- THF AF1
	player:startEvent(Event(0x1F0));
elseif player:getVar("THF_AF1_status") == 1 then
	player:startEvent(Event(0x1F1));
elseif player:getVar("THF_AF1_status") >= 3 then
	player:startEvent(Event(0x1F2));
elseif player:getMainLvl() >=AF2_QUEST_LEVEL and player:getMainJob() == 6 and player:getQuestStatus(2,69) == 2 and player:getQuestStatus(2,70) == 0 then -- THF AF2
	event = Event(0x1F8);
	event:setParams(0,SignedEnvelope,TenshodoEnvelope);
	player:startEvent(event);
elseif player:getVar("THF_AF2_TOWER") == 7 and player:getVar("THF_AF2_GAMBLING") == 8 then
	player:startEvent(Event(0x1FC));
elseif player:getVar("THF_AF2_status") == 2 then -- in case inventory was full
	player:startEvent(Event(0x1FD));
elseif player:getVar("THF_AF2_status") == 1 then
	event = Event(0x1F9);
	event:setParams(0,GangWhereaboutsNote);
	player:startEvent(event);
elseif player:getQuestStatus(2,69) == 2 and player:getQuestStatus(2,70) == 0 then -- between AF1 and AF2
	player:startEvent(Event(0x1F7));
elseif player:getQuestStatus(2,70) == 2 and player:getQuestStatus(2,71) == 0 and player:getMainJob() == 6 then  -- start AF3. Purposely ignoring the rezoning requirement. Wiki says job level is not checked for AF3.
	player:startEvent(Event(0x200));
elseif player:getVar("THF_AF3_STATUS_1") == 1 and player:getVar("THF_AF3_STATUS_2") == 1 then
	player:startEvent(Event(0x201));
elseif player:getVar("THF_AF3_STATUS_1") == 3 and player:getVar("THF_AF3_STATUS_2") == 3 then
	player:startEvent(Event(0x204));
elseif player:getVar("THF_AF3_STATUS_2") == 4 then
	player:startEvent(Event(0x205));
else
	--Check status of quest "Mihgo's Amigo" (uses events 0x50 to 0x5c)
	if (amigo == 0) then
		if (onionknow < 4) then
			player:startEvent(Event(0x50));
		elseif (onionknow >= 4) then
			player:startEvent(Event(0x51));
		end
		player:setVar("mihgosAmigo",1);
		player:addQuest(2,25);
	elseif (amigo == 1) then
		player:startEvent(Event(0x52));
	elseif (amigo == 2) then
		--most likely need to zone between trades; I prefer not having to do this
		player:startEvent(Event(0x59));
	end
end 
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local amigo = player:getVar("mihgosAmigo");
local onionknow = player:getVar("knowOnesOnions"); --some text changes with this quest
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x1f2,4);
if (amigo ~= 0 and count == 4 and item1) then
	if (onionknow >= 4) then
		--dialogue after completing quest "Know One's Onions"
		local event0x5c = Event(0x5c);
		event0x5c:setParams(200);
		player:startEvent(event0x5c);
	else
		local event0x58 = Event(0x58);
		event0x58:setParams(200);
		player:startEvent(event0x58);
	end
	player:setVar("mihgosAmigo",2);
	trade:isComplete();
	--rewards
	player:addGil(GIL_RATE*200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
	--From ffxiclopedia: "You will need at least 212 Yagudo Necklaces in total to achieve Lv.4 Tenshodo Fame."
	--Level 4 fame is equivalent to 900 fame points.  900 / (212/4)  = 16.98.
	player:addFame(3,NORG_FAME*17);
	--print("Norg fame adjusted for",player:getName(),"by 17 (Total:",player:getFame(3),").");
	player:completeQuest(2,25);
	player:setTitle(115);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0xA5) and (option ==1) then
	player:setVar("mission_status",3);
	player:addKeyItem(LapisMonocle);
	player:specialMessage(KEYITEM_OBTAINED,LapisMonocle);
	r = math.random(0,12); -- determining which of the 14 Fossil Rocks will contain the Lapis Coral. 
	if (r == 8) then	   -- rock #8 spawns NM and can't contain Lapis Coral.
		r = 13;
	end;			
	player:setVar("lapiscoral",r);
elseif (csid == 0xA6) and DEBUG_MODE then
	player:setPos(128,20,-120,64,0xC6);
elseif (csid == 0xA9) then
	player:addKeyItem(HideoutKey);
	player:specialMessage(KEYITEM_OBTAINED,HideoutKey);
	player:getVar("lapiscoral",0);
	player:setVar("mission_status",4);
	player:removeKeyItem(LapisCoral);
elseif (csid == 0xAA) and DEBUG_MODE then
	toCatBurglarsHideout(player)
elseif (csid == 0x1F0) then
	player:addQuest(2,69);
	player:setVar("THF_AF1_status",1);
	player:addKeyItem(LetterFromTheTenshodo);
	player:specialMessage(KEYITEM_OBTAINED,LetterFromTheTenshodo);
elseif (csid == 0x1F1) and DEBUG_MODE then
	player:setPos(43, 0, -20, 222, 0xF5); -- Lower Jeuno
elseif (csid == 0x1F8) and (option == 1) then
	player:setVar("THF_AF2_status",1);
	player:addQuest(2,70);
	player:addKeyItem(GangWhereaboutsNote);
	player:specialMessage(KEYITEM_OBTAINED,GangWhereaboutsNote);
	player:addKeyItem(FirstForgedEnvelope);
	player:specialMessage(KEYITEM_OBTAINED,FirstForgedEnvelope);
	player:addKeyItem(SecondForgedEnvelope);
	player:specialMessage(KEYITEM_OBTAINED,SecondForgedEnvelope);
	player:setVar("THF_AF2_TOWER",math.random(6));
elseif (csid == 0x1FC) then
	player:setVar("THF_AF2_TOWER",0);
	player:setVar("THF_AF2_GAMBLING",0);
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(RoguesBonnet);
		player:specialMessage(ITEM_OBTAINED,RoguesBonnet);
		player:completeQuest(2,70);
		player:addFame(2,WIN_FAME*AF2_FAME);
		player:setVar("THF_AF2_STATUS",0);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,RoguesBonnet);
		player:setVar("THF_AF2_STATUS",2);
	end;	
elseif (csid == 0x1FD) then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(RoguesBonnet);
		player:specialMessage(ITEM_OBTAINED,RoguesBonnet);
		player:completeQuest(2,70);
		player:addFame(2,WIN_FAME*AF2_FAME);
		player:setVar("THF_AF2_STATUS",0);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,RoguesBonnet);
	end;
elseif csid == 0x200 then
	player:setVar("THF_AF3_STATUS_1",1);
	player:setVar("THF_AF3_STATUS_2",1);
	player:addQuest(2,71);
	player:addKeyItem(CatBurglarsNote);
	player:specialMessage(KEYITEM_OBTAINED,CatBurglarsNote);
elseif csid == 0x201 and DEBUG_MODE then
	player:setPos(43, 0, -20, 222, 0xF5); -- Lower Jeuno
elseif csid == 0x204 then
	player:setVar("THF_AF3_STATUS_2",4);
elseif csid == 0x205 then
	player:setPos(-74, 55, -440, 50, 0x66); -- to La Theine Plateau H-10
end;
end;