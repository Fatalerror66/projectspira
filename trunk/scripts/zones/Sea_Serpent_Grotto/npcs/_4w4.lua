-----------------------------------
--	Author: Bababooey
-- 	Gold Door
-- 	Normal Text
-----------------------------------

-- Includes
require("scripts/globals/settings");
require("scripts/zones/Sea_Serpent_Grotto/Zone");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


if(player:getZPos() > -80) then
	player:specialMessage(SSG_SPEECH_OFFSET+23);
	--print(npc:getZPos());
else
	npc:setState(10);
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
beastcoin = trade:hasItemQty(748,1)

if(count == 1 and beastcoin) then
	npc:setState(10);
end;

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;