-----------------------------------
--	Author: Arcanedemon
-- 	Bartolomeo
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
WelcometoBastok = player:getQuestStatus(1,2);
 GuestofHauteur = player:getQuestStatus(1,3);
    ShellShield = 0x307F;
if( WelcometoBastok == 1 and player:getEquip(2) == ShellShield and player:getVar("WelcometoBastok") == 1) then
	player:startEvent(Event(0x34));
else
	player:startEvent(Event(0x8C));
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
if(csid == 0x34)then
	player:setVar("WelcometoBastok",2);
end
end;