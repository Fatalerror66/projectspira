-----------------------------------
--	Author: Arcanedemon
-- 	Sutarara
-- 	Basic Chat Text -- Also triggers Tenshodo Invite quest for players fame level 2 and above.
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
if (tenshodo <= 2) then
	player:startEvent(Event(0x00D0));
	famejeu = math.floor((player:getFame(0) + player:getFame(1) + player:getFame(2))/3);
	if (famejeu >= 200 and tenshodo == 0) then
		player:setVar("tenshodoMembership",1);
	end
else
	player:startEvent(Event(0xd3));
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