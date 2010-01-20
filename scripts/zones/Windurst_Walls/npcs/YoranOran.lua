-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Yoran-Oran
-- 	Starts and ends quest "Mandragora-Mad" (complete,check fame levels)
--	Involved in BLM AF quests.
--	Involved in quest "Blast from the Past"
--	Involved in Promathia Mission 3-3
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local mandy = player:getVar("mandragoraMad");

cop_status1 = player:getMissionStatus(6,19);
cop_status2 = player:getMissionStatus(6,20);
cop_status3 = player:getMissionStatus(6,21);

comedy_of_errors_status = player:getVar("ComedyofErrors");  -- using this variable for all 3 parts of "Memories of a Maiden"
												
--print("CoP/Comedy of Errors Status : ",cop_status1, cop_status2 , cop_status3, comedy_of_errors_status)

if (cop_status1 ==1) and (comedy_of_errors_status == 1) then
  player:startEvent(Event(0x01D5));
elseif (cop_status1 ==1) and (comedy_of_errors_status == 2) then
  player:startEvent(Event(0x01DA)); 															-- followup CS to 0x01D5
elseif (cop_status2 ==1) and (comedy_of_errors_status == 4) then
  event = Event(0x01D6);
  event:setParams(0,0x24B,0x245,0x24A);
  player:startEvent(event); 															        -- need mimeo feathers from mimeo jewel
elseif (cop_status2 ==1) and (comedy_of_errors_status == 5) then
  player:startEvent(Event(0x01DC)); 															-- repeat, need mimeo feathers from mimeo jewel
elseif (cop_status3 ==1) and (comedy_of_errors_status == 6) then    -- fixing mirror now
  player:startEvent(Event(0x01D7)); 										
elseif (cop_status3 ==1) and (comedy_of_errors_status == 7) then    -- repeat, fixing mirror now
  player:startEvent(Event(0x01DD)); 										
elseif (cop_status3 ==1) and (comedy_of_errors_status == 9) then    -- final CS for 3-3B3 "Exit Stage Left"
  player:startEvent(Event(0x01D8)); 										
elseif (comedy_of_errors_status == 10) then    											-- repeats information
  player:startEvent(Event(0x01DE)); 										

elseif (mandy == 0) then
	player:startEvent(Event(0xf9));
	player:setVar("mandragoraMad",1);
	player:addQuest(2,34);
else
	player:startEvent(Event(0x100));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local wf = player:getFame(2);

count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x43c0,1);
item2 = trade:hasItemQty(0x3a6,1);
item3 = trade:hasItemQty(0x482,1);
item4 = trade:hasItemQty(0x1111,1);
item5 = trade:hasItemQty(0x47e,1);
if (count == 1 and item1 == true) then
	--cornette trade
	player:removeItem(0x43c0,1);
	local event0xfb = Event(0xfb);
	event0xfb:setParams(200);
	player:startEvent(event0xfb);
	player:addGil(GIL_RATE*200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
	player:addFame(2,WIN_FAME*10);
	--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
	player:completeQuest(2,34);
elseif (count == 1 and item2 == true) then
	--sulfur trade
	player:removeItem(0x3a6,1);
	local event0xfc = Event(0xfc);
	event0xfc:setParams(250);
	player:startEvent(event0xfc);
	player:addGil(GIL_RATE*250);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*250);
	player:addFame(2,WIN_FAME*25);
	--print("Windurst fame adjusted for",player:getName(),"by 25 (Total:",player:getFame(2),").");
	player:completeQuest(2,34);
elseif (count == 1 and item3 == true) then
	--three leaf bud trade
	player:removeItem(0x482,1);
	local event0xfd = Event(0xfd);
	event0xfd:setParams(1200);
	player:startEvent(event0xfd);
	player:addGil(GIL_RATE*1200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*1200);
	player:addFame(2,WIN_FAME*50);
	--print("Windurst fame adjusted for",player:getName(),"by 50 (Total:",player:getFame(2),").");
	player:completeQuest(2,34);
elseif (count == 1 and item4 == true) then
	--four leaf bud trade
	player:removeItem(0x1111,1);
	local event0xfe = Event(0xfe);
	event0xfe:setParams(120);
	player:startEvent(event0xfe);
	player:addGil(GIL_RATE*120);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*120);
	player:addFame(2,WIN_FAME*10);
	--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
	player:completeQuest(2,34);
elseif (count == 1 and item5 == true) then
	--snobby letter trade
	player:removeItem(0x47e,1);
	local event0xff = Event(0xff);
	event0xff:setParams(5500,0x47e);
	player:startEvent(event0xff);
	player:addGil(GIL_RATE*5500);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*5500);
	player:addFame(2,WIN_FAME*100);
	--print("Windurst fame adjusted for",player:getName(),"by 100 (Total:",player:getFame(2),").");
	player:completeQuest(2,34);
else
	--other trade: no reward
	player:startEvent(Event(0xfa));
end
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x01D5) then
  player:setVar("ComedyofErrors",2); -- time to go to Timbre Timbers Tavern (F-10) in Waters and talk to Kyume-Romeh
elseif (csid == 0x01D6) then
  player:setVar("ComedyofErrors",5); -- time to kill Lioumere and go up Parradamo Tor 
elseif (csid == 0x01D7) then
  player:setVar("ComedyofErrors",7); -- next: go to Yujuju in Port Windurst
elseif (csid == 0x01D8) then
  player:setVar("ComedyofErrors",10); -- Windurstian part of 3.3 complete
  player:completeMission(6,21);       -- CoP 3.3B3 "Exit Stage Left" complete
  player:completeMission(6,18);       -- CoP 3.3B "Memories of a Maiden" complete
  --print("The Road Forks Status:", player:getMissionStatus(6,13));
  --print("Emerald Waters Status:", player:getMissionStatus(6,14));
  --print("Memories of a Maiden Status:", player:getMissionStatus(6,18));
end;
end;