-----------------------------------
--	Author: Tenjou,Trin
--  	Holla Telepoint
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
--onTrigger Action-- (Trin)
-----------------------------------
function onTrigger(player,npc)
if(player:hasKeyItem(0x160) ~= 1) then
	player:addKeyItem(0x160);
	player:specialMessage(KEYITEM_OBTAINED,0x160);
else
	player:specialMessage(976);--You already possess the gate crystal for this telepoint.
end
end; 
 

-----------------------------------
-- onTrade Action (Tenjou)
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