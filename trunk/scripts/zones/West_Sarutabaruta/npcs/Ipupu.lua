-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Ipupu
-- 	Involved in quest "Glyph Hanger."
--  default dialog needs to be checked on retail, currently same as Maata Ulaata. 

require("scripts/globals/settings");
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
require("scripts/zones/West_Sarutabaruta/TextIDs");

-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

local hanger = player:getVar("glyphHanger");
if (hanger == 1) then
	local event0x2f = Event(0x2f);
	event0x2f:setParams(0,0x19);
	player:startEvent(event0x2f);
	player:setVar("glyphHanger",2);
	player:removeKeyItem(0x19);
	player:addKeyItem(0x1a);
else
	player:showText(npc,SIGNS + 12); -- Hello-wello! This is the central tower of the Horutoto Ruins. It's one of the several ancient-wancient magic towers which dot these grasslands.
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
if (csid == 0x17d and option ~= 1) then
	player:setVar("glyphHanger",1);
end
end;