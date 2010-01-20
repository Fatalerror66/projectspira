-----------------------------------
--	Author: Scriptkiddie
-- 	ShimmeringLight / Lycopodium
--	@pos	-258 	-3 	204
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
require("scripts/zones/North_Gustaberg/TextIDs");

function onTrigger(player,npc)



-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--DEBUG
--player:setVar("Lycopodium_Gustaberg_S",1);

Lycopodium = player:getVar("Lycopodium_Gustaberg_S");

 if Lycopodium == 1 then 
   player:startEvent(Event(0x0107)); -- The sparkling light seems vaguely familiar to you  (You can now trade a flower if you get this message) 
 else
    player:specialMessage(STRANGE_LIGHT); -- The ground is sparkling with a strange light
end;

end; 
 

-----------------------------------
-- onTrade Action  
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: ",count);

  if (Lycopodium == 1) then -- You have Visited the Lycopodium in North_Gustaberg[s] 
  -- Check for a Valid Flower
    item1  = trade:hasItemQty(957,1);    -- Amaryllis
    item2  = trade:hasItemQty(2554,1);   -- Asphodel 
    item3  = trade:hasItemQty(948,1);    -- Carnation
    item4  = trade:hasItemQty(1120,1);   -- Casablanca
    item5  = trade:hasItemQty(1413,1);   -- Cattleya
    item6  = trade:hasItemQty(959,1);    -- Dahlia
    item7  = trade:hasItemQty(956,1);    -- Lilac
    item8  = trade:hasItemQty(958,1);    -- Marguerite
    item9  = trade:hasItemQty(949,1);    -- Rain Lily
    item10 = trade:hasItemQty(1725,1);   -- Snow Lily

	if (count == 1 and item1 or item2 or item3 or item4 or item5 or item6 or item7 or item8 or item9 or item10 == true) then -- 1 Item in Trade Window & its a Valid Flower
	  player:startEvent(Event(0x0109));  -- CS: Warps you DOWN the cliff
	  trade:isComplete();  -- Remove 1 Valid flower from the players inventory
	end;
  end;

end;
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
 --print("CSID:",csid);
 --print("RESULT:",option);
end;