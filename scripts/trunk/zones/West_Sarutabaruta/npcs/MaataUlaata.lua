---------------------------------------------------------------------
--	Author: ReaperX
-- 	Maata Ulaata
--  guards the central tower in West Saru.
--  default dialog needs to be checked on retail, currently same as Ipupu.
---------------------------------------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
require("scripts/zones/West_Sarutabaruta/TextIDs");

---------------------------------------------------------------------
-- onTrigger Action
---------------------------------------------------------------------
function onTrigger(player,npc)
	player:showText(npc,SIGNS + 12); -- Hello-wello! This is the central tower of the Horutoto Ruins. It's one of the several ancient-wancient magic towers which dot these grasslands.
end; 
 

---------------------------------------------------------------------
-- onTrade Action
---------------------------------------------------------------------
function onTrade(player,npc,trade)
end; 
 
---------------------------------------------------------------------
-- onEventFinish Action
---------------------------------------------------------------------
function onEventFinish(player,csid,option)
end;