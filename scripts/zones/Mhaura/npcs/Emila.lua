-----------------------------------
--	Author: Tenjou
-- 	FORTUNE TELLER: Emila
-- 	Gives a small quest which can reward HQ food.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--ARGUMENT 1: Player's gil.
--ARGUMENT 2: Quest flag toggle.
--ARGUMENT 3: Friend's title.
--ARGUMENT 4: Lucky color/proverb.
--ARGUMENT 5: Direction, relative to argument 4.
--ARGUMENT 6: Friend's title after payment.
gil = player:getCurrGil();
event0x144 = Event(0x144);
event0x144:setParams(gil,0,1,0,0,0);
player:startEvent(event0x144);
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
if (option == 0) then
	player:removeGil(200);
end
end;