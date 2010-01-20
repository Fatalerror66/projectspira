-----------------------------------
--	Author: Tenjou
-- 	Hariga-Origa
-- 	Starts and ends quest "Glyph Hanger."
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local hanger = player:getVar("glyphHanger");
if (hanger == 0) then
	player:startEvent(Event(0x17d));
elseif (hanger == 1) then
	player:startEvent(Event(0x17e));
elseif (hanger == 2) then
	--Complete quest.
	player:startEvent(Event(0x181));
	player:removeKeyItem(0x1a);
	player:addKeyItem(0x189);
	player:setVar("glyphHanger",3);
	player:addFame(2,WIN_FAME*40);
	player:completeQuest(2,30);
elseif (hanger == 3) then
	player:startEvent(Event(0x182));
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
	--Accept quest "Glyph Hanger"
	player:setVar("glyphHanger",1);
	player:addKeyItem(0x19);
	player:addQuest(2,30);
end
end;