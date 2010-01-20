-----------------------------------
--	Author: Tenjou
--	Yujuju
--	Working 100%.  Also involved in quest "Lure of the Wildcat."  See Ibwam for designated bitmask values.
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
local wildcatc = testflag(tonumber(wildcatcount),0x80000);
--print("Wildcat: ",wildcat);
--print("WildcatCount: ",wildcatcount);
--print("WildcatC: ",wildcatc);

cop_status = player:getMissionStatus(6,21);
comedy_of_errors_status = player:getVar("ComedyofErrors");

if (wildcat == 1 and wildcatc == false) then
	player:startEvent(Event(0x26d));
	player:setVar("lureOfTheWildcat-W-Counter",wildcatcount+0x80000);
elseif (cop_status == 1) and (comedy_of_errors_status == 7) then
  player:startEvent(Event(0x0250));
elseif (cop_status == 1) and (comedy_of_errors_status == 8) then
  player:startEvent(Event(0x0251));
else
	--Check status of quest "Making Headlines"
	local news = player:getVar("makingHeadlines");
	local watersscoop = player:hasKeyItem(0x28);
	local wallsscoop = player:hasKeyItem(0x29);
	local portscoop = player:hasKeyItem(0x2a);
	local woodscoop = player:hasKeyItem(0x2b);
	if (news == 1) then
		if (portscoop ~= 1) then
			player:startEvent(Event(0x13a));
			player:addKeyItem(0x2a);
			if (watersscoop == 1 and wallsscoop == 1 and woodsscoop == 1) then
				player:setVar("makingHeadlines",2);
			end
		else
			player:startEvent(Event(0x13b));
		end
	else
		--normal text
		player:startEvent(Event(0x154));
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
if (csid == 0x0250) then
  player:setVar("ComedyofErrors",8); -- next: go to Tosuka-Porika in Windurst Waters at (G-8).
end;
end;