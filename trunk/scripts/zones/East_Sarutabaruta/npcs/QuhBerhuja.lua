-----------------------------------
--	Author: ReaperX
-- 	Quh Berhuja
-- 	Guards the tower at J-11 in East Saru.
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("scripts/zones/East_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getMissionStatus(2,1) == 1) and (mission_status == 7) then
	player:showText(npc,MISSIONS + 5) -- "Yowl! That was a close call, with those ferrral Carrrdians barrrging in therrre! Of courrrse, I rrran away...for help, I mean..."
	if DEBUG_MODE then
		toManustery(player);
	end;
else	
	player:showText(npc,MISSIONS + 3) -- "Hold on therrre! This ain't no place forrr adventurrrers to just wanderrr in and out of! Withdrrraw immediately!"
end; 
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
end; 