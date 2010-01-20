-----------------------------------
--	Author: Tenjou
-- 	WAR WARLOCK: Puroiko-Maiko
-- 	Little is known about gate guards right now.
--argument 1: NATION: 01 is sandy,11 is Bastok and 21 is windy,31 and 41,etc automatically give you signet,other numbers with a different ones digit acts like other nation's outpost guards
--argument 2: expeditionary force bitmask
--argument 3: expeditionary force options: greater than a0 = you only need 5 members,greater than f0 = you only need 4,otherwise you still need 6
--argument 4: supply quests bitmask: the first bit controls if you can do a quest,the rest control 4 of the options including blank options
--0x400: targ ID??
--argument 6: controls what services he will offer??
--argument 7: conquest points
--argument 8: greater than c00 means you completed an expedition successfully,otherwise you get the normal services
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


nation = player:getNation();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (nation == 2) then
	local event0x7ff7 = Event(0x7ff7);
	event0x7ff7:setParams(0x21,0x7fffffff,0xef,0x7f40001f,0xffffffff,0x40,0xffff,0);
	player:startEvent(event0x7ff7);
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