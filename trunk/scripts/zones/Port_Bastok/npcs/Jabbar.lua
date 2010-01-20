-----------------------------------
--	Author: Tenjou
-- 	Jabbar
-- 	Gives qualified players a Tenshodo application.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
tenshodo = player:getVar("tenshodoMembership");
if (tenshodo == 2) then
	tenshodoapp = player:getVar("tenshodoMe-Application");
	if (tenshodoapp == 0) then
		player:startEvent(Event(0x97));
		player:addKeyItem(0x79);
		player:setVar("tenshodoMe-Application",1);
	elseif (tenshodoapp == 1) then
		player:startEvent(Event(0x98));
	end
else
	player:startEvent(Event(0x96));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 