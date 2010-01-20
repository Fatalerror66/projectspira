-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Kyume-Romeh
-- 	Involved in,among other things,the quest "Lure of the Wildcat."  See Ibwam for designated bitmask values.
--	Involved in quest "Hat in Hand." (complete).
--	Involved in quest "Making Headlines" (complete).
--  Involved in CoP Mission Comedy of Errors, Act I
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


function testflag(set,flag)
return (set % (2*flag) >= flag)
end
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local wildcat = player:getVar("lureOfTheWildcat-Windurst");
local wildcatcount = player:getVar("lureOfTheWildcat-W-Counter");
local wildcatc = testflag(tonumber(wildcatcount),0x4000);
--print("Wildcat: ",wildcat);
--print("WildcatCount: ",wildcatcount);
--print("WildcatC: ",wildcatc);

cop_status1 = player:getMissionStatus(6,19);
cop_status2 = player:getMissionStatus(6,20);
comedy_of_errors_status = player:getVar("ComedyofErrors");

if (wildcat == 1 and wildcatc == false) then
	player:startEvent(Event(0x3ab));
	player:setVar("lureOfTheWildcat-W-Counter",wildcatcount+0x4000);
elseif (cop_status1 == 1) and (comedy_of_errors_status == 2) then
  player:startEvent(Event(0x0369));
elseif (cop_status2 == 1) and (comedy_of_errors_status == 3) then
  player:startEvent(Event(0x036E));
else
	--Check status of quest "Hat in Hand"
	local hat = player:getVar("hatInHand");
	local kyumeromeh = player:getVar("hatInHand-KyumeRomehCS");
	if (hat == 1 and kyumeromeh == 0) then
		--NEEDS A PACKET 2A
		player:startEvent(Event(0x3c));
		player:setVar("hatInHand-KyumeRomehCS",1);
	else
		--Check status of quest "Making Headlines"
		local news = player:getVar("makingHeadlines");
		local watersscoop = player:hasKeyItem(0x28);
		local wallsscoop = player:hasKeyItem(0x29);
		local portscoop = player:hasKeyItem(0x2a);
		local woodscoop = player:hasKeyItem(0x2b);
		if (news == 1) then
			if (watersscoop ~= 1) then
				player:startEvent(Event(0x29c));
				player:addKeyItem(0x28);
				if (wallsscoop == 1 and portscoop == 1 and woodsscoop == 1) then
					player:setVar("makingHeadlines",2);
				end
			else
				player:startEvent(Event(0x29d));
			end
		else
			--normal text
			player:startEvent(Event(0x25c));
		end
	end
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
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x0369) then
  player:completeMission(6,17);       -- CoP 3.3B1 "Comedy of Errors, Act I" complete
  player:currentMission(6,20);        -- now on 3.3B2 "Comedy of Errors, Act II"
  player:setVar("ComedyofErrors",3); -- next leg: Ohbiru-Dohbiru. 
end
end;