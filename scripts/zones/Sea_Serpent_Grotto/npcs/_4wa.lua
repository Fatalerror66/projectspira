-----------------------------------
--	Author: Bababooey
-- 	Ornamented door
-- 	Normal Text
-----------------------------------

-- Includes
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


if(player:getZPos() < 40) then
	player:specialMessage(SSG_SPEECH_OFFSET+10);
else
	player:specialMessage(SSG_SPEECH_OFFSET+11);
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
SahaginKey = trade:hasItemQty(1197,1);

if(player:getZPos() > 40) then
	if(count == 1 and SahaginKey) then
		player:startEvent(Event(0x0067));
		trade:isComplete();
	end;
else
	player:specialMessage(SSG_SPEECH_OFFSET+13);
end;
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x67) then
	--Not sure why this message doesn't work if it's in param2 alone
	player:specialMessage(SSG_SPEECH_OFFSET+12,1197,1197);
end;
end;