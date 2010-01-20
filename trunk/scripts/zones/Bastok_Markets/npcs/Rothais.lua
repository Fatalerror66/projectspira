-----------------------------------
--	Author: ChrisKara10
--  Rothais
--  Involved in the Quest "Gourmet"
-----------------------------------
-- Includes
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
Gourmet = player:getQuestStatus(1,12);
FFTime = getVanaHour();
GourmetJustDone = player:getVar("GourmetJustDone");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	-- if "Gourmet" not active,triger normal CS --
	if (Gourmet == 0 or (Gourmet == 2 and GourmetJustDone == 1)) then
		player:startEvent(Event(0x7A));
		-- if "Gourmet" active or finish(repeat) and time is between 6pm-6am --  
	elseif (gourmet ~= 0 and FFTime >= 18 or FFTime <= 5) then
		player:startEvent(Event(0xCC));
		-- if "Gourmet" active or finish(repeat) and time is between 6am-12pm --  
	elseif (gourmet ~= 0 and FFTime >= 6 or FFTime <= 11) then
		player:startEvent(Event(0xCD));
		-- if "Gourmet" active or finish (repeat) and time is between 12pm-6pm --  
	elseif (gourmet ~= 0 and FFTime >= 12 or FFTime <= 17) then
		player:startEvent(Event(0xCE));
	end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 