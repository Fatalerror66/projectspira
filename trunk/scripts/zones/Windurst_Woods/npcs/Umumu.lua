-----------------------------------
--	Author: Tenjou
-- 	Umumu
-- 	Working 100%.  Also involved in quest "Lure of the Wildcat."  See Ibwam for designated bitmask values.
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
local wildcatc = testflag(tonumber(wildcatcount),8);
--print("Wildcat: ",wildcat);
--print("WildcatCount: ",wildcatcount);
--print("WildcatC: ",wildcatc);
if (wildcat == 1 and wildcatc == false) then
	player:startEvent(Event(0x2db));
	player:setVar("lureOfTheWildcat-W-Counter",wildcatcount+8);
else
	--Check status of quest "Making Headlines"
	local news = player:getVar("makingHeadlines");
	local watersscoop = player:hasKeyItem(0x28);
	local wallsscoop = player:hasKeyItem(0x29);
	local portscoop = player:hasKeyItem(0x2a);
	local woodscoop = player:hasKeyItem(0x2b);
	if (news == 1) then
		if (woodsscoop ~= 1) then
			player:startEvent(Event(0x17d));
			player:addKeyItem(0x2b);
			if (watersscoop == 1 and wallsscoop == 1 and portscoop == 1) then
				player:setVar("makingHeadlines",2);
			end
		else
			player:startEvent(Event(0x17e));
		end
	else
		--normal text
		player:startEvent(Event(0x19e));
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
end;