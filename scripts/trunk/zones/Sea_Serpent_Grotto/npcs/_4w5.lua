-----------------------------------
--	Author: Bababooey
-- 	Silver Door
-- 	Normal Text
-----------------------------------

-- Includes
require("scripts/globals/settings");
require("scripts/zones/Sea_Serpent_Grotto/Zone");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


if(player:getXPos() < 280) then
 player:specialMessage(SSG_SPEECH_OFFSET+21);	
else
 npc:setState(10);
end;
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
beastcoin = trade:hasItemQty(750,1)

if(count == 1 and beastcoin) then
	npc:setState(10);
end;

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;