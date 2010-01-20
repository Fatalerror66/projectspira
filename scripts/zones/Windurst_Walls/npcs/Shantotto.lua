-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Shantotto
--	Starts and ends quests "Curses,Foiled Again!" "Curses,Foiled...Again!?" and "Curses,Foiled A-Golem!?" (first quest may be finished)
--	Starts and ends the staff WS "Retribution" unlock quest.
--	Starts Aht Urghan missions 20,23 and 25.
--	Involved in Windurst Mission 8-2.
--	Involved in Promathia Mission 3-3.
--	Involved in Aht Urghan Missions 19,20,21,22,24,39,and 47.
--	Involved in quests "Nothing Matters" and "Wonder Wands."
--	Involved in all BLM AF quests.
--	Involved in SMN AF2 quest.
-- 	Involved in quest "Lure of the Wildcat."  See Ibwam for designated bitmask values.		(complete)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");

--[[ events

01BB 
00A3 
00A4 
00A5 
00AB 
00AC 
00AD 
00AE 
00B1 
00B2 
00B4 
00B5 
00B7 
00B8 
0154 
0155 
0156 
0157 
00E7 CS with Koru-Moru
0158 BLM AF1 quest?
015B BLM AF quest
018C Windurst 8-2
018D Windurst 8-2
018E Windurst 8-2
018F takes away the Glove of Perpetual Twilight after 8-2, keeps rings too.
0199 
01A5 armor designed by Karaha-Baruha
01BC 
01B8 
01BD 
01BE 
01BF 
01C0 
01C1 
01C2 
01D5 
01DB 
01D9 
01E0 talks about Prishe and Diablos
2718 KO frequency
01F2 
01FA 

--]]

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
local curses = player:getVar("cursesFoiledAgain");

--Check to see if player needs her text for quest "Lure of the Wildcat."
local wildcat = player:getVar("lureOfTheWildcat-Windurst");
local wildcatcount = player:getVar("lureOfTheWildcat-W-Counter");
local wildcatc = testflag(tonumber(wildcatcount),0x40);
--DEBUG ONLY
--print("Wildcat: ",wildcat);
--print("WildcatCount: ",wildcatcount);
--print("WildcatC: ",wildcatc);
if (wildcat == 1 and wildcatc == false) then
	player:startEvent(Event(0x1f2));
	player:setVar("lureOfTheWildcat-W-Counter",wildcatcount+0x40);
--elseif (player:getMissionStatus(2,21) == 1) and (player:getVar("mission_status") == 7) then
--	event = Event(0x18C); -- optistery ring missing, not sure where this fits in.
--	event:setParams(1,2,3,4,5,6,7,8);
--	player:startEvent(event);
elseif (player:getMissionStatus(2,21) == 1) and (player:getVar("mission_status") == 6) then
	event = Event(0x18D);
	event:setParams(0,0,0,GloveOfPerpetualTwilight);
	player:startEvent(event);
elseif (player:getMissionStatus(2,21) == 1) and (player:getVar("mission_status") == 7) then
	event = Event(0x18E);
	event:setParams(0,OptisteryRing,0,GloveOfPerpetualTwilight); -- OptisteryRing in this dialog is unconfirmed. But it seems like the most
	player:startEvent(event); --  reasonable choice since Karaha-Baruha was the head of the Optistery.
elseif (player:getMissionStatus(2,21) == 2) and (player:hasKeyItem(GloveOfPerpetualTwilight) == 1) then
	event = Event(0x18F);
	event:setParams(0,0,0,GloveOfPerpetualTwilight);
	player:startEvent(event);
else
	--Check status of quest "Curses,Foiled Again!"
	if (curses == 0) then
		--Offer quest
		local event0xab = Event(0xab);
		event0xab:setParams(0,0,0,0,0,0,0x3a0,0x370);
		player:startEvent(event0xab);
	elseif (curses == 1) then
		--During quest
		local event0xac = Event(0xac);
		event0xac:setParams(0,0,0,0,0,0,0x3a0,0x370);
		player:startEvent(event0xac);
	elseif (curses == 2) then
		player:startEvent(Event(0xae));
	end
end 
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local curses = player:getVar("cursesFoiledAgain");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x3a0,1);
item2 = trade:hasItemQty(0x370,2);
if (curses == 1 and count == 3 and item1 == true and item2 == true) then
	--Complete quest "Curses, Foiled Again!"
	trade:isComplete();
	local event0xad = Event(0xad);
	event0xad:setParams(0x42b9,0,0,0,0,0,0x3a0,0x370);
	player:startEvent(event0xad);
	player:addItem(0x42b9);
	player:setVar("cursesFoiledAgain",2);
	player:addFame(2,WIN_FAME*40);
	--print("Windurst fame adjusted for",player:getName(),"by 40 (Total:",player:getFame(2),").");
	player:completeQuest(2,32);
	player:setTitle(135);
end 
end; 
 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0xab and option == 3) then
	--Accept quest "Curses, Foiled Again!"
	player:setVar("cursesFoiledAgain",1);
	player:addQuest(2,32);
	player:setTitle(134);
elseif (csid == 0x18D) then
	player:addKeyItem(GloveOfPerpetualTwilight);
	player:specialMessage(KEYITEM_OBTAINED,GloveOfPerpetualTwilight);
	player:setVar("mission_status",7);
elseif (csid == 0x18E) and (DEBUG_MODE) then
	toManustery(player);
elseif (csid == 0x18F) then
	player:removeKeyItem(OptisteryRing);
	player:removeKeyItem(AurasteryRing);
	player:removeKeyItem(RhinosteryRing);
	player:removeKeyItem(ManusteryRing);
	player:removeKeyItem(OrasteryRing);
	player:removeKeyItem(GloveOfPerpetualTwilight);
	player:specialMessage(KEYITEM_OBTAINED + 1,OptisteryRing);
	player:specialMessage(KEYITEM_OBTAINED + 1,AurasteryRing);
	player:specialMessage(KEYITEM_OBTAINED + 1,RhinosteryRing);
	player:specialMessage(KEYITEM_OBTAINED + 1,ManusteryRing);
	player:specialMessage(KEYITEM_OBTAINED + 1,OrasteryRing);
	player:specialMessage(KEYITEM_OBTAINED + 1,GloveOfPerpetualTwilight);
end
end;