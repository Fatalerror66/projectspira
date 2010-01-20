-----------------------------------
--	Author: Tenjou
--	Three of Clubs
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
local wildcatc = testflag(tonumber(wildcatcount),0x40000);
--print("Wildcat: ",wildcat);
--print("WildcatCount: ",wildcatcount);
--print("WildcatC: ",wildcatc);
if (wildcat == 1 and wildcatc == false) then
	player:startEvent(Event(0x271));
	player:setVar("lureOfTheWildcat-W-Counter",wildcatcount+0x40000);
else
	player:startEvent(Event(0xde));
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