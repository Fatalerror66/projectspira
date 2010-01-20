-----------------------------------
--	Author: Tenjou
-- 	Guddal
-- 	Issues the key item "Airship Pass for Kazham."  The options are to pay 148,000 gil,or the more popular chest keys trade.
--	I have intentionally blocked out the option to buy the pass,since for some reason I can't get him to check gil.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
pass = player:hasKeyItem(0x9);
event0x12c = Event(0x12c);
if (pass == 1) then
	event0x12c:setParams(0,0,0,0,0,6,0,0);
else
	event0x12c:setParams(0,0,0,0,0,2,0,0);
end
player:startEvent(event0x12c);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
--DELETE THE BELOW IF UNUSED--

item1slot=0;
item2slot=0;
item3slot=0;
for i=1,table.getn(tradedItemsId) do -- Check all traded Items
	if (tradedItemsId[i]==0x400) then 
		item1slot=tradedItemsSlot[i];
	end
	if (tradedItemsId[i]==0x401) then
		item2slot=tradedItemsSlot[i];
	end
	if (tradedItemsId[i]==0x402) then
		item3slot=tradedItemsSlot[i];
	end
end
local pass = 0; --player:hasKeyItem(0x9);
if (pass == 0) then
	if (item1slot >= 1 and item2 == trueslot >= 1 and item3 == trueslot >= 1) then
		player:startEvent(Event(0x12d));
		player:removeItem(item1slot,1);
		player:removeItem(item2slot,1);
		player:removeItem(item3slot,1);
		player:addKeyItem(0x9);
	else
		player:startEvent(Event(0x12e));
	end
end
--DELETE THE ABOVE IF UNUSED--
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("OPTION:",option);
--option 55: went to buy but then listened about airships
--option 99: not enough gil
--option nil: no consequent action
end;